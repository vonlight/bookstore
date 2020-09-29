package test.demo.shop.service;

import test.demo.shop.domain.Address;

import java.util.List;

public interface IAddressService {
    List<Address> findAll() throws Exception;

    List<Address> findByUserId(Integer id) throws Exception;

    void save(Address address) throws Exception;

    void update(Address address) throws Exception;

    void setDefault(Address address) throws Exception;

    String deleteAddress(Address address) throws Exception;
}
