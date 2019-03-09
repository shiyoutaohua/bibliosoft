package cn.ly.demo.book.dao.mapper;

import cn.ly.demo.book.entity.Book;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface BookMapper {
    Book getBookById(Book book);

    List<Book> getBookList(HashMap<String, Integer> param);

    List<Book> getBookListByKey(String key);

    void addBook(Book book);

    void updateBookById(Book book);

    void deleteBookById(Book book);
}
