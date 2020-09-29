package test.demo.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import test.demo.shop.domain.Address;
import test.demo.shop.domain.User;
import test.demo.shop.service.IAddressService;
import test.demo.shop.service.IUserService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/address")
public class AddressController {
    @Autowired
    private IAddressService addressService;

    @RequestMapping("/findByUserId.do")
    public ModelAndView findByUserId(HttpSession session) throws Exception {
        User user = (User) session.getAttribute("session_user");
        ModelAndView modelAndView = new ModelAndView();
        List<Address> addressList = addressService.findByUserId(user.getId());
        modelAndView.addObject("addressList", addressList);
        modelAndView.setViewName("addressList");
        modelAndView.addObject("addressFindByUserId", "active");
        Object errorMessage = session.getAttribute("errorMessage");
        if(!ObjectUtils.isEmpty(errorMessage)) {
            modelAndView.addObject("errorMessage", (String)errorMessage);
            session.removeAttribute("errorMessage");
        }
        return modelAndView;
    }

    @RequestMapping("/addOrUpdateAddress.do")
    public String addOrUpdateAddress(Address address) throws Exception {
        if(ObjectUtils.isEmpty(address.getId())) {
            addressService.save(address);
        } else {
            addressService.update(address);
        }
        return "redirect:findByUserId.do";
    }

    @RequestMapping("/setDefault.do")
    public String setDefault(Address address) throws Exception {
        addressService.setDefault(address);
        return "redirect:findByUserId.do";
    }
    @RequestMapping("/deleteAddress.do")
    public String deleteAddress(Address address, HttpSession session) throws Exception {
        String errorMessage = addressService.deleteAddress(address);
        if (!StringUtils.isEmpty(errorMessage)) {
            session.setAttribute("errorMessage", errorMessage);
        }
        return "redirect:findByUserId.do";
    }

    @RequestMapping("/addAddress.do")
    public ModelAndView addAddress(Address address, HttpSession session, Double totalMoney ) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        if(!ObjectUtils.isEmpty(totalMoney)) {
            modelAndView.addObject("totalMoney", totalMoney);
        }
        addressService.save(address);
        User user = (User) session.getAttribute("session_user");
        List<Address> addressList = addressService.findByUserId(user.getId());
        modelAndView.addObject("addressList", addressList);
        modelAndView.setViewName("confirmOrderInfo");
        return modelAndView;
    }
}
