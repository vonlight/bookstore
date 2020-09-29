package test;

import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import redis.clients.jedis.Jedis;
import test.demo.shop.dao.IOrderDao;
import test.demo.shop.dao.IOrderDetailDao;
import test.demo.shop.dao.IOrderProductDao;
import test.demo.shop.domain.*;
import test.demo.shop.service.*;
import test.demo.shop.utils.JedisUtil;

import java.util.List;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class TestDemo {
    @Autowired
    private IProductService productService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IShopcarService shopcarService;
    @Autowired
    private IOrderService orderService;
    @Autowired
    private IOrderProductService orderProductService;
    @Autowired
    private ICategoryService categoryService;
    @Autowired
    private IOrderDao orderDao;
    @Autowired
    private IAddressService addressService;
    @Autowired
    private IOrderDetailService orderDetailService;
    @Autowired
    private IOrderProductDao orderProductDao;
    @Autowired
    private IOrderDetailDao orderDetailDao;
    @Test
    public void test() throws Exception {
        List<Product> products = productService.findByCategoryCode("0003%", "%人%", 2);
        System.out.println(products);
        for (Product product : products) {
            System.out.println(product);
        }
    }




}
