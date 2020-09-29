package test.demo.shop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import test.demo.shop.dao.IOrderProductDao;
import test.demo.shop.domain.OrderProduct;
import test.demo.shop.service.IOrderProductService;

import java.util.List;

@Service
@Transactional
public class OrderProductServiceImpl implements IOrderProductService {
    @Autowired
    private IOrderProductDao orderProductDao;


    @Override
    public List<OrderProduct> findAll() throws Exception {
       return orderProductDao.selectAll();
    }

    @Override
    public List<OrderProduct> findByOrderId(Integer id) throws Exception {
        return orderProductDao.findByOrderId(id);
    }


}
