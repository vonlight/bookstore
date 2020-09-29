package test.demo.shop.service.impl;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import test.demo.shop.dao.IAddressDao;
import test.demo.shop.dao.IUserDao;
import test.demo.shop.domain.Address;
import test.demo.shop.domain.User;
import test.demo.shop.service.IUserService;
import test.demo.shop.utils.MailUtils;
import test.demo.shop.utils.UuidUtil;

import java.util.Date;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;

    private Integer pageSize = 8;
    @Autowired
    private IAddressDao addressDao;
    @Override
    public List<User> findAll() throws Exception {
        return userDao.selectAll();
    }

    @Override
    public User findByUserId(Integer id) throws Exception {
        return userDao.findOneByUser(id);
    }
    @Override
    public void buyerSave(User user, Address address) throws Exception {
        user.setCreateDate(new Date());
        user.setActiveCode(UuidUtil.getUuid());
        userDao.insertSelective(user);
        address.setUserId(user.getId());
        address.setDisabled(1);
        addressDao.insertSelective(address);
        String content = "<a href = 'http://localhost:8888/bookstore_web/user/userActive.do?activeCode=" + user.getActiveCode() + "'>恭喜您注册成功, 请点击该链接进行激活, 无需回复!</a>";
        MailUtils.sendMail(user.getEmail(), content, "用户激活邮件, 请勿回复, 按照指引激活");
    }
    @Override
    public boolean userActive(String activeCode) throws Exception {
        User user = new User();
        user.setActiveCode(activeCode);
        User resultUser = findByUser(user);
        if (resultUser != null) {
            resultUser.setDisabled(1);
            userDao.updateByPrimaryKey(resultUser);
            return true;
        }
        return false;
    }


    @Override
    public User findByUser(User user) throws Exception {
        return userDao.selectOne(user);
    }

    @Override
    public User findByUserNameAndPassword(String username, String password) throws Exception {
        return userDao.findByUserNameAndPassword(username, password);
    }

    @Override
    public void updateUser(User user) throws Exception {
        userDao.updateByPrimaryKeySelective(user);
    }

    @Override
    public List<User> findAllRoleOne(Integer page) throws Exception {
        User user = new User();
        user.setRole(1);
        PageHelper.startPage(page, pageSize);
        return userDao.select(user);
    }

    @Override
    public List<User> findByUsername(String username, Integer page) throws Exception {
        PageHelper.startPage(page, pageSize);
        return userDao.findByUsername(username);
    }

    @Override
    public Integer findUserNum() throws Exception {
        User user = new User();
        user.setRole(1);
        user.setDisabled(1);
        return userDao.selectCount(user);
    }
}
