package test.demo.shop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import test.demo.shop.dao.IAddressDao;
import test.demo.shop.domain.Address;
import test.demo.shop.service.IAddressService;

import java.util.List;

@Service
@Transactional
public class AddressServiceImpl implements IAddressService {
    @Autowired
    private IAddressDao addressDao;
    @Override
    public List<Address> findAll() throws Exception {
        return addressDao.selectAll();
    }

    @Override
    public List<Address> findByUserId(Integer id) throws Exception {
        Address address = new Address();
        address.setUserId(id);
        return addressDao.select(address);
    }

    @Override
    public void save(Address address) throws Exception {
        if (address.getDisabled() == 1) {
            addressDao.removeDefault(address.getUserId());
        }
        addressDao.insertSelective(address);
    }

    @Override
    public void update(Address address) throws Exception {
        addressDao.updateByPrimaryKeySelective(address);
    }

    @Override
    public void setDefault(Address address) throws Exception {
        addressDao.removeDefault(address.getUserId());
        address.setDisabled(1);
        addressDao.updateByPrimaryKeySelective(address);
    }

    @Override
    public String deleteAddress(Address address) throws Exception {
        if(address.getDisabled() == 0) {
            addressDao.delete(address);
        } else {
            Address ad = new Address();
            ad.setUserId(address.getUserId());
            List<Address> addressList = addressDao.select(ad);
            if (addressList.size() == 1) { //只剩一个默认地址, 不让删除
                return "地址不能为空!";
            } else {
                addressDao.delete(address);
                List<Address> otherAddress = addressDao.select(ad);
                Address ad2 = otherAddress.get(0);
                ad2.setDisabled(1);
                addressDao.updateByPrimaryKeySelective(ad2);
            }
        }
        return null;
    }

}
