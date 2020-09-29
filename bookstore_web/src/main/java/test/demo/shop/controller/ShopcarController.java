package test.demo.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import test.demo.shop.domain.Shopcar;
import test.demo.shop.domain.User;
import test.demo.shop.service.IShopcarService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/shopcar")
public class ShopcarController {
    @Autowired
    private IShopcarService shopcarService;
    @RequestMapping("/addOrUpdateShopcar.do")
    public String addOrUpdateShopcar(Integer productId, Integer number, HttpSession session) throws Exception {
        User user = (User) session.getAttribute("session_user");
        Integer userId = user.getId();
        shopcarService.addOrUpdateShopcar(productId, userId, number);
        return "redirect:findByUserId.do";
    }

    @RequestMapping("/findByUserId.do")
    public ModelAndView findByUserId(HttpSession session) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) session.getAttribute("session_user");
        List<Shopcar> shopcarList = shopcarService.findByUserId(user.getId());
        modelAndView.addObject("shopcarList", shopcarList);
        modelAndView.setViewName("shopcar");
        modelAndView.addObject("shopcarFindByUserId", "active");
        return modelAndView;
    }

    @RequestMapping("/totalMoney.do")
    @ResponseBody
    public Double totalMoney(Integer id) throws Exception {
        List<Shopcar> shopcarList = shopcarService.findByUserId(id);
        Double totalMoney = 0.0;
        for(Shopcar shopcar : shopcarList) {
            totalMoney += shopcar.getBuynum() * shopcar.getProduct().getDiscountPrice();
        }
        return totalMoney;
    }

    @RequestMapping("/updateShopcar.do")
    @ResponseBody
    public void updateShopcar(Integer productId, Integer userId, Integer buynum) throws Exception {
        shopcarService.updateShopcar(productId, userId, buynum);
    }

    @RequestMapping("/deleteShopCar.do")
    public String deleteShopCar(Shopcar shopcar) throws Exception {
        shopcarService.deleteShopCar(shopcar);
        return "redirect:findByUserId.do";
    }

    @RequestMapping("/delCheckedShopCar.do")
    public String delCheckedShopCar(String orderInfo) throws Exception {
        String[] orders = orderInfo.split("#");
        Integer userId = Integer.parseInt(orders[0]);
        String[] orderProductInfos = null;
        Shopcar shopcar = new Shopcar();
        for (int i = 1; i < orders.length ; i++) {
            orderProductInfos = orders[i].split("_"); //String[]
            Integer productId = Integer.parseInt(orderProductInfos[0]);
            shopcar.setProductId(productId);
            shopcar.setUserId(userId);
            shopcarService.deleteShopCar(shopcar);
        }
        return "redirect:findByUserId.do";
    }

}
