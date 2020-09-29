package test.demo.shop.service;

import test.demo.shop.domain.Shopcar;

import java.util.List;

public interface IShopcarService {
    List<Shopcar> findAll();

    void addOrUpdateShopcar(Integer productId, Integer userId, Integer number) throws Exception;

    List<Shopcar> findByUserId(Integer id) throws Exception;

    void updateShopcar(Integer productId, Integer userId, Integer buynum) throws Exception;

    void deleteShopCar(Shopcar shopcar) throws Exception;
}
