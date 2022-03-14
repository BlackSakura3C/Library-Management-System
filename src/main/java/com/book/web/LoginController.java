package com.book.web;

import com.book.domain.Admin;
import com.book.domain.Document;
import com.book.domain.Reader;
import com.book.domain.Paper;
import com.book.service.BookService;
import com.book.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;

//标注为一个Spring mvc的Controller
@Controller
public class LoginController {

    private LoginService loginService;

    private BookService bookService;


    @Autowired
    public void setLoginService(LoginService loginService) {
        this.loginService = loginService;
    }

    @Autowired
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    //负责处理login.html请求
    @RequestMapping(value = {"/","/login.html"})
    public String toLogin(HttpServletRequest request){
        request.getSession().invalidate();
        return "index";
    }
    @RequestMapping("/logout.html")
    public String logout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/login.html";
    }


    //负责处理loginCheck.html请求
    //请求参数会根据参数名称默认契约自动绑定到相应方法的入参中
    @RequestMapping(value = "/api/loginCheck", method = RequestMethod.POST)
    public @ResponseBody Object loginCheck(HttpServletRequest request){
        int id=Integer.parseInt(request.getParameter("id"));
        String passwd = request.getParameter("passwd");
                boolean isReader = loginService.hasMatchReader(id, passwd);
                boolean isAdmin = loginService.hasMatchAdmin(id, passwd);
        HashMap<String, String> res = new HashMap<String, String>();
                if (isAdmin==false&&isReader==false) {
                    res.put("stateCode", "0");
                    res.put("msg","账号或密码错误！");
                } else if(isAdmin){
                    Admin admin=new Admin();
                    admin.setAdminId(id);
                    admin.setPassword(passwd);
                    request.getSession().setAttribute("admin",admin);
                    res.put("stateCode", "1");
                    res.put("msg","管理员登陆成功！");
                }else {
                    Reader reader = loginService.findReaderByUserId(id);
                    request.getSession().setAttribute("reader", reader);
                    res.put("stateCode", "2");
                    res.put("msg","读者登陆成功！");
                }
        return res;
    };
    @RequestMapping("/admin_main.html")
    public ModelAndView toAdminMain(HttpServletResponse response) {

            return new ModelAndView("admin_main");
    }


    @RequestMapping("/reader_main.html")
    public ModelAndView toReaderMain(HttpServletResponse response) {
        ArrayList<Document> documents=bookService.getAllBooks();
        ModelAndView modelAndView=new ModelAndView("reader_main");
        modelAndView.addObject("documents",documents);
        return modelAndView;
    }

    @RequestMapping("/visitor.html")
    public ModelAndView toVisitorMain(){
        ArrayList<Document> documents=bookService.getAllBooks();
        ModelAndView modelAndView=new ModelAndView("visitor");
        modelAndView.addObject("documents",documents);
        return modelAndView;
    }

    @RequestMapping("/visitor_books.html")
    public ModelAndView toVisitorBooks(HttpServletRequest request,String searchWord){
        boolean exist=bookService.matchBook(searchWord);
        if (exist){
            ArrayList<Document> documents = bookService.queryBook(searchWord);
            ModelAndView modelAndView = new ModelAndView("visitor_books");
            modelAndView.addObject("documents",documents);
            return modelAndView;
        }
        else{
            return new ModelAndView("visitor_books","error","没有匹配的图书");
        }
    }

    @RequestMapping("/visitor_papers.html")
    public ModelAndView toVisitorPapers(HttpServletRequest request,String searchWord){
        ArrayList<Paper> papers=bookService.getAllPapers();
        ModelAndView modelAndView=new ModelAndView("visitor_papers");
        modelAndView.addObject("papers",papers);
        return modelAndView;
    }

    @RequestMapping("/admin_papers.html")
    public ModelAndView toAdminPapers(HttpServletRequest request,String searchWord){
        ArrayList<Paper> papers=bookService.getAllPapers();
        ModelAndView modelAndView=new ModelAndView("admin_papers_list");
        modelAndView.addObject("papers",papers);
        return modelAndView;
    }

    @RequestMapping("/reader_papers.html")
    public ModelAndView toReaderPapers(HttpServletRequest request,String searchWord){
        ArrayList<Paper> papers=bookService.getAllPapers();
        ModelAndView modelAndView=new ModelAndView("reader_paper_query");
        modelAndView.addObject("papers",papers);
        return modelAndView;
    }

    @RequestMapping("paper_delete.html")
    public String paperDelete(HttpServletRequest request,RedirectAttributes redirectAttributes){
        int paperId= Integer.parseInt(request.getParameter("paperId"));
        boolean success=bookService.deletePaper(paperId);

        if(success){
            redirectAttributes.addFlashAttribute("succ", "删除成功！");
            return "redirect:/admin_papers.html";
        }else {
            redirectAttributes.addFlashAttribute("error", "删除失败！");
            return "redirect:/admin_papers.html";
        }
    }

    @RequestMapping("/querypaper.html")
    public ModelAndView queryPaperDo(HttpServletRequest request,String searchWord){
        boolean exist=bookService.matchPaper(searchWord);
        if (exist){
            ArrayList<Paper> papers = bookService.queryPaper(searchWord);
            ModelAndView modelAndView = new ModelAndView("admin_papers_list");
            modelAndView.addObject("papers",papers);
            return modelAndView;
        }
        else{
            return new ModelAndView("admin_papers_list","error","没有匹配的论文");
        }
    }

//    @RequestMapping("/visitor_paper_find.html")
//    public ModelAndView toVisitorPaper(HttpServletRequest request,String searchWord){
//        boolean exist=bookService.matchPaper(searchWord);
//        if (exist){
//            ArrayList<Paper> papers = bookService.qu(searchWord);
//            ModelAndView modelAndView = new ModelAndView("visitor_books");
//            modelAndView.addObject("documents",documents);
//            return modelAndView;
//        }
//        else{
//            return new ModelAndView("visitor_books","error","没有匹配的图书");
//        }
//    }


    @RequestMapping("/admin_repasswd.html")
    public ModelAndView reAdminPasswd() {

        return new ModelAndView("admin_repasswd");
    }

    @RequestMapping("/admin_repasswd_do")
    public String reAdminPasswdDo(HttpServletRequest request,String oldPasswd,String newPasswd,String reNewPasswd,RedirectAttributes redirectAttributes ) {

        Admin admin=(Admin) request.getSession().getAttribute("admin");
        long id=admin.getAdminId();
        String passwd=loginService.getAdminPasswd(id);

        if(passwd.equals(oldPasswd)){
            boolean succ=loginService.adminRePasswd(id,newPasswd);
            if (succ){

                redirectAttributes.addFlashAttribute("succ", "密码修改成功！");
                return "redirect:/admin_repasswd.html";
            }
            else {
                redirectAttributes.addFlashAttribute("error", "密码修改失败！");
                return "redirect:/admin_repasswd.html";
            }
        }else {
            redirectAttributes.addFlashAttribute("error", "旧密码错误！");
            return "redirect:/admin_repasswd.html";
        }
    };

    //配置404页面
     @RequestMapping("*")
     public String notFind(){
     return "404";
       }


}
