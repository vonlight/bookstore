package test.demo.shop.manage.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import test.demo.shop.domain.Product;
import test.demo.shop.service.IProductService;
import test.demo.shop.utils.UuidUtil;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/manage/product")
public class ProductController {
    @Autowired
    private IProductService productService;
    @RequestMapping("/findByCategoryCode.do")
    public ModelAndView findByCategoryCode(String categoryCode, @RequestParam(required = true, name = "page", defaultValue = "1") Integer page, HttpSession session) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Product> productList = productService.findAllByCategoryCode(StringUtils.isEmpty(categoryCode) ? null : "%"+categoryCode + "%", null, page);
        PageInfo<Product> pageInfo = new PageInfo<>(productList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("pageResources", "findByCategoryCode.do");
        Object message = session.getAttribute("message");
        if (StringUtils.isEmpty(categoryCode)) {
            modelAndView.addObject("findByCategoryCode", "active");
            modelAndView.addObject("dropdown", "全部");
        }
        if(!ObjectUtils.isEmpty(message)) {
            modelAndView.addObject("message", (String)message);
            session.removeAttribute("message");
        }
        modelAndView.addObject("product_aside", "active");
        modelAndView.setViewName("productList");
        return modelAndView;
    }
    @RequestMapping("/findAllOpenProduct.do")
    public ModelAndView findAllOpenProduct(@RequestParam(required = true, name = "page", defaultValue = "1") Integer page, HttpSession session) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Product> productList = productService.findAllOpenProduct(page);
        PageInfo<Product> pageInfo = new PageInfo<>(productList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("pageResources", "findAllOpenProduct.do");
        modelAndView.addObject("findAllOpenProduct", "active");
        modelAndView.addObject("dropdown", "上架");
        modelAndView.setViewName("productList");
        modelAndView.addObject("product_aside", "active");
        return modelAndView;
    }

    @RequestMapping("/findAllCloseProduct.do")
    public ModelAndView findAllCloseProduct(@RequestParam(required = true, name = "page", defaultValue = "1") Integer page, HttpSession session) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Product> productList = productService.findAllCloseProduct(page);
        PageInfo<Product> pageInfo = new PageInfo<>(productList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("pageResources", "findAllCloseProduct.do");
        modelAndView.addObject("findAllCloseProduct","active");
        modelAndView.addObject("dropdown", "下架");
        modelAndView.setViewName("productList");
        modelAndView.addObject("product_aside", "active");
        return modelAndView;
    }

    @RequestMapping("/findByCategoryCodeAndTitle.do")
    public ModelAndView findByCategoryCodeAndTitle(String categoryCode, String title, @RequestParam(required = true, name = "page", defaultValue = "1")Integer page) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Product> productList = productService.findByCategoryCode(StringUtils.isEmpty(categoryCode) ? null : categoryCode + "%", StringUtils.isEmpty(title) ? null : "%"+title+"%", 1);
        //分页bean
        PageInfo<Product> pageInfo = new PageInfo<>(productList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("pageResources", "findByCategoryCodeAndTitle.do");
        modelAndView.addObject("product_aside", "active");
        modelAndView.setViewName("productList");
        return modelAndView;
    }
    @RequestMapping("/findByProductId.do")
    public ModelAndView findByProductId(Integer productId) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        Product product = productService.findOneById(productId);
        modelAndView.addObject("product", product);
        modelAndView.setViewName("productDetail");
        modelAndView.addObject("product_aside", "active");
        return modelAndView;
    }
    @RequestMapping("/closeProduct.do")
    @ResponseBody
    public void closeProduct(Product product ) throws Exception {
        productService.closeProduct(product);
    }

    @RequestMapping("/openProduct")
    @ResponseBody
    public void openProduct(Product product) throws Exception {
        productService.openProduct(product);
    }
    //添加商品
    @RequestMapping(value = "/addProduct.do", produces = {"application/text;charset=utf-8"})
    public String addProduct(MultipartFile file, Product product, HttpServletRequest request, HttpSession session) throws Exception {
        if(!ObjectUtils.isEmpty(file) && !StringUtils.isEmpty(file.getOriginalFilename())) {
            String manageImagePath = request.getServletContext().getRealPath("/img/image/product");
            String buyerImagePath = manageImagePath.replace("bookstore_admin_web", "bookstore_web").replace("img\\", "");
            String fileName = file.getOriginalFilename();
            //根据后缀查询上传的文件是否为图片
            MimetypesFileTypeMap mimetypesFileTypeMap = new MimetypesFileTypeMap();
            mimetypesFileTypeMap.addMimeTypes("image png tif jpg jpeg bmp");
            String fileType = mimetypesFileTypeMap.getContentType(fileName);
            if ("image".equals(fileType)) {
                InputStream inputStream = file.getInputStream();
                String newFileName = UuidUtil.getUuid() + fileName.substring(fileName.lastIndexOf("."), fileName.length());
                System.out.println(manageImagePath + File.separator + newFileName);
                FileOutputStream manageOutputStream = new FileOutputStream(manageImagePath + File.separator + newFileName);
                FileOutputStream buyerOutputStream = new FileOutputStream(buyerImagePath + File.separator + newFileName);
                byte[] bytes = new byte[1024];
                int len = 0;
                while((len = inputStream.read(bytes)) != -1 ) {
                    manageOutputStream.write(bytes, 0, len);
                    buyerOutputStream.write(bytes, 0, len);
                }
                inputStream.close();
                buyerOutputStream.close();
                manageOutputStream.close();
                product.setCreateDate(new Date());
                product.setImage(newFileName);
                productService.save(product);
                session.setAttribute("message", "商品添加成功");
            }
            else {
                session.setAttribute("message", "商品添加失败");
            }
        } else {
            session.setAttribute("message", "商品添加失败");
        }
            return "redirect:findByCategoryCode.do";
    }

    @RequestMapping("/showProduct.do")
    public ModelAndView showProduct(Integer id) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        Product product = productService.findOneById(id);
        modelAndView.addObject("product", product);
        modelAndView.setViewName("updateProduct");
        modelAndView.addObject("product_aside", "active");
        return modelAndView;
    }

    @RequestMapping("/updateProduct.do")
    public String updateProduct(@RequestParam(value = "file") MultipartFile file, Product product, HttpServletRequest request) throws Exception {
        if(!ObjectUtils.isEmpty(file) && !StringUtils.isEmpty(file.getOriginalFilename())) {
            String manageImagePath = request.getServletContext().getRealPath("/img/image/product");
            String buyerImagePath = manageImagePath.replace("bookstore_admin_web", "bookstore_web").replace("img\\", "");
            String fileName = file.getOriginalFilename();
            //根据后缀查询上传的文件是否为图片
            MimetypesFileTypeMap mimetypesFileTypeMap = new MimetypesFileTypeMap();
            mimetypesFileTypeMap.addMimeTypes("image png tif jpg jpeg bmp");
            String fileType = mimetypesFileTypeMap.getContentType(fileName);
            if ("image".equals(fileType)) {
                InputStream inputStream = file.getInputStream();
                String newFileName = UuidUtil.getUuid() + fileName.substring(fileName.lastIndexOf("."), fileName.length());
                System.out.println(manageImagePath + File.separator + newFileName);
                FileOutputStream manageOutputStream = new FileOutputStream(manageImagePath + File.separator + newFileName);
                FileOutputStream buyerOutputStream = new FileOutputStream(buyerImagePath + File.separator + newFileName);
                byte[] bytes = new byte[1024];
                int len = 0;
                while((len = inputStream.read(bytes)) != -1 ) {
                    manageOutputStream.write(bytes, 0, len);
                    buyerOutputStream.write(bytes, 0, len);
                }
                inputStream.close();
                buyerOutputStream.close();
                manageOutputStream.close();
                product.setCreateDate(new Date());
                product.setImage(newFileName);
                productService.update(product);
            }
        } else {
            productService.update(product);
        }
        return "redirect:findByCategoryCode.do";
    }
    @RequestMapping("/findProductNum.do")
    @ResponseBody
    public Integer findProductNum() throws Exception {
        return productService.findProductNum();
    }
}
