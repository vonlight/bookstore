package test.demo.shop.service;

import test.demo.shop.domain.Order;

import java.util.List;

public interface IOrderService {
    List<Order> findAll(Integer page) throws Exception;

    Order orderSubmit(String orderInfo, Integer addressId) throws Exception;

    List<Order> findByUserId(Integer id, Integer page) throws Exception;

    void updateOrder(Order order) throws Exception;

    void updateOrderCodeByOrderCode(String orderCode) throws Exception;

    void devStorage(Order order) throws Exception;

    List<Order> findNoPayOrder(Integer id, Integer page, Integer pageSize) throws Exception;

    List<Order> findPayOrder(Integer id, Integer page, Integer pageSize) throws Exception;

    Order findByOrder(Order order) throws Exception;

    List<Order> orderSearch( String orderCode, Integer page) throws Exception;

    Order findByOrderId(Integer id) throws Exception;

    Integer findOrderNum() throws Exception ;

    List<Order> indexOrder(Integer page, Integer pageSize) throws Exception ;

    void updateReceiveState(Order order) throws Exception;

    void deleteOrder(Integer id) throws Exception;
}
