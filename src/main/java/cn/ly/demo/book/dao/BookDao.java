package cn.ly.demo.book.dao;

import cn.ly.demo.book.dao.mapper.BookMapper;
import cn.ly.demo.book.entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class BookDao {
    @Autowired
    private BookMapper bookMapper;

    public Book getBookById(int bookId) {
        Book book = new Book();
        book.setId(bookId);
        return bookMapper.getBookById(book);
    }

    public List<Book> getBookList(int startIndex, int rowCount) {
        HashMap<String, Integer> parmaMap = new HashMap<>();
        parmaMap.put("startIndex", startIndex);
        parmaMap.put("rowCount", rowCount);
        return bookMapper.getBookList(parmaMap);
    }

    public void addBook(Book book) {
        bookMapper.addBook(book);
    }

    public List<Book> getBookListByKey(String keyWord) {
        keyWord = "%" + keyWord + "%";
        return bookMapper.getBookListByKey(keyWord);
    }

    public void updateBookById(Book book) {
        bookMapper.updateBookById(book);
    }

    public void deleteBookById(Book book){
        bookMapper.deleteBookById(book);
    }
}
