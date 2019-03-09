package cn.ly.demo.base.dao.mapper;

import cn.ly.demo.base.entity.Order;
import cn.ly.demo.book.entity.Book;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderMapper {
    Order getOrderById(Order order);

    Order getOrderByBook(Book book);

    void addOrder(Order order);

    void deleteOrder(Order order);
}
