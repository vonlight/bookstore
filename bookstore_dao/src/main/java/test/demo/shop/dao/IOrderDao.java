package test.demo.shop.dao;


import org.apache.ibatis.annotations.*;
import test.demo.shop.domain.Order;
import test.demo.shop.domain.OrderProduct;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface IOrderDao extends Mapper<Order> {
    @Results(id = "orderMapper", value = {
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "orderCode", column = "order_code"),
            @Result(property = "createDate", column = "create_date"),
            @Result(property = "sendDate", column = "send_date"),
            @Result(property = "status", column = "status"),
            @Result(property = "amount", column = "amount"),
            @Result(property = "userId", column = "user_id"),
            @Result(property = "payStatus", column = "pay_status"),
            @Result(property = "receiveStatus", column = "receive_status"),
            @Result(property = "orderProductList", column = "id", many = @Many(select = "test.demo.shop.dao.IOrderProductDao.findByOrderId")),
            @Result(property = "orderDetail", column = "id", one = @One(select = "test.demo.shop.dao.IOrderDetailDao.findOneByOrderId"))
    })
    @Select("select * from tb_order where user_id = #{id} order by CREATE_DATE desc")
    List<Order> findByUserId(Integer id) throws Exception;

    @ResultMap("orderMapper")
    @Select("select * from tb_order order by PAY_STATUS desc, CREATE_DATE desc")
    List<Order> findAll() throws Exception;

    @ResultMap("orderMapper")
    @Select("select * from tb_order where id = #{id}")
    Order findByOrderId(Integer id) throws Exception;

    List<Order> findNoPayOrder(@Param("id") Integer id) throws Exception;

    List<Order> findPayOrder(@Param("id") Integer id) throws Exception;

    List<Order> orderSearch(@Param("orderCode") String orderCode) throws Exception;

    @ResultMap("orderMapper")
    @Select("select * from tb_order where pay_status = 1 and status = 0 order by CREATE_DATE desc")
    List<Order> indexOrder() throws Exception;
}
