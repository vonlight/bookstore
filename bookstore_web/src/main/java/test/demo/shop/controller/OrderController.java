package test.demo.shop.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import test.demo.shop.domain.Address;
import test.demo.shop.domain.Order;
import test.demo.shop.domain.User;
import test.demo.shop.service.IAddressService;
import test.demo.shop.service.IOrderService;
import test.demo.wechat.utils.DataJoinUtils;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("order")
public class OrderController {
    @Autowired
    private IOrderService orderService;

    @Autowired
    private IAddressService addressService;
    @RequestMapping("/orderSubmit.do")
    public ModelAndView orderSubmit(HttpSession session, Integer addressId) throws Exception {
        String orderInfo = (String) session.getAttribute("orderInfo");
        ModelAndView modelAndView = new ModelAndView();
        if(!StringUtils.isEmpty(orderInfo)) {
            Order order = orderService.orderSubmit(orderInfo, addressId);
            modelAndView.addObject("order", order);
        }

        modelAndView.setViewName("pay");
        return modelAndView;
    }

    @RequestMapping("/showOrder.do")
    public ModelAndView showOrder(HttpSession session, @RequestParam(required = true, value = "page", defaultValue = "1") Integer page) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) session.getAttribute("session_user");
        List<Order> orderList = orderService.findByUserId(user.getId(), page);
        PageInfo<Order> pageInfo = new PageInfo<>(orderList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("order");
        modelAndView.addObject("allOrder", "btn-primary" );
        modelAndView.addObject("showOrder", "active");
        modelAndView.addObject("pageDo", "showOrder.do");
        return modelAndView;
    }

    @RequestMapping("/confirmOrderInfo.do")
    public ModelAndView confirmOrderInfo(String orderInfo, HttpSession session, Double totalMoney) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        session.setAttribute("orderInfo", orderInfo);
        User user = (User) session.getAttribute("session_user");
        List<Address> addressList = addressService.findByUserId(user.getId());
        modelAndView.addObject("addressList", addressList);
        modelAndView.addObject("totalMoney", totalMoney);
        modelAndView.setViewName("confirmOrderInfo");
        return modelAndView;
    }
    @RequestMapping("/queryPayStatus.do")
    @ResponseBody
    public String queryPayStatus(String orderCode){
        try {
        DataJoinUtils dataJoinUtils = new DataJoinUtils();
        Map<String, String> result = dataJoinUtils.wxOrderQuery(orderCode);
        if(CollectionUtils.isEmpty(result)) {
            return "error";
        }
        if("SUCCESS".equals(result.get("trade_state"))) {
            orderService.updateOrderCodeByOrderCode(orderCode);
            return "ok";
        }
        return "";
        } catch(Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
    @RequestMapping("/paySuccess.do")
    public ModelAndView paySuccess(Order order) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        orderService.devStorage(order);
        modelAndView.addObject("amount", order.getAmount());
        modelAndView.setViewName("paySuccess");
        return modelAndView;
    }
    @RequestMapping("/showNoPay.do")
    public ModelAndView showNoPay(HttpSession session, @RequestParam(required = true, value = "page", defaultValue = "1") Integer page) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) session.getAttribute("session_user");
        List<Order> orderList = orderService.findNoPayOrder(user.getId(), page, null);
        PageInfo<Order> pageInfo = new PageInfo<>(orderList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("order");
        modelAndView.addObject("noPay", "btn-primary" );
        modelAndView.addObject("showOrder", "active");
        modelAndView.addObject("pageDo", "showNoPay.do");
        return modelAndView;
    }
    @RequestMapping("/showPay.do")
    public ModelAndView showPay(HttpSession session, @RequestParam(required = true, value = "page", defaultValue = "1") Integer page) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) session.getAttribute("session_user");
        List<Order> orderList = orderService.findPayOrder(user.getId(), page, null);
        PageInfo<Order> pageInfo = new PageInfo<>(orderList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("order");
        modelAndView.addObject("showPay", "btn-primary" );
        modelAndView.addObject("showOrder", "active");

        modelAndView.addObject("pageDo", "showPay.do");
        return modelAndView;
    }
    @RequestMapping("/payOrder.do")
    public ModelAndView payOrder(Order order) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        Order resultOrder = orderService.findByOrder(order);
        modelAndView.addObject("order", resultOrder);
        modelAndView.setViewName("pay");
        return modelAndView;
    }
    @RequestMapping("/confirmOrder.do")
    @ResponseBody
    public void confirmOrder(Order order, Model model) throws Exception {
        order.setReceiveStatus(1);
        orderService.updateReceiveState(order);
    }
    @RequestMapping("/deleteOrder.do")
    public String deleteOrder(Integer id) throws Exception {
        orderService.deleteOrder(id);
        return "redirect:showNoPay.do";
    }
}
