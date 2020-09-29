package test.demo.shop.dao;

import org.apache.ibatis.annotations.*;
import test.demo.shop.domain.Address;
import test.demo.shop.domain.User;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;


public interface IUserDao extends Mapper<User> {
    @Results(id = "userMapper", value = {
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "username", column = "username"),
            @Result(property = "password", column = "password"),
            @Result(property = "email", column = "email"),
            @Result(property = "sex", column = "sex"),
            @Result(property = "name", column = "name"),
            @Result(property = "role", column = "role"),
            @Result(property = "createDate", column = "create_date"),
            @Result(property = "disabled", column = "disabled"),
            @Result(property = "activeCode", column = "active_code"),
            @Result(property = "addressList", column = "id",  many = @Many(select = "test.demo.shop.dao.IAddressDao.findByUserId")),

    })
    @Select("select * from user where id = #{id}")
    User findOneByUser(Integer id) throws Exception;


    @ResultMap("userMapper")
    @Select("select * from user where username = #{username} and password = #{password}")
    User findByUserNameAndPassword(@Param("username") String username, @Param("password") String password) throws Exception;

    List<User> findByUsername(@Param("username") String username) throws Exception;
}
