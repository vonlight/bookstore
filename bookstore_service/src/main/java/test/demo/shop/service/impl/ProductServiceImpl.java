package test.demo.shop.service.impl;

import com.github.pagehelper.PageHelper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.demo.shop.dao.IProductDao;
import test.demo.shop.domain.Product;
import test.demo.shop.service.IProductService;

import java.util.List;

@Service
public class ProductServiceImpl implements IProductService {
    @Autowired
    private IProductDao productDao;

    private Integer size = 9;
    @Override
    public List<Product> findAll() throws Exception {
        return productDao.selectAll();
    }

    @Override
    public List<Product> findByCategoryCode(String categoryCode, String title, Integer page) throws Exception {
        //使用pageHelper封装数据
        PageHelper.startPage(page, size);
        return productDao.findByCategoryCode(categoryCode, title);
    }

    @Override
    public List<Product> findAllOpenProduct(Integer page) throws Exception {
        PageHelper.startPage(page, size);
        return productDao.findAllOpenProduct();
    }

    @Override
    public List<Product> findAllCloseProduct(Integer page) throws Exception {
        Product product = new Product();
        product.setDisabled(1);
        PageHelper.startPage(page, size);
        return productDao.findAllCloseProduct();
    }

    @Override
    public Integer findProductNum() throws Exception {
        Product product = new Product();
        return productDao.selectCount(product);
    }

    @Override
    public Product findOneById(Integer id) throws Exception {
        return productDao.selectByPrimaryKey(id);
    }

    @Override
    public void closeProduct(Product product) throws Exception {
        product.setDisabled(1);
        productDao.updateByPrimaryKeySelective(product);
    }

    @Override
    public void openProduct(Product product) throws Exception {
        product.setDisabled(0);
        productDao.updateByPrimaryKeySelective(product);
    }



    @Override
    public void save(Product product) throws Exception {
        productDao.insertSelective(product);
    }

    @Override
    public void update(Product product) throws Exception {
        productDao.updateByPrimaryKeySelective(product);
    }

    @Override
    public List<Product> findAllByCategoryCode(String categoryCode, String title, Integer page) throws Exception {
        //使用pageHelper封装数据
        PageHelper.startPage(page, size);
        return productDao.findAllByCategoryCode(categoryCode, title);
    }




}
