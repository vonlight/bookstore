package test.demo.shop.manage.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import test.demo.shop.domain.Category;
import test.demo.shop.service.ICategoryService;
import test.demo.shop.utils.JsonUtils;

import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("/manage/category")
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

    @RequestMapping("/categoryList.do")
    public ModelAndView categoryList() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("category_aside", "active");
        modelAndView.setViewName("categoryList");
        return modelAndView;
    }

    @RequestMapping("/showUpdate.do")
    public ModelAndView showUpdate(Category category) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        Category resultCategory = categoryService.findOneByCategory(category);
        modelAndView.addObject("category", resultCategory);
        modelAndView.setViewName("categoryAdd");
        modelAndView.addObject("category_aside", "active");
        return modelAndView;
    }
    @RequestMapping("/addOrUpdateCategory.do")
    public String addOrUpdateCategory(Category category, String categoryCode, Model model) {
        //更新
        try {
            if(!StringUtils.isEmpty(categoryCode)) {
                category.setCode(categoryCode);
                categoryService.updateCategory(category);
            } else { //添加
                categoryService.save(category);
            }
        } catch (Exception e) {
            model.addAttribute("message", "发生异常, 操作失败!");
        }
        model.addAttribute("category_aside", "active");
        return "categoryList";
    }
    @RequestMapping("/showAddCategory.do")
    public ModelAndView showAddCategory() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("category_aside", "active");
        modelAndView.setViewName("categoryAdd");
        return modelAndView;
    }
    @RequestMapping(value = "/deleteCategory.do")
    public String deleteCategory(Category category, Model model)  {
        try {
            String message = categoryService.deleteCategory(category);
            model.addAttribute("message", message);
        } catch(Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "删除失败!");
        }
        model.addAttribute("category_aside", "active");
        return "categoryList";
    }
}
