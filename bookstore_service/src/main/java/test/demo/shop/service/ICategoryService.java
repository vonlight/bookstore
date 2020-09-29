package test.demo.shop.service;

import test.demo.shop.domain.Category;

import java.util.List;

public interface ICategoryService {
    List<Category> findAll(int pageNum) throws Exception;

    List<Category> findAllFirstCategory() throws Exception;

    List<Category> findAllSecondCategoryByFirst(String categoryCode) throws Exception;

    Category findOneByCategory(Category category) throws Exception;

    void updateCategory(Category category) throws Exception;

    void save(Category category) throws Exception;

    String deleteCategory(Category category) throws Exception;
}
