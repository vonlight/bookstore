package test.demo.shop.service.impl;

import com.github.pagehelper.PageHelper;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import test.demo.shop.dao.*;
import test.demo.shop.domain.*;
import test.demo.shop.service.IAddressService;
import test.demo.shop.service.IOrderDetailService;
import test.demo.shop.service.IOrderService;
import test.demo.shop.service.IShopcarService;
import test.demo.shop.utils.DateUtils;
import test.demo.wechat.utils.DataJoinUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 两张表  order 和 orderProduct
 */

@Service
@Transactional
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private IOrderDao orderDao;
    @Autowired
    private IOrderProductDao orderProductDao;
    @Autowired
    private IShopcarDao shopcarDao;
    @Autowired
    private IProductDao productDao;
    @Autowired
    private IAddressDao addressDao;
    @Autowired
    private IOrderDetailDao orderDetailDao;
    private Integer pageSize = 8;
    @Override
    public List<Order> findAll(Integer page) throws Exception {
        PageHelper.startPage(page, pageSize);
        return orderDao.findAll();
    }

    @Override
    public Order orderSubmit(String orderInfo, Integer addressId) throws Exception {
        //orderInfo = 20#76_40_5292.00#78_7_926.10
        Shopcar shopcar = new Shopcar();
        String[] orders = orderInfo.split("#");
        Integer userId = Integer.parseInt(orders[0]);
        Order order = new Order();
        Date nowDate = new Date();
        order.setCreateDate(nowDate);
        order.setUserId(userId);
        order.setOrderCode("PO-" + DateUtils.date2String(nowDate, "yyyyMMddHHmmss") + userId);
        List<OrderProduct> orderProductList = new ArrayList<OrderProduct>();
        String[] orderProductInfos = null;
        Double amout = 0.0;
        shopcar.setUserId(userId);
        for (int i = 1; i < orders.length ; i++) {
            //78_7_926.10
            OrderProduct orderProduct = new OrderProduct();
            orderProductInfos = orders[i].split("_"); //String[]

            amout += Double.parseDouble(orderProductInfos[2]);
            shopcar.setProductId(Integer.parseInt(orderProductInfos[0]));
            //提交订单后清空购物车
            shopcarDao.delete(shopcar);
            orderProduct.setProductId(Integer.parseInt(orderProductInfos[0]));
            orderProduct.setOrderNum(Integer.parseInt(orderProductInfos[1]));
            orderProductList.add(orderProduct);
        }
        Address address = addressDao.selectByPrimaryKey(addressId);
        order.setAmount(amout);
        /*order.setName(address.getName());
        order.setPhone(address.getPhone());
        order.setAddress(address.getAddress());*/

        orderDao.insertSelective(order);
        Integer orderId = order.getId();
        //保存订单详情表
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setCity(address.getCity());
        orderDetail.setProvince(address.getProvince());
        orderDetail.setDistrict(address.getDistrict());
        orderDetail.setName(address.getName());
        orderDetail.setPhone(address.getPhone());
        orderDetail.setDetail(address.getDetail());
        orderDetail.setOrderId(order.getId());
        orderDetailDao.insertSelective(orderDetail);

        for(OrderProduct op : orderProductList) {
            op.setOrderId(orderId);
            orderProductDao.insertSelective(op);
        }

        //生成支付二维码
        DataJoinUtils dataJoinUtils = new DataJoinUtils();
        Map<String, String> result = dataJoinUtils.wxPay("https://www.jd.com/", order.getOrderCode(), "1", "127.0.0.1", "图书");
        order.setImgUrl(result.get("code_url"));
        return order;
    }

    @Override
    public List<Order> findByUserId(Integer id, Integer page) throws Exception {
        PageHelper.startPage(page, 3);
        return orderDao.findByUserId(id);
    }

    @Override
    public void updateOrder(Order order) throws Exception {
        Order resultOrder = orderDao.selectByPrimaryKey(order.getId());
        resultOrder.setSendDate(order.getSendDate());
        resultOrder.setStatus(order.getStatus());
        orderDao.updateByPrimaryKey(resultOrder);
    }

    @Override
    public void updateOrderCodeByOrderCode(String orderCode) throws Exception {
        Order order = new Order();
        order.setOrderCode(orderCode);
        Order resultOrder = orderDao.selectOne(order);
        resultOrder.setPayStatus(1);
        orderDao.updateByPrimaryKeySelective(resultOrder);
    }

    @Override
    public void devStorage(Order order) throws Exception {
        List<OrderProduct> orderProductList = orderDao.findByOrderId(order.getId()).getOrderProductList();
        order.setPayStatus(1);
        orderDao.updateByPrimaryKeySelective(order);
        Product product = null;
        for (OrderProduct orderProduct : orderProductList) {
            product = orderProduct.getProduct();
            Integer storageNum = product.getStorage() - orderProduct.getOrderNum();
            product.setStorage(storageNum);
            if (storageNum == 0) {
                product.setDisabled(1);
            }
            productDao.updateByPrimaryKeySelective(product);
        }
    }

    @Override
    public List<Order> findNoPayOrder(Integer id, Integer page, Integer pageSize) throws Exception {
        if (pageSize != null && pageSize != 0) {
            PageHelper.startPage(page, pageSize);
        }else {
            PageHelper.startPage(page, 3);
        }
        return orderDao.findNoPayOrder(id);
    }

    @Override
    public List<Order> findPayOrder(Integer id, Integer page, Integer pageSize) throws Exception {
        if (pageSize != null && pageSize != 0) {
            PageHelper.startPage(page, pageSize);
        }else {
            PageHelper.startPage(page, 3);
        }
        return orderDao.findPayOrder(id);
    }

    @Override
    public Order findByOrder(Order order) throws Exception {
        Order resultOrder = orderDao.selectOne(order);
        //生成支付二维码
        DataJoinUtils dataJoinUtils = new DataJoinUtils();
        Map<String, String> result = dataJoinUtils.wxPay("https://www.jd.com/", resultOrder.getOrderCode(), "1", "127.0.0.1", "图书");
        resultOrder.setImgUrl(result.get("code_url"));
        return resultOrder;
    }

    @Override
    public List<Order> orderSearch(String orderCode, Integer page) throws Exception {
        PageHelper.startPage(page, pageSize);
        return orderDao.orderSearch(orderCode);
    }

    @Override
    public Order findByOrderId(Integer id) throws Exception {
        return orderDao.findByOrderId(id);
    }

    @Override
    public Integer findOrderNum() throws Exception {
        return orderDao.selectCount(new Order());
    }

    @Override
    public List<Order> indexOrder(Integer page, Integer pageSize) throws Exception {
        PageHelper.startPage(page, pageSize);
        return orderDao.indexOrder();
    }

    @Override
    public void updateReceiveState(Order order) throws Exception {
        orderDao.updateByPrimaryKeySelective(order);
    }

    @Override
    public void deleteOrder(Integer id) throws Exception {
        orderProductDao.deleteByOrderId(id);
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setOrderId(id);
        orderDetailDao.delete(orderDetail);
        orderDao.deleteByPrimaryKey(id);

    }
}
