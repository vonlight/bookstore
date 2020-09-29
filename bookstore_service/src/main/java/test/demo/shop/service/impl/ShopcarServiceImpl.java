package test.demo.shop.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ResponseBody;
import test.demo.shop.dao.IShopcarDao;
import test.demo.shop.domain.Shopcar;
import test.demo.shop.domain.User;
import test.demo.shop.service.IShopcarService;

import java.beans.Transient;
import java.util.List;

@Service
@Transactional
public class ShopcarServiceImpl implements IShopcarService {
    @Autowired
    private IShopcarDao shopcarDao;
    @Override
    public List<Shopcar> findAll() {
        return shopcarDao.selectAll();
    }

    @Override
    public void addOrUpdateShopcar(Integer productId, Integer userId, Integer number) throws Exception {
        Shopcar shopcar = new Shopcar();
        shopcar.setProductId(productId);
        shopcar.setUserId(userId);
        Shopcar resultShopcar = shopcarDao.selectOne(shopcar);
        if(!ObjectUtils.isEmpty(resultShopcar)) {
            shopcar.setBuynum(resultShopcar.getBuynum() + number);
            shopcarDao.updateByPrimaryKey(shopcar);
        } else {
            shopcar.setBuynum(number);
            shopcarDao.insertSelective(shopcar);
        }
    }

    @Override
    public List<Shopcar> findByUserId(Integer id) throws Exception {
        return shopcarDao.findByUserId(id);
    }



    @Override
    public void updateShopcar(Integer productId, Integer userId, Integer buynum) throws Exception {
        Shopcar shopcar = new Shopcar();
        shopcar.setBuynum(buynum);
        shopcar.setProductId(productId);
        shopcar.setUserId(userId);
        shopcarDao.updateByPrimaryKeySelective(shopcar);
    }

    @Override
    public void deleteShopCar(Shopcar shopcar) throws Exception {
        shopcarDao.deleteByPrimaryKey(shopcar);
    }
}
