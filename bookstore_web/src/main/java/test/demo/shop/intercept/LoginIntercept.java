package test.demo.shop.intercept;

import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import test.demo.shop.domain.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginIntercept implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("session_user");
        if(ObjectUtils.isEmpty(user)) {
            request.setAttribute("message", "您尚未登录, 请登录后再进行相关操作!");
            request.getRequestDispatcher("/login.do").forward(request, response);
            return false;
        }
        return true;
    }
}
