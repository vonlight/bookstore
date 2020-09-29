package test.demo.shop.dao;

import org.apache.ibatis.annotations.Select;
import test.demo.shop.domain.OrderDetail;
import tk.mybatis.mapper.common.Mapper;

public interface IOrderDetailDao extends Mapper<OrderDetail> {
    @Select("select * from orderDetail where order_id = #{id}")
    OrderDetail findOneByOrderId(Integer id);
}
