package test.demo.shop.dao;

import org.apache.ibatis.annotations.*;
import test.demo.shop.domain.OrderProduct;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;


public interface IOrderProductDao extends Mapper<OrderProduct> {
    @Select("select * from order_product where order_id = #{orderId}")
    @Results(id = "orderProductMap", value = {
            @Result(id = true, property = "orderId", column = "order_id"),
            @Result(id = true, property = "productId", column = "product_id"),
            @Result(property = "orderNum", column = "order_num"),
            @Result(property = "product", column = "product_id", one = @One(select = "test.demo.shop.dao.IProductDao.selectByPrimaryKey"))
    })
    List<OrderProduct> findByOrderId(Integer orderId);

    @ResultMap("orderProductMap")
    @Delete("delete from order_product where order_id = #{id}")
    void deleteByOrderId(Integer id) throws Exception;
}
