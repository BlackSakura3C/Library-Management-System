package com.book.web;

import com.book.domain.Book;
import com.book.domain.Document;
import com.book.domain.Reader;
import com.book.service.BookService;
import com.book.service.LendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LendController {

    private LendService lendService;
    @Autowired
    public void setLendService(LendService lendService) {
        this.lendService = lendService;
    }
    private BookService bookService;
    @Autowired
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    /*@RequestMapping("/lendbook.html")
    public ModelAndView bookLend(HttpServletRequest request){
        long documentId=Integer.parseInt(request.getParameter("documentId"));
        Document document =bookService.getDocument(documentId);
        ModelAndView modelAndView=new ModelAndView("admin_book_lend");
        modelAndView.addObject("document",document);
        return modelAndView;
    }*/

    @RequestMapping("/lendbook.html")
    public String bookLendDo(HttpServletRequest request,RedirectAttributes redirectAttributes){
        long documentId=Integer.parseInt(request.getParameter("documentId"));
        long indexId=Integer.parseInt(request.getParameter("indexId"));
        boolean lendsucc=lendService.bookLend(documentId,indexId);
        if (lendsucc){
            redirectAttributes.addFlashAttribute("succ", "图书借阅成功！");
            return "redirect:/mylend.html";
        }else {
            redirectAttributes.addFlashAttribute("succ", "图书借阅成功！");
            return "redirect:/mylend.html";
        }


    }

    @RequestMapping("/reservebook.html")
    public String bookReserveDo(HttpServletRequest request,RedirectAttributes redirectAttributes){
        long documentId=Integer.parseInt(request.getParameter("documentId"));
        long indexId=Integer.parseInt(request.getParameter("indexId"));
        boolean lendsucc=lendService.bookReserve(documentId,indexId);
        if (lendsucc){
            redirectAttributes.addFlashAttribute("succ", "图书预约成功！");
            return "redirect:/mylend.html";
        }else {
            redirectAttributes.addFlashAttribute("succ", "图书预约成功！");
            return "redirect:/mylend.html";
        }


    }

    @RequestMapping("/returnbook.html")
    public String bookReturn(HttpServletRequest request,RedirectAttributes redirectAttributes){
        long documentId=Integer.parseInt(request.getParameter("documentId"));
        long indexId=Integer.parseInt(request.getParameter("indexId"));
        boolean retSucc=lendService.bookReturn(documentId,indexId);
        if (retSucc){
            redirectAttributes.addFlashAttribute("succ", "图书归还成功！");
            return "redirect:/mylend.html";
        }
        else {
            redirectAttributes.addFlashAttribute("error", "图书归还失败！");
            return "redirect:/mylend.html";
        }
    }


    @RequestMapping("/lendlist.html")
    public ModelAndView lendList(){

        ModelAndView modelAndView=new ModelAndView("admin_lend_list");
        modelAndView.addObject("list",lendService.lendList());
        return modelAndView;
    }
    @RequestMapping("/mylend.html")
    public ModelAndView myLend(HttpServletRequest request){
        Reader reader =new Reader();
        //Reader reader=(Reader) request.getSession().getAttribute("reader");
        reader.setReaderId(20202021);
        ModelAndView modelAndView=new ModelAndView("reader_lend_list");
        modelAndView.addObject("list",lendService.myLendList(reader.getReaderId()));
        modelAndView.addObject("rlist",lendService.myReserveList(reader.getReaderId()));
        return modelAndView;
    }




}
