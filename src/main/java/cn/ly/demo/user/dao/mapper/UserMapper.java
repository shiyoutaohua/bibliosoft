package cn.ly.demo.user.dao.mapper;

import cn.ly.demo.user.entity.User;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface UserMapper {
    User getUserById(User user);

    int getCountByUseridAndPassword(User user);

    List<User> getAllLibrarians();

    void addUser(User user);

    List<User> getReaderList(HashMap<String, Integer> paramMap);

    int getReaderCount();

    void deleteUser(User user);
}
