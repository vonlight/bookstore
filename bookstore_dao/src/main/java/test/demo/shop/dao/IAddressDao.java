package test.demo.shop.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import test.demo.shop.domain.Address;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface IAddressDao extends Mapper<Address> {
    @Select("select * from address where user_id = #{id}")
    List<Address> findByUserId(Integer id) throws Exception;

    @Select("update address set disabled = 0 where user_id = #{userId} ")
    void removeDefault(Integer userId) throws Exception;

}
