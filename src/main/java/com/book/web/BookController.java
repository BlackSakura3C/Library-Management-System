package com.book.web;

import com.book.domain.*;
import com.book.service.BookService;
import com.book.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Controller
public class BookController {
    private BookService bookService;
    private ReaderService readerService;

    @Autowired
    public void setReaderService(ReaderService readerService) {
        this.readerService = readerService;
    }

    @Autowired
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping("/querybook.html")
    public ModelAndView queryBookDo(HttpServletRequest request, String searchWord) {
        boolean exist = bookService.matchBook(searchWord);
        if (exist) {
            ArrayList<Document> documents = bookService.queryBook(searchWord);
            ModelAndView modelAndView = new ModelAndView("admin_books");
            modelAndView.addObject("documents", documents);
            return modelAndView;
        } else {
            return new ModelAndView("admin_books", "error", "没有匹配的图书");
        }
    }


    @RequestMapping("/reader_querybook.html")
    public ModelAndView readerQueryBook() {
        return new ModelAndView("reader_book_query");

    }

    @RequestMapping("/reader_querybook_do.html")
    public String readerQueryBookDo(HttpServletRequest request, String searchWord, RedirectAttributes redirectAttributes) {
        boolean exist = bookService.matchBook(searchWord);
        if (exist) {
            ArrayList<Document> documents = bookService.queryBook(searchWord);
            redirectAttributes.addFlashAttribute("documents", documents);
            return "redirect:/reader_querybook.html";
        } else {
            redirectAttributes.addFlashAttribute("error", "没有匹配的图书！");
            return "redirect:/reader_querybook.html";
        }

    }

    @RequestMapping("/allbooks.html")
    public ModelAndView allBook() {
        ArrayList<Document> documents = bookService.getAllBooks();
        ModelAndView modelAndView = new ModelAndView("admin_books");
        modelAndView.addObject("documents", documents);
        return modelAndView;
    }

    @RequestMapping("/rank.html")
    public ModelAndView rank() {
        ArrayList<Document> documents1 = bookService.getpopularBooks(1);
        ArrayList<Document> documents2 = bookService.getpopularBooks(2);
        ArrayList<Document> documents3 = bookService.getpopularBooks(3);
        ArrayList<Reader> readers1 = readerService.Frequent(1);
        ArrayList<Reader> readers2 = readerService.Frequent(2);
        ArrayList<Reader> readers3 = readerService.Frequent(3);
        ModelAndView modelAndView = new ModelAndView("rank");
        modelAndView.addObject("documents1", documents1);
        modelAndView.addObject("documents2", documents2);
        modelAndView.addObject("documents3", documents3);
        modelAndView.addObject("readers1", readers1);
        modelAndView.addObject("readers2", readers2);
        modelAndView.addObject("readers3", readers3);
        return modelAndView;
    }

    @RequestMapping("/book_add_do.html")
    public String addBookDo(BookAddCommand bookAddCommand, RedirectAttributes redirectAttributes) {
        Document document = new Document();
        document.setTitle(bookAddCommand.getTitle());
        document.setPublisher(bookAddCommand.getPublisher());
        document.setPublisherDate(bookAddCommand.getPublisherDate());
        document.setPublisherAddress(bookAddCommand.getPublisherAddress());
        document.setBranch(bookAddCommand.getBranch());

        Book book = new Book();
        book.setAuthorName(bookAddCommand.getAuthorName());
        book.setIsbn(bookAddCommand.getISBN());
//        book.setDocumentId(bookAddCommand.getDocumentId());

        int succ = bookService.addBook(document, book);
//        ArrayList<Document> documents = bookService.getAllBooks();
        if (succ > 0) {
            redirectAttributes.addFlashAttribute("succ", "图书添加成功！");
            return "redirect:/allbooks.html";
        } else if (succ < 0) {
            redirectAttributes.addFlashAttribute("succ", "图书添加失败！");
            return "redirect:/allbooks.html";
        } else {
            redirectAttributes.addFlashAttribute("succ", "图书添加失败！同种图书数量不能超过3本！");
            return "redirect:/allbooks.html";
        }
//        redirectAttributes.addFlashAttribute("succ", "图书添加失败！同种图书数量不能超过3本");
//        return "redirect:/allbooks.html";
    }

    @RequestMapping("/paper_add_do.html")
    public String addPaperDo(PaperAddCommand paperAddCommand, RedirectAttributes redirectAttributes) {
        Paper paper = new Paper();
        paper.setPaperTitle(paperAddCommand.getPaperTitle());
        paper.setPaperAuthor(paperAddCommand.getPaperAuthor());
        paper.setPaperDate(paperAddCommand.getPaperDate());
        paper.setPaperConferenceOrJournalName(paperAddCommand.getPaperConferenceOrJournalname());
        paper.setPaperIssue(paperAddCommand.getPaperIssue());
        paper.setPaperVolume(paperAddCommand.getPaperVolume());
        paper.setPaperPage(paperAddCommand.getPaperPage());
        paper.setPaperDOI(paperAddCommand.getPaperDoi());

        int succ = bookService.addPaper(paper);
        if (succ > 0) {
            redirectAttributes.addFlashAttribute("succ", "论文添加成功！");
            return "redirect:/admin_papers.html";
        } else {
            redirectAttributes.addFlashAttribute("succ", "论文添加失败！");
            return "redirect:/admin_papers.html";
        }
    }


    @RequestMapping("/deletebook.html")
    public String deleteBook(HttpServletRequest request, RedirectAttributes redirectAttributes) {
        long bookId = Integer.parseInt(request.getParameter("copyId"));
        int res = bookService.deleteBook(bookId);

        if (res == 1) {
            redirectAttributes.addFlashAttribute("succ", "图书删除成功！");
            return "redirect:/allbooks.html";
        } else {
            redirectAttributes.addFlashAttribute("error", "图书删除失败！");
            return "redirect:/allbooks.html";
        }
    }

    @RequestMapping("/book_add.html")
    public ModelAndView addBook(HttpServletRequest request) {
        return new ModelAndView("admin_book_add");
    }

    @RequestMapping("/paper_add.html")
    public ModelAndView addPaper(HttpServletRequest request) {
        return new ModelAndView("admin_paper_add");
    }

    /*@RequestMapping("/updatebook.html")
    public ModelAndView bookEdit(HttpServletRequest request){
        long bookId=Integer.parseInt(request.getParameter("bookId"));
        Book book=bookService.getBook(bookId);
        ModelAndView modelAndView=new ModelAndView("admin_book_edit");
        modelAndView.addObject("detail",book);
        return modelAndView;
    }

    @RequestMapping("/book_edit_do.html")
    public String bookEditDo(HttpServletRequest request,BookAddCommand bookAddCommand,RedirectAttributes redirectAttributes){
        long bookId=Integer.parseInt( request.getParameter("id"));
        Book book=new Book();
        book.setBookId(bookId);
        book.setPrice(bookAddCommand.getPrice());
        book.setState(bookAddCommand.getState());
        book.setPublish(bookAddCommand.getPublish());
        book.setPubdate(bookAddCommand.getPubdate());
        book.setName(bookAddCommand.getName());
        book.setIsbn(bookAddCommand.getIsbn());
        book.setClassId(bookAddCommand.getClassId());
        book.setAuthor(bookAddCommand.getAuthor());
        book.setIntroduction(bookAddCommand.getIntroduction());
        book.setPressmark(bookAddCommand.getPressmark());
        book.setLanguage(bookAddCommand.getLanguage());


        boolean succ=bookService.editBook(book);
        if (succ){
            redirectAttributes.addFlashAttribute("succ", "图书修改成功！");
            return "redirect:/allbooks.html";
        }
        else {
            redirectAttributes.addFlashAttribute("error", "图书修改失败！");
            return "redirect:/allbooks.html";
        }
    }*/


    @RequestMapping("/bookdetail.html")
    public ModelAndView bookDetail(HttpServletRequest request) {
        long documentId = Integer.parseInt(request.getParameter("documentId"));
        Document document = bookService.getDocument(documentId);
        ModelAndView modelAndView = new ModelAndView("admin_book_detail");
        modelAndView.addObject("document", document);
        Book book = bookService.getbook(documentId);
        modelAndView.addObject("book", book);
        Journalvolume journalvolume = bookService.getjournalvolume(documentId);
        modelAndView.addObject("journalvolume", journalvolume);
        Conference conference = bookService.getconference(documentId);
        modelAndView.addObject("conference", conference);
        return modelAndView;
    }


    @RequestMapping("/readerbookdetail.html")
    public ModelAndView readerBookDetail(HttpServletRequest request) {
        long documentId = Integer.parseInt(request.getParameter("documentId"));
        Document document = bookService.getDocument(documentId);
        ModelAndView modelAndView = new ModelAndView("reader_book_detail");
        modelAndView.addObject("document", document);
        Book book = bookService.getbook(documentId);
        modelAndView.addObject("book", book);
        Journalvolume journalvolume = bookService.getjournalvolume(documentId);
        modelAndView.addObject("journalvolume", journalvolume);
        Conference conference = bookService.getconference(documentId);
        modelAndView.addObject("conference", conference);
        return modelAndView;
    }


}
