package test.demo.shop.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import test.demo.shop.domain.Product;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;


public interface IProductDao extends Mapper<Product> {

    List<Product> findByCategoryCode(@Param("categoryCode") String categoryCode, @Param("title") String title) throws Exception;

    List<Product> findAllByCategoryCode(@Param("categoryCode") String categoryCode, @Param("title") String title)throws Exception;

    @Select("select * from product where disabled = 0")
    List<Product> findAllOpenProduct() throws Exception;

    @Select("select * from product where disabled = 1")
    List<Product> findAllCloseProduct() throws Exception;
}
