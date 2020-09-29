package test.demo.shop.manage.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import test.demo.shop.domain.Order;
import test.demo.shop.service.IOrderService;

import javax.jws.WebParam;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/manage/order")
public class OrderController {
    @Autowired
    private IOrderService orderService;
    @RequestMapping("orderFindAll.do")
    public ModelAndView orderFindAll(@RequestParam(value = "page", required = true, defaultValue = "1") Integer page) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Order> orderList = orderService.findAll(page);
        PageInfo<Order> pageInfo = new PageInfo<>(orderList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("pageResource", "orderFindAll.do");
        modelAndView.addObject("orderFindAll", "active");
        modelAndView.addObject("order_aside", "active");
        modelAndView.setViewName("orderList");
        return modelAndView;
    }
    @RequestMapping("/confirmOrder.do")
    @ResponseBody
    public void confirmOrder(Order order) throws Exception {
        order.setStatus(1);
        order.setSendDate(new Date());
        orderService.updateOrder(order);
    }
    @RequestMapping("/cancelOrder.do")
    @ResponseBody
    public void cancelOrder(Order order) throws Exception {
        order.setStatus(0);
        order.setSendDate(null);
        orderService.updateOrder(order);
    }
    @RequestMapping("/orderSearch.do")
    public ModelAndView orderSearch(String orderCode, @RequestParam(value = "page", required = true, defaultValue = "1") Integer page) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Order> orderList = orderService.orderSearch(StringUtils.isEmpty(orderCode) ? null : "%"+orderCode.trim() + "%", page);
        PageInfo<Order> pageInfo = new PageInfo<>(orderList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("pageResource", "orderSearch.do");
        modelAndView.addObject("order_aside", "active");
        modelAndView.setViewName("orderList");
        return modelAndView;
    }
    @RequestMapping("/findByOrderId.do")
    public ModelAndView findByOrderId(Integer id) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        Order order = orderService.findByOrderId(id);
        modelAndView.addObject("order", order);
        modelAndView.addObject("order_aside", "active");
        modelAndView.setViewName("orderDetail");
        return modelAndView;
    }

    @RequestMapping("/detailConfirmOrder.do")
    public ModelAndView detailConfirmOrder(Order order) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        order.setStatus(1);
        order.setSendDate(new Date());
        orderService.updateOrder(order);
        Order resultOrder = orderService.findByOrderId(order.getId());
        modelAndView.addObject("order", resultOrder);
        modelAndView.addObject("order_aside", "active");
        modelAndView.setViewName("orderDetail");
        return modelAndView;
    }
    @RequestMapping("/detailCancelOrder.do")
    public ModelAndView detailCancelOrder(Order order) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        order.setStatus(0);
        order.setSendDate(null);
        orderService.updateOrder(order);
        Order resultOrder = orderService.findByOrderId(order.getId());
        modelAndView.addObject("order", resultOrder);
        modelAndView.setViewName("orderDetail");
        return modelAndView;
    }

    @RequestMapping("/showPay.do")
    public ModelAndView showPay(@RequestParam(value = "page", required = true, defaultValue = "1") Integer page) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Order> orderList = orderService.findPayOrder(null, page, 8);
        PageInfo<Order> pageInfo = new PageInfo<>(orderList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("pageResource", "showPay.do");
        modelAndView.addObject("showPay", "active");
        modelAndView.addObject("order_aside", "active");
        modelAndView.setViewName("orderList");
        return modelAndView;
    }
    @RequestMapping("/showNoPay.do")
    public ModelAndView showNoPay(@RequestParam(value = "page", required = true, defaultValue = "1") Integer page) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Order> orderList = orderService.findNoPayOrder(null, page, 8);
        PageInfo<Order> pageInfo = new PageInfo<>(orderList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("pageResource", "showNoPay.do");
        modelAndView.addObject("showNoPay", "active");
        modelAndView.addObject("order_aside", "active");
        modelAndView.setViewName("orderList");
        return modelAndView;
    }
    @RequestMapping("/findOrderNum.do")
    @ResponseBody
    public Integer findOrderNum() throws Exception {
        return orderService.findOrderNum();
    }

    @RequestMapping("/indexOrder.do")
    public ModelAndView indexOrder() throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Order> orderList = orderService.indexOrder(1, 7);
        PageInfo<Order> pageInfo = new PageInfo<>(orderList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("index");
        modelAndView.addObject("index_aside", "active");
        return modelAndView;
    }
}
