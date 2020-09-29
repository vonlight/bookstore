package test.demo.shop.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import test.demo.shop.domain.Product;
import test.demo.shop.service.IProductService;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private IProductService productService;

    @RequestMapping("/index.do")
    public ModelAndView productIndex(String categoryCode, @RequestParam(required = true, name = "page", defaultValue = "1") Integer page) throws Exception {
        ModelAndView modelAndView = new ModelAndView();

        List<Product> productList = productService.findByCategoryCode(StringUtils.isEmpty(categoryCode) ? null : "%" + categoryCode + "%", null, page);
        //分页bean
        PageInfo<Product> pageInfo = new PageInfo<Product>(productList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("pageResources", "index.do");
        modelAndView.setViewName("productIndex");
        modelAndView.addObject("index", "active");
        return modelAndView;
    }

    @RequestMapping("/detail.do")
    public ModelAndView productDetail(Integer id) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        Product product = productService.findOneById(id);
        modelAndView.addObject("product", product);
        modelAndView.setViewName("productDetail");
        return modelAndView;
    }

    @RequestMapping("/findByCategoryCodeAndTitle.do")
    public ModelAndView findByCategoryCodeAndTitle(String categoryCode, String title, @RequestParam(required = true, name = "page", defaultValue = "1")Integer page) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Product> productList = productService.findByCategoryCode(StringUtils.isEmpty(categoryCode) ? null : categoryCode + "%", StringUtils.isEmpty(title) ? null : "%"+title+"%", page);
        //分页bean
        PageInfo<Product> pageInfo = new PageInfo<>(productList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("pageResources", "findByCategoryCodeAndTitle.do");
        modelAndView.setViewName("productIndex");
        return modelAndView;
    }
}
