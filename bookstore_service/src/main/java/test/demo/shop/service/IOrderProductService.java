package test.demo.shop.service;

import test.demo.shop.domain.OrderProduct;

import java.util.List;

public interface IOrderProductService {
    List<OrderProduct> findAll() throws Exception;
    List<OrderProduct> findByOrderId(Integer id) throws Exception;
}
