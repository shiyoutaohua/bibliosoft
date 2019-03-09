package cn.ly.demo.user.controller;

import cn.ly.demo.base.dao.NoteDao;
import cn.ly.demo.base.entity.Note;
import cn.ly.demo.user.bo.UserBo;
import cn.ly.demo.user.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {
    private static final Logger log = LoggerFactory.getLogger("userController");
    @Autowired
    private UserBo userBo;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private NoteDao noteDao;

    //  To: 登录
    @RequestMapping(path = "/")
    public String toLogin(@CookieValue(value = "lang", defaultValue = "0") int lang) {
        userBo.setLang(request, lang);
        return userBo.isChinese(request) ? "/user/zh-cn/login" : "/user/en-us/login";
    }

    //  Handle: 登录
    @RequestMapping(path = "/login", method = RequestMethod.POST)
    public String handleLogin(String username, String password, Model model) {
        int userId = Integer.valueOf(username);
        boolean res = userBo.getLoginResult(userId, password);
        if (res) {
            User user = userBo.getUserById(userId);
            userBo.saveUserInSession(request, user);
            byte level = user.getLevel();
            switch (level) {
                case 0: {
                    return "redirect:/user/Admin";
                }
                case 1: {
                    return "redirect:/user/Librarian";
                }
                case 2: {
                    return "redirect:/user/Reader";
                }
                default: {
                    return "redirect:/";
                }
            }
        } else {
            return "redirect:/";
        }
    }

    //  To: Admin
    @RequestMapping(path = "/user/Admin")
    public String toAdmin() {
        return userBo.isChinese(request) ? "/user/zh-cn/admin" : "/user/en-us/admin";
    }

    //  To: Librarian
    @RequestMapping(path = "/user/Librarian")
    public String toLibrarian() {
        return userBo.isChinese(request) ? "/user/zh-cn/librarian" : "/user/en-us/librarian";
    }

    //  To: Reader
    @RequestMapping(path = "/user/Reader")
    public String toReader(Model model) {
        List<Note> notes = noteDao.getNoteList(0, 10);
        model.addAttribute("notes", notes);
        return userBo.isChinese(request) ? "/user/zh-cn/reader" : "/user/en-us/reader";
    }

    //  Get: 图书管理员列表页面
    @RequestMapping(path = "/user/librarians")
    public String getLibrarians(Model model) {
        model.addAttribute("users", userBo.getAllLibrarians());
        return userBo.isChinese(request) ? "user/zh-cn/userList" : "/user/en-us/userList";
    }

    @RequestMapping(path = "/user/myinfo")
    public String getUserInfo(Model model) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);
        return userBo.isChinese(request) ? "/user/zh-cn/userInfo" : "/user/en-us/userInfo";
    }

    @RequestMapping(path = "/user/addReader", method = RequestMethod.GET)
    public String getAddReader() {
        return userBo.isChinese(request) ? "/user/zh-cn/addUser" : "/user/en-us/addUser";
    }

    @RequestMapping(path = "/user/addReader", method = RequestMethod.POST)
    @ResponseBody
    public String handleAddUser(String account, String name, String email) {
        userBo.addReader(account, name, email);
        return "<script>alert('Success');window.history.back();</script>";
    }

    @RequestMapping(path = "/user/readers")
    public String getReaders(Model model) {
        model.addAttribute("users", userBo.getReaderList(0, 10));
        return userBo.isChinese(request) ? "user/zh-cn/userList" : "/user/en-us/userList";
    }

    @RequestMapping(path = "/user/addLibrarian", method = RequestMethod.GET)
    public String getAddLibrarian() {
        return userBo.isChinese(request) ? "user/zh-cn/addLibrarian" : "/user/en-us/addLibrarian";
    }

    @RequestMapping(path = "/user/addLibrarian", method = RequestMethod.POST)
    @ResponseBody
    public String handleAddLibrarian(String account, String name, String email) {
        userBo.addLibrarian(account, name, email);
        return "<script>alert('Success');window.history.back();</script>";
    }

    @RequestMapping(path = "/user/deleteLib/{userId}")
    @ResponseBody
    public String deleteLib(@PathVariable String userId) {
        User user = new User();
        user.setId(Integer.valueOf(userId));
        userBo.deleteUser(user);
        return "<script>alert('Success');window.history.back(-1);</script>";
    }

    @RequestMapping(path = "/user/update/{userId}")
    public String editLib(@PathVariable String userId, Model model) {
        User user = userBo.getUserById(Integer.valueOf(userId));
        model.addAttribute("user", user);
        return userBo.isChinese(request) ? "/user/zh-cn/userInfo" : "/user/en-us/userInfo";
    }

    //  退出登录
    @RequestMapping(path = "/user/exit")
    public String exit() {
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        return "redirect:/";
    }
}
