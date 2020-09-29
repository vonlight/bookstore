package test.demo.shop.service;

import test.demo.shop.domain.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll() throws Exception;

    List<Product> findByCategoryCode(String categoryCode, String title, Integer page) throws Exception;

    Product findOneById(Integer id) throws Exception;

    void closeProduct(Product product) throws Exception;

    void save(Product product) throws Exception;

    void update(Product product) throws Exception;

    List<Product> findAllByCategoryCode(String categoryCode, String title, Integer page) throws Exception;

    void openProduct(Product product) throws Exception;

    List<Product> findAllOpenProduct(Integer page) throws Exception;

    List<Product> findAllCloseProduct(Integer page) throws Exception;

    Integer findProductNum() throws Exception;
}
