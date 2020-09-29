package test.demo.shop.service;

import test.demo.shop.domain.OrderDetail;

import java.util.List;

public interface IOrderDetailService {
    List<OrderDetail> findAll() throws Exception;
    OrderDetail findOneByOrderId(Integer id) throws Exception;
}
