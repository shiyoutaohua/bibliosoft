package cn.ly.demo.base.dao;

import cn.ly.demo.base.dao.mapper.OrderMapper;
import cn.ly.demo.base.entity.Order;
import cn.ly.demo.book.entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDao {
    @Autowired
    private OrderMapper orderMapper;

    public Order getOrderById(int id) {
        Order order = new Order();
        order.setId(id);
        return orderMapper.getOrderById(order);
    }

    public Order getOrderByBook(Book book) {
        return orderMapper.getOrderByBook(book);
    }

    public void addOrder(Order order) {
        orderMapper.addOrder(order);
    }

    public void deleteOrder(Order order) {
        orderMapper.addOrder(order);
    }
}
