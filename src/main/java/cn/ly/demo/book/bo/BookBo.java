package cn.ly.demo.book.bo;

import cn.ly.demo.book.dao.BookDao;
import cn.ly.demo.book.entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class BookBo {
    @Autowired
    private BookDao bookDao;

    public Book getBookById(int bookId) {
        return bookDao.getBookById(bookId);
    }

    public List<Book> getBookList(int startIndex, int rowCount) {
        return bookDao.getBookList(startIndex, rowCount);
    }

    public void addBook(String ISBN, String title, String author, String tag, String press, String pubDate, String location) {
        Book book = new Book();
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
        book.setStatus("在馆");
        bookDao.addBook(book);
    }

    public List<Book> getBookListByKey(String keyWord) {
        return bookDao.getBookListByKey(keyWord);
    }

    public void updateBookById(Book book) {
        bookDao.updateBookById(book);
    }

    public void deleteBookById(Book book) {
        bookDao.deleteBookById(book);
    }
}
