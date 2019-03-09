package cn.ly.demo.book.controller;

import cn.ly.demo.base.dao.LoanDao;
import cn.ly.demo.base.dao.LogDao;
import cn.ly.demo.base.dao.OrderDao;
import cn.ly.demo.base.entity.Loan;
import cn.ly.demo.base.entity.LoanList;
import cn.ly.demo.base.entity.Log;
import cn.ly.demo.base.entity.Order;
import cn.ly.demo.base.util.MailUtil;
import cn.ly.demo.base.util.SysConstant;
import cn.ly.demo.book.bo.BookBo;
import cn.ly.demo.book.entity.Book;
import cn.ly.demo.book.util.BarCodeHelper;
import cn.ly.demo.book.util.Util;
import cn.ly.demo.user.bo.UserBo;
import cn.ly.demo.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class BookController {
    @Autowired
    HttpServletRequest request;
    @Autowired
    private BookBo bookBo;
    @Autowired
    private UserBo userBo;
    @Autowired
    private LogDao logDao;
    @Autowired
    private LoanDao loanDao;
    @Autowired
    private OrderDao orderDao;

    private static List<String> tags = new ArrayList<>();

    static {
        tags.add("计算机");
        tags.add("文学");
        tags.add("经典");
    }


    @RequestMapping(path = "/book/books")
    public String getBookList(Model model) {
        List<Book> books = bookBo.getBookList(0, 10);
        model.addAttribute("books", books);
        model.addAttribute("uLevel", userBo.getCurrentLevel(request));
        return userBo.isChinese(request) ? "book/zh-cn/bookList" : "/book/en-us/bookList";
    }

    @RequestMapping(path = "/book/barcode/{bookId}")
    public String getBookBarcode(@PathVariable String bookId, Model model) {
        String path = request.getServletContext().getRealPath(File.separator + "images");
        path = path + File.separator + "book" + File.separator + "barcode" + File.separator + bookId + ".png";
        BarCodeHelper.createBookBarcode(path, bookId);
        String EAN13 = Util.bookIdToEAN13(bookId);
        model.addAttribute("imgName", bookId + ".png");
        model.addAttribute("barcodeValue", EAN13);
        return userBo.isChinese(request) ? "book/zh-cn/showBookBarcode" : "/book/en-us/showBookBarcode";
    }

    @RequestMapping(path = "/book/addBook", method = RequestMethod.GET)
    public String addBook() {
        return userBo.isChinese(request) ? "book/zh-cn/addBook" : "/book/en-us/addBook";
    }

    @RequestMapping(path = "/book/addBook", method = RequestMethod.POST)
    @ResponseBody
    public String handleAddBook(String ISBN, String title, String author, String tag, String press, String pubDate, String location, String count) {
        for (int i = 0; i < Integer.valueOf(count); i++) {
            bookBo.addBook(ISBN, title, author, tag, press, pubDate, location);
        }
        return "<script>alert('Success');window.history.back();</script>";
    }

    @RequestMapping(path = "/book/search", method = RequestMethod.GET)
    public String toSearch(Model model) {
        List<Book> books = bookBo.getBookListByKey("");
        model.addAttribute("books", books);
        model.addAttribute("uLevel", userBo.getCurrentLevel(request));
        return userBo.isChinese(request) ? "book/zh-cn/bookList" : "/book/en-us/bookList";
    }

    @RequestMapping(path = "/book/search", method = RequestMethod.POST)
    public String HanldeSearch(String keyWord, Model model) {
        keyWord = null == keyWord ? "" : keyWord;
        List<Book> books = bookBo.getBookListByKey(keyWord);
        model.addAttribute("books", books);
        model.addAttribute("uLevel", userBo.getCurrentLevel(request));
        return userBo.isChinese(request) ? "book/zh-cn/bookList" : "/book/en-us/bookList";
    }

    @RequestMapping(path = "/book/borrow")
    public String getBorrowBookLsit(Model model) {
        User user = userBo.getCurrentUser(request);
        Book book = new Book();
        Loan loan = new Loan();
        List<LoanList> loanLists = new ArrayList<>();
        loan.setUserId(user.getId());
        List<Loan> loans = loanDao.getLoanListByUserId(loan);
        for (Loan in : loans) {
            book = bookBo.getBookById(in.getBookId());
            user = userBo.getUserById(in.getUserId());
            LoanList loanList = new LoanList();
            loanList.setLoanId(in.getId());
            loanList.setBookId(String.valueOf(in.getBookId()));
            loanList.setTitle(book.getTitle());
            loanList.setAuthor(book.getAuthor());
            loanList.setPress(book.getPress());
            loanList.setUser(user.getName() + "(" + user.getId() + ")");
            loanList.setLendingDate(in.getLendingDate());
            loanList.setStatus(in.getStatus());
            if ("已还".equals(in.getStatus())) {
                loanList.setFine("-");
            } else {
                long sumMM = new Date().getTime() - in.getLendingDate().getTime();
                long sumDay = sumMM / (1000 * 3600 * 24);
                if (sumDay > SysConstant.maxLendingTime) {
                    loanList.setFine(String.valueOf((sumDay - SysConstant.maxLendingTime) * SysConstant.overdueFine / 100) + "￥");
                } else {
                    loanList.setFine("-");
                }
                loanLists.add(loanList);
            }
        }
        model.addAttribute("loanLists", loanLists);
        model.addAttribute("uLevel", userBo.getCurrentLevel(request));
        return userBo.isChinese(request) ? "book/zh-cn/loanBookListForReader" : "/book/en-us/loanBookListForReader";
    }

    @RequestMapping(path = "/book/yiHuan")
    public String getReturnBookList(Model model) {
        User user = userBo.getCurrentUser(request);
        Book book = new Book();
        Loan loan = new Loan();
        List<LoanList> loanLists = new ArrayList<>();
        loan.setUserId(user.getId());
        List<Loan> loans = loanDao.getLoanListByUserId(loan);
        for (Loan in : loans) {
            book = bookBo.getBookById(in.getBookId());
            user = userBo.getUserById(in.getUserId());
            LoanList loanList = new LoanList();
            loanList.setLoanId(in.getId());
            loanList.setBookId(String.valueOf(in.getBookId()));
            loanList.setTitle(book.getTitle());
            loanList.setAuthor(book.getAuthor());
            loanList.setPress(book.getPress());
            loanList.setUser(user.getName() + "(" + user.getId() + ")");
            loanList.setLendingDate(in.getLendingDate());
            loanList.setStatus(in.getStatus());
            if ("已还".equals(in.getStatus())) {
                loanList.setFine("-");
                loanLists.add(loanList);
            } else {
                long sumMM = new Date().getTime() - in.getLendingDate().getTime();
                long sumDay = sumMM / (1000 * 3600 * 24);
                if (sumDay > SysConstant.maxLendingTime) {
                    loanList.setFine(String.valueOf((sumDay - SysConstant.maxLendingTime) * SysConstant.overdueFine / 100) + "￥");
                } else {
                    loanList.setFine("-");
                }
            }
        }
        model.addAttribute("loanLists", loanLists);
        model.addAttribute("uLevel", userBo.getCurrentLevel(request));
        return userBo.isChinese(request) ? "book/zh-cn/loanBookListForReader" : "/book/en-us/loanBookListForReader";
    }


    @RequestMapping(path = "/book/update/{bookId}", method = RequestMethod.GET)
    public String getBookUpdate(@PathVariable String bookId, Model model) {
        Book book = bookBo.getBookById(Integer.valueOf(bookId));
        model.addAttribute("book", book);
        return userBo.isChinese(request) ? "book/zh-cn/editBook" : "/book/en-us/editBook";
    }

    @RequestMapping(path = "/book/update/{bookId}", method = RequestMethod.POST)
    @ResponseBody
    public String handleBookUpdate(@PathVariable String bookId, Model model, String ISBN, String title, String author, String tag, String press, String pubDate, String location, String status) {
        Book book = bookBo.getBookById(Integer.valueOf(bookId));
        book.setISBN(ISBN);
        book.setTitle(title);
        book.setAuthor(author);
        book.setTag(tag);
        book.setPress(press);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        try {
            date = sdf.parse(pubDate);
        } catch (Exception e) {
            e.printStackTrace();
        }
        book.setPublishDate(date);
        book.setLocation(location);
        book.setStatus(status);
        bookBo.updateBookById(book);
        return "<script>alert('Success');window.history.back(-1);</script>";
    }

    @RequestMapping(path = "/book/delete/{bookId}", method = RequestMethod.GET)
    @ResponseBody
    public String bookDelete(@PathVariable String bookId, Model model) {
        Book book = bookBo.getBookById(Integer.valueOf(bookId));
        bookBo.deleteBookById(book);
        Log log = new Log();
        log.setUserId(userBo.getCurrentUser(request).getId());
        log.setDate(new Date());
        log.setType("删除书籍");
        log.setNote("书籍信息(" + book.getId() + "-" + book.getTitle() + "-" + book.getAuthor() + "-" + book.getPress() + ")");
        logDao.addLog(log);
        return "<script>alert('Success');window.history.back(0);</script>";
    }

    @RequestMapping(path = "/book/allLoan")
    public String getLoanList(Model model) {
        User user = new User();
        Book book = new Book();
        List<Loan> loans = loanDao.getLoanList(0, 10);
        List<LoanList> loanLists = new ArrayList<>();
        for (Loan loan : loans) {
            book = bookBo.getBookById(loan.getBookId());
            user = userBo.getUserById(loan.getUserId());
            LoanList loanList = new LoanList();
            loanList.setLoanId(loan.getId());
            loanList.setBookId(String.valueOf(loan.getBookId()));
            loanList.setTitle(book.getTitle());
            loanList.setAuthor(book.getAuthor());
            loanList.setPress(book.getPress());
            loanList.setUser(user.getName() + "(" + user.getId() + ")");
            loanList.setLendingDate(loan.getLendingDate());
            loanList.setStatus(loan.getStatus());
            if ("已还".equals(loan.getStatus())) {
                loanList.setFine("-");
            } else {
                long sumMM = new Date().getTime() - loan.getLendingDate().getTime();
                long sumDay = sumMM / (1000 * 3600 * 24);
                if (sumDay > SysConstant.maxLendingTime) {
                    loanList.setFine(String.valueOf((sumDay - SysConstant.maxLendingTime) * SysConstant.overdueFine / 100) + "￥");
                } else {
                    loanList.setFine("-");
                }
            }
            loanLists.add(loanList);
        }
        model.addAttribute("loanLists", loanLists);
        model.addAttribute("uLevel", userBo.getCurrentLevel(request));
        return userBo.isChinese(request) ? "book/zh-cn/loanBookListForReader" : "/book/en-us/loanBookListForReader";
    }

    @RequestMapping(path = "/book/order/{bookId}")
    @ResponseBody
    public String orderBook(@PathVariable String bookId) {
        Book book = bookBo.getBookById(Integer.valueOf(bookId));
        book.setStatus("已预约");
        Order order = new Order();
        order.setBookId(Integer.valueOf(bookId));
        order.setUserId(userBo.getCurrentUser(request).getId());
        order.setOrderTime(new Date());
        bookBo.updateBookById(book);
        orderDao.addOrder(order);
        return "<script>alert('Success');window.history.back(-3);</script>";
    }

    @RequestMapping(path = "/book/payFine/{loanId}")
    @ResponseBody
    public String handlePayFine(@PathVariable String loanId) {
        returnBook(Integer.valueOf(loanId));
        return "<script>alert('Success');window.history.back(-1);</script>";
    }

    @RequestMapping(path = "/book/return/{loanId}")
    @ResponseBody
    public String handleReturn(@PathVariable String loanId) {
        returnBook(Integer.valueOf(loanId));
        return "<script>alert('Success');window.history.back(-1);</script>";
    }

    @RequestMapping(path = "/book/warn/{loanId}")
    @ResponseBody
    public String sendWarn(@PathVariable String loanId) {
        Loan loan = loanDao.getLoanById(Integer.valueOf(loanId));
        User user = userBo.getUserById(loan.getUserId());
        Book book = bookBo.getBookById(loan.getBookId());
        MailUtil mailUtil = new MailUtil();
        mailUtil.setToAddress(user.getEmail());
        if (userBo.isChinese(request)) {
            mailUtil.setMailSubject("逾期提醒 -Bibliosoft");
            mailUtil.setMailContent(user.getName() + "(" + user.getId() + ")" + "您好，您的所借阅图书：" + book.getTitle() + "(" + book.getPress() + ")" + "已经逾期，请尽快归还！");
            System.out.println(user.getName() + "(" + user.getId() + ")" + "您好，您的所借阅图书：" + book.getTitle() + "(" + book.getPress() + ")" + "已经逾期，请尽快归还！");
        } else {
            mailUtil.setMailSubject("Overdue reminding  -Bibliosoft");
            mailUtil.setMailContent(user.getName() + "(" + user.getId() + ")" + "Hello，The books you borrowed：" + book.getTitle() + "(" + book.getPress() + ")" + "are overdue， Please return them as soon as possible ！");
        }
        try {
            mailUtil.send();
        } catch (Exception e) {
            return "<script>alert('Error !');window.history.back();</script>";
        }
        return "<script>alert('Success');window.history.back(-1);</script>";
    }

    @RequestMapping(path = "book/jie/{bookId}")
    @ResponseBody
    public String handleJieShu(@PathVariable String bookId) {
        Book book = bookBo.getBookById(Integer.valueOf(bookId));
        Order order = orderDao.getOrderByBook(book);
        book.setStatus("借出");
        bookBo.updateBookById(book);
        Loan loan = new Loan();
        loan.setBookId(book.getId());
        loan.setUserId(order.getUserId());
        loan.setLendingDate(new Date());
        loan.setStatus("正常");
        loanDao.addLoan(loan);
        orderDao.deleteOrder(order);
        return "<script>alert('Success');window.history.back(-1);</script>";
    }

    @RequestMapping(path = "/book/addTag", method = RequestMethod.GET)
    public String getAddTag(Model model) {
        model.addAttribute("tags", tags);
        return userBo.isChinese(request) ? "book/zh-cn/addTag" : "/book/en-us/addTag";
    }

    @RequestMapping(path = "/book/addTag", method = RequestMethod.POST)
    @ResponseBody
    public String getAddTag(Model model, String tag) {
        tags.add(tag);
        return "<script>alert('Success');window.history.back(-1);</script>";
    }


    private void returnBook(int loanId) {
        Loan loan = loanDao.getLoanById(loanId);
        Book book = bookBo.getBookById(loan.getBookId());
        book.setStatus("在馆");
        bookBo.updateBookById(book);
        loan.setStatus("已还");
        loanDao.updateLoanById(loan);
    }


}
