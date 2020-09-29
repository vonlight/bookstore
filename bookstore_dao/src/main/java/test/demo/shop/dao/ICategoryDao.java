package test.demo.shop.dao;


import org.apache.ibatis.annotations.Select;
import test.demo.shop.domain.Category;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ICategoryDao extends Mapper<Category> {

    @Select("select * from category where length(code) = 4 order by code ")
    List<Category> findAllFirstCategory() throws Exception;

    @Select("select * from category where code like #{categoryCode} and length(code) = 8 order by code ")
    List<Category> findAllSecondCategoryByFirst(String categoryCode);

    @Select("select max(code) from category where CODE like #{code} and length(code) = 8")
    String findMaxCode(String code) throws Exception;

    @Select("select max(code) from category where length(code) = 4")
    String findMaxFirstCode() throws Exception;
}
