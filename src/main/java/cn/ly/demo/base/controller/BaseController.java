package cn.ly.demo.base.controller;

import cn.ly.demo.base.dao.LoanDao;
import cn.ly.demo.base.dao.LogDao;
import cn.ly.demo.base.dao.NoteDao;
import cn.ly.demo.base.dao.ProfileDao;
import cn.ly.demo.base.entity.Loan;
import cn.ly.demo.base.entity.Log;
import cn.ly.demo.base.entity.Note;
import cn.ly.demo.base.entity.Profile;
import cn.ly.demo.base.util.MailUtil;
import cn.ly.demo.base.util.SysConstant;
import cn.ly.demo.book.bo.BookBo;
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
import java.util.Date;
import java.util.List;

@Controller
public class BaseController {
    @Autowired
    private LogDao logDao;
    @Autowired
    private UserBo userBo;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private NoteDao noteDao;
    @Autowired
    private LoanDao loanDao;
    @Autowired
    private BookBo bookBo;
    @Autowired
    private ProfileDao profileDao;

    @RequestMapping(path = "/logs")
    public String getLogList(Model model) {
        List<Log> logs = logDao.getLogList(0, 10);
        model.addAttribute("logs", logs);
        return userBo.isChinese(request) ? "base/zh-cn/logList" : "/base/en-us/logList";
    }

    @RequestMapping(path = "/user/addNote", method = RequestMethod.GET)
    public String getAddNote() {
        return userBo.isChinese(request) ? "base/zh-cn/addNote" : "/base/en-us/addNote";
    }

    @RequestMapping(path = "/user/addNote", method = RequestMethod.POST)
    @ResponseBody
    public String handleAddNote(String title, String content) {
        User user = userBo.getCurrentUser(request);
        Note note = new Note();
        note.setHead(title);
        note.setBody(content);
        note.setDate(new Date());
        note.setUserId(user.getId());
        noteDao.addNote(note);
        return "<script>alert('Success');window.history.back();</script>";
    }

    @RequestMapping(path = "/retrievePw", method = RequestMethod.GET)
    public String getRetrievePw() {
        return userBo.isChinese(request) ? "base/zh-cn/getPw" : "/base/en-us/getPw";
    }

    @RequestMapping(path = "/retrievePw", method = RequestMethod.POST)
    @ResponseBody
    public String handleRetrievePw(String account) {
        User user = userBo.getUserById(Integer.valueOf(account));
        MailUtil mailUtil = new MailUtil();
        mailUtil.setToAddress(user.getEmail());
        if (userBo.isChinese(request)) {
            mailUtil.setMailSubject("密码找回 -Bibliosoft");
            mailUtil.setMailContent(user.getName() + "(" + user.getId() + ")" + "您好，您的密码为：" + user.getPassword());
        } else {
            mailUtil.setMailSubject("Retrieve the password -Bibliosoft");
            mailUtil.setMailContent(user.getName() + "(" + user.getId() + ")" + "Hello，Your passowrd is：" + user.getPassword());
        }
        try {
            mailUtil.send();
        } catch (Exception e) {
            return "<script>alert('Error !');window.history.back();</script>";
        }
        return "<script>alert('Success');window.history.back();</script>";
    }

    @RequestMapping(path = "/income", method = RequestMethod.GET)
    public String getIncome(Model model) {
        List<Loan> loans = loanDao.getLoanList(0, 999);
        int fine = 0;
        for (Loan in : loans) {
            if ("逾期".equals(in.getStatus())) {
                long sumMM = new Date().getTime() - in.getLendingDate().getTime();
                long sumDay = sumMM / (1000 * 3600 * 24);
                in.setFine((int) (sumDay - SysConstant.maxLendingTime) * SysConstant.overdueFine);
                loanDao.addLoan(in);
                fine += +(int) (sumDay - SysConstant.maxLendingTime) * SysConstant.overdueFine;
            }
        }
        fine = fine / 100;
        int readerCount = userBo.getReaderCount();
        int yaJin = readerCount * SysConstant.deposit;
        yaJin = yaJin / 100;
        System.out.println(yaJin);
        model.addAttribute("fine", fine);
        model.addAttribute("yajin", yaJin);
        return userBo.isChinese(request) ? "base/zh-cn/income" : "/base/en-us/income";
    }

    @RequestMapping(path = "/sys/{key}", method = RequestMethod.GET)
    public String getUpdateProfile(@PathVariable String key, Model model) {
        int value = 0;
        if ("yajin".equals(key))
            value = SysConstant.deposit / 100;
        if ("fajin".equals(key))
            value = SysConstant.overdueFine / 100;
        if ("jyts".equals(key))
            value = SysConstant.maxLendingTime;
        model.addAttribute("key", key);
        model.addAttribute("value", value);
        return userBo.isChinese(request) ? "base/zh-cn/editProfile" : "/base/en-us/editProfile";
    }

    @RequestMapping(path = "/sys/{key}", method = RequestMethod.POST)
    @ResponseBody
    public String handleUpdateProfile(@PathVariable String key, String value, Model model) {
        Profile profile = profileDao.getProfileByKey(key);
        if ("yajin".equals(key))
            SysConstant.deposit = Integer.valueOf(value) * 100;
        if ("fajin".equals(key))
            SysConstant.overdueFine = Integer.valueOf(value) * 100;
        if ("jyts".equals(key))
            SysConstant.maxLendingTime = Integer.valueOf(value);
        return "<script>alert('Success');window.history.back(-2);</script>";
    }

}
