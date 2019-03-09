package cn.ly.demo.user.dao;

import cn.ly.demo.user.dao.mapper.UserMapper;
import cn.ly.demo.user.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class UserDao {
    @Autowired
    private UserMapper userMapper;

    public User getUserById(int userId) {
        User user = new User();
        user.setId(userId);
        return userMapper.getUserById(user);
    }

    public int getCountByUseridAndPassword(int userId, String password) {
        User user = new User();
        user.setId(userId);
        user.setPassword(password);
        return userMapper.getCountByUseridAndPassword(user);
    }

    public List<User> getAllLibrarians() {
        return userMapper.getAllLibrarians();
    }

    public void addUser(User user) {
        userMapper.addUser(user);
    }

    public List<User> getReaderList(int startIndex, int rowCount) {
        HashMap<String, Integer> parmaMap = new HashMap<>();
        parmaMap.put("startIndex", startIndex);
        parmaMap.put("rowCount", rowCount);
        return userMapper.getReaderList(parmaMap);
    }

    public int getReaderCount() {
        return userMapper.getReaderCount();
    }

    public void deleteUser(User user) {
        userMapper.deleteUser(user);
    }

}
