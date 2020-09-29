package test.demo.shop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import test.demo.shop.dao.IOrderDetailDao;
import test.demo.shop.domain.OrderDetail;
import test.demo.shop.service.IOrderDetailService;

import java.util.List;

@Service
@Transactional
public class OrderDetailImpl implements IOrderDetailService {
    @Autowired
    private IOrderDetailDao orderDetailDao;
    @Override
    public List<OrderDetail> findAll() throws Exception {
        return orderDetailDao.selectAll();
    }

    @Override
    public OrderDetail findOneByOrderId(Integer id) throws Exception {
        return orderDetailDao.findOneByOrderId(id);
    }
}
