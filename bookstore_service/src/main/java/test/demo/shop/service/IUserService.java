package test.demo.shop.service;

import test.demo.shop.domain.Address;
import test.demo.shop.domain.User;

import java.util.List;

public interface IUserService {
    List<User> findAll() throws Exception;

    User findByUserId(Integer id) throws Exception;

    void buyerSave(User user, Address address) throws Exception;

    boolean userActive(String activeCode) throws Exception;


    User findByUser(User user) throws Exception;

    User findByUserNameAndPassword(String username, String password) throws Exception;

    void updateUser(User user) throws Exception;

    List<User> findAllRoleOne(Integer page) throws Exception;

    List<User> findByUsername(String username, Integer page) throws Exception;

    Integer findUserNum() throws Exception;
}
