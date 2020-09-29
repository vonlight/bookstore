package test.demo.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import test.demo.shop.domain.Address;
import test.demo.shop.domain.User;
import test.demo.shop.service.IUserService;

import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private IUserService userService;


    @RequestMapping("/login.do")
    public String login(String username, String password, Model model, HttpSession session) throws Exception {
        User resultUser = userService.findByUserNameAndPassword(username, password);

        if(ObjectUtils.isEmpty(resultUser)) {
            model.addAttribute("error_message", "用户名或密码错误!");
            return "login";
        }
        if (resultUser.getDisabled() == 0) {
            model.addAttribute("error_message", "您尚未激活, 请打开您的邮箱进行激活操作!");
            return "login";
        }
        session.setAttribute("session_user", resultUser);
        return "redirect:/product/index.do";
    }
    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
        session.removeAttribute("session_user");
        return "redirect:/product/index.do";
    }
    @ResponseBody
    @RequestMapping(value = "/validUsername.do", produces = {"application/text;charset=utf-8"})
    public String validUsername(User user) throws Exception {
        User resultUser = userService.findByUser(user);
        if (!ObjectUtils.isEmpty(resultUser)) {
            return "该用户名已被注册";
        }
        return "";
    }
    @RequestMapping("/userRegister.do")
    public ModelAndView userRegister(User user, Address address) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        userService.buyerSave(user, address);
        modelAndView.addObject("message", "恭喜，注册成功！请登录您的注册邮箱进行激活您的账号，激活后才能登录!");
        modelAndView.setViewName("register");
        return modelAndView;
    }
    @RequestMapping("/userActive.do")
    public ModelAndView userActive(String activeCode) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        boolean resultFlag = userService.userActive(activeCode);
        if (resultFlag) {
            modelAndView.setViewName("login");
            modelAndView.addObject("login_success_message", "激活成功, 请输入用户名和密码");
        } else {
            modelAndView.setViewName("register");
            modelAndView.addObject("error_message", "激活失败, 请联系管理员");
        }
        return modelAndView;
    }
    @RequestMapping("/userDetail.do")
    public ModelAndView userDetail(HttpSession session) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        User user = (User) session.getAttribute("session_user");
        User resultUser = userService.findByUserId(user.getId());
        modelAndView.addObject("user", resultUser);
        session.setAttribute("session_user", resultUser);
        modelAndView.setViewName("userDetail");
        Object message = session.getAttribute("message");
        if(!ObjectUtils.isEmpty(message)) {
            modelAndView.addObject("message", (String)message);
            session.removeAttribute("message");
        }
        return modelAndView;
    }
    @RequestMapping("/updateUser.do")
    public String updateUser(User user, HttpSession session) throws Exception {
        userService.updateUser(user);
        session.setAttribute("message", "资料修改成功");
        return "redirect:userDetail.do";
    }

    @RequestMapping("/updatePassword.do")
    public String updatePassword(User user, HttpSession session) throws Exception {
        userService.updateUser(user);
        session.setAttribute("message", "密码修改成功");
        return "redirect:userDetail.do";
    }
}
