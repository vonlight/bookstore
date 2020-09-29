package test.demo.shop.dao;

import org.apache.ibatis.annotations.*;
import test.demo.shop.domain.Product;
import test.demo.shop.domain.Shopcar;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface IShopcarDao extends Mapper<Shopcar> {
    @Select("select * from shopcar where user_id = #{id}")
    @Results({
            @Result(property = "buynum", column = "buynum"),
            @Result(id = true, property = "userId", column = "user_id"),
            @Result(id = true, property = "productId", column = "product_id"),
            @Result(property = "product", column = "product_id", javaType = Product.class, one = @One(select = "test.demo.shop.dao.IProductDao.selectByPrimaryKey"))
    })
    List<Shopcar> findByUserId(Integer id) throws Exception;
}
