package test.demo.shop.manage.controller;

import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import test.demo.shop.domain.Address;
import test.demo.shop.domain.User;
import test.demo.shop.service.IUserService;

import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("/manage/user")
@Controller
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
        if (resultUser.getRole() == 2) {
            session.setAttribute("session_user", resultUser);
            return "redirect:/manage/order/indexOrder.do";
        } else {
            model.addAttribute("error_message", "您不是管理员, 无法进行操作!");
            return "login";
        }
    }
    @RequestMapping("/logout.do")
    public ModelAndView logout(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView();
        session.removeAttribute("session_user");
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @RequestMapping("/findAllRoleOne.do")
    public ModelAndView findAllRoleOne(@RequestParam(value = "page", defaultValue = "1", required = true) Integer page) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<User> userList = userService.findAllRoleOne(page);
        PageInfo<User> pageInfo = new PageInfo<>(userList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("pageResources", "findAllRoleOne.do");
        modelAndView.addObject("user_aside", "active");
        modelAndView.setViewName("userList");
        return modelAndView;
    }
    @RequestMapping("/findByUsername.do")
    public ModelAndView findByUsername(String username, @RequestParam(value = "page", defaultValue = "1", required = true) Integer page) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<User> userList = userService.findByUsername(StringUtils.isEmpty(username) ? null : "%"+username + "%", page);
        PageInfo<User> pageInfo = new PageInfo<>(userList);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("pageResources", "findByUsername.do");
        modelAndView.addObject("user_aside", "active");
        modelAndView.setViewName("userList");
        return modelAndView;
    }
    @RequestMapping("/findUserNum.do")
    @ResponseBody
    public Integer findUserNum() throws Exception {
        return userService.findUserNum();
    }
}
