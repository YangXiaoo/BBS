package online.yangxiao.controller;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.context.SecurityContext;
//import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import online.yangxiao.common.PageHelper.Page;
import online.yangxiao.entity.User;
import online.yangxiao.entity.Article;
import online.yangxiao.service.ArticleService;
import online.yangxiao.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Component
public class BaseController { 
    private static final String[] HEADERS_TO_TRY = {
            "X-Forwarded-For",
            "Proxy-Client-IP",
            "WL-Proxy-Client-IP",
            "HTTP_X_FORWARDED_FOR",
            "HTTP_X_FORWARDED",
            "HTTP_X_CLUSTER_CLIENT_IP",
            "HTTP_CLIENT_IP",
            "HTTP_FORWARDED_FOR",
            "HTTP_FORWARDED",
            "HTTP_VIA",
            "REMOTE_ADDR",
            "X-Real-IP"};

    @Autowired
    private ArticleService articleService;

    @Autowired
    private UserService userService;

    // 根据Id查看用户是否登录
    public boolean isLogin(Integer id){
        if(id != null ){
            User user = userService.findById( id );
            if(user!=null){
                return true;
            }
        }
        return false;
    }

    // 根据id获取用户
    public User getUser(Integer id){
        User user = userService.findById( id );
        return user;
    }


    // 获取request
    public static HttpServletRequest getRequest() {
        ServletRequestAttributes attrs =(ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attrs.getRequest();
    }

    // 获取response
    public static HttpServletResponse getResponse() {
        HttpServletResponse response = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getResponse();
        return response;
    }

    // 获取session
    public static HttpSession getSession() {
        HttpSession session = null;
        try {
            session = getRequest().getSession();
        } catch (Exception e) {}
        return session;
    }

    // 获取客户端ip地址(可以穿透代理)
    public static String getClientIpAddress() {
        HttpServletRequest request = getRequest();
        for (String header : HEADERS_TO_TRY) {
            String ip = request.getHeader(header);
            if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
                return ip;
            }
        }
        return request.getRemoteAddr();
    }

    // 获取当前用户
    public User getCurrentUser(){
        User user = null;
        user = (User)getSession().getAttribute("user");
        return user;
    }

}