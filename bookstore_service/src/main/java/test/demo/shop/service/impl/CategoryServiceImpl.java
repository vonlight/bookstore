package test.demo.shop.service.impl;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;
import test.demo.shop.dao.ICategoryDao;
import test.demo.shop.dao.IProductDao;
import test.demo.shop.domain.Category;
import test.demo.shop.domain.Product;
import test.demo.shop.service.ICategoryService;
import test.demo.shop.utils.JedisUtil;
import test.demo.shop.utils.JsonUtils;

import java.util.List;
import java.util.Set;

@Service
@Transactional
public class CategoryServiceImpl implements ICategoryService {
    @Autowired
    private ICategoryDao categoryDao;
    @Autowired
    private IProductDao productDao;
    private Integer pageSize = 8;
    @Override
    public List<Category> findAll(int pageNum) throws Exception {
        PageHelper.startPage(pageNum, pageSize);
        return categoryDao.selectAll();
    }

    @Override
    public List<Category> findAllSecondCategoryByFirst(String categoryCode) throws Exception {
        return categoryDao.findAllSecondCategoryByFirst(categoryCode);
    }

    @Override
    public Category findOneByCategory(Category category) throws Exception {
        return categoryDao.selectOne(category);
    }

    @Override
    public void updateCategory(Category category) throws Exception {
        categoryDao.updateByPrimaryKeySelective(category);
    }

    @Override
    public void save(Category category) throws Exception {

        StringBuffer stringBuffer = new StringBuffer();
        if(!StringUtils.isEmpty(category.getCode())) { //二级类型
            stringBuffer.append(category.getCode());
            String maxCode = categoryDao.findMaxCode(category.getCode() + "%");
            if(StringUtils.isEmpty(maxCode)) {
                stringBuffer.append("0001");
            } else {
                String secondCodeStr = maxCode.substring(maxCode.length() - 4, maxCode.length()).replaceAll("0", "");
                Integer secondCodeLast = Integer.parseInt(secondCodeStr) + 1;

                for (int i = 0; i < 4 - secondCodeLast.toString().length(); i++) {
                    stringBuffer.append("0");
                }
                stringBuffer.append(secondCodeLast);
            }
        } else { //一级类型
            Integer firstCodeLast = Integer.parseInt(categoryDao.findMaxFirstCode()) + 1;

            for (int i = 0; i < 4 - firstCodeLast.toString().length(); i++) {
                stringBuffer.append("0");
            }
            stringBuffer.append(firstCodeLast);
        }
        category.setCode(stringBuffer.toString());
        categoryDao.insertSelective(category);
    }

    @Override
    public String deleteCategory(Category category) throws Exception {
        if (category.getCode().length() == 4) {
            List<Category> secondCategoryList = categoryDao.findAllSecondCategoryByFirst(category.getCode() + "%");
            if (!CollectionUtils.isEmpty(secondCategoryList)) {
                return "删除失败, 该商品还有下级类型!";
            }
        }
        Product product = new Product();
        product.setCategoryCode(category.getCode());
        productDao.delete(product);
        categoryDao.deleteByPrimaryKey(category);
        return "删除成功";
    }

    @Override
    public List<Category> findAllFirstCategory() throws Exception {
        return categoryDao.findAllFirstCategory();
    }
}
