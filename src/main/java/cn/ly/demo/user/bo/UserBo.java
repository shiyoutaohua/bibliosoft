package cn.ly.demo.user.bo;

import cn.ly.demo.base.util.SysConstant;
import cn.ly.demo.user.dao.UserDao;
import cn.ly.demo.user.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class UserBo {
    private static Logger log = LoggerFactory.getLogger("userBo");
    @Autowired
    private UserDao userDao;

    //  设置用户首选语言
    public void setLang(HttpServletRequest request, int langCode) {
        HttpSession session = request.getSession();
        session.setAttribute("lang", langCode);
    }

    //  取得用户首选语言
    public boolean isChinese(HttpServletRequest request) {
        HttpSession session = request.getSession();
        int lang = (int) session.getAttribute("lang");
        return lang == 0;
    }

    public User getUserById(int userId) {
        return userDao.getUserById(userId);
    }

    //  取得登录结果 true:登录成功 false:登录失败
    public boolean getLoginResult(int userId, String password) {
        int count = userDao.getCountByUseridAndPassword(userId, password);
        return count == 1;
    }

    //  将用户信息存入Session
    public void saveUserInSession(HttpServletRequest request, User user) {
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
    }

    public User getCurrentUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return null != session.getAttribute("user") ? (User) session.getAttribute("user") : null;
    }

    public int getCurrentLevel(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            return SysConstant.visitor;
        } else {
            User user = (User) session.getAttribute("user");
            return user.getLevel();
        }
    }

    public List<User> getAllLibrarians() {
        return userDao.getAllLibrarians();
    }

    public void addReader(String userId, String name, String email) {
        User user = new User();
        user.setId(Integer.valueOf(userId));
        user.setPassword("00010001");
        user.setLevel((byte) 2);
        user.setName(name);
        user.setEmail(email);
        userDao.addUser(user);
    }

    public void addLibrarian(String userId, String name, String email) {
        User user = new User();
        user.setId(Integer.valueOf(userId));
        user.setPassword("123");
        user.setLevel((byte) 1);
        user.setName(name);
        user.setEmail(email);
        userDao.addUser(user);
    }

    public List<User> getReaderList(int startIndex, int rowCount) {
        return userDao.getReaderList(startIndex, rowCount);
    }

    public int getReaderCount() {
        return userDao.getReaderCount();
    }

    public void deleteUser(User user) {
        userDao.deleteUser(user);
    }
}
