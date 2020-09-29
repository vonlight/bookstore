package test.demo.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import test.demo.shop.domain.Category;
import test.demo.shop.service.ICategoryService;
import test.demo.shop.utils.JsonUtils;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private ICategoryService categoryService;
    @RequestMapping(value = "/findAllFirstCategory.do", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String findAllFirstCategory() throws Exception {
        List<Category> categoryList = categoryService.findAllFirstCategory();
        return JsonUtils.serialize(categoryList);
    }
    @RequestMapping(value = "/findAllSecondCategoryCode.do", produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public String findAllSecondCategoryCode(String categoryCode) throws Exception {
        List<Category> secondCategoryList = null;
        if(!StringUtils.isEmpty(categoryCode)) {
            String firstCategory = categoryCode.substring(0, 4);
            secondCategoryList = categoryService.findAllSecondCategoryByFirst(firstCategory + "%");
        }
        return JsonUtils.serialize(secondCategoryList);
    }
}