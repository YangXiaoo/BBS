package online.yangxiao.controller;

// import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import javax.servlet.http.HttpServletRequest;

import online.yangxiao.common.CodeCaptchaServlet;
import online.yangxiao.common.MD5Util;
import online.yangxiao.entity.User;
import online.yangxiao.entity.Category;
import online.yangxiao.service.UserService;
import online.yangxiao.service.CategoryService;
import online.yangxiao.controller.BaseController;

import java.util.*;
import java.util.concurrent.TimeUnit;

@Controller
public class PublicContoller extends BaseController {
    private final static Logger log = Logger.getLogger(PublicContoller.class);

    @Autowired
    private UserService userService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private RedisTemplate redisTemplate;

    @RequestMapping("/headerBar")
    public String header(Model model) {
    	log.info("header-bar request.");
    	
    	User user = getCurrentUser();
    	if (user != null) {
    		
    		// 用户的其他信息
    		// waiting...
    	}
    	model.addAttribute("user", user);
        
        return "public/headerBar";
    }

    @RequestMapping("/indexSide")
    public String indexSide(Model model) {
    	// 最新创建的10个用户
    	List<User> newUser = userService.findByTime(10);

    	// 最多浏览量的分类
    	List<Category> hotCate = categoryService.findByBrowse();
    	Set<String> onlineUserId = redisTemplate.opsForSet().members("onlineUser");
    	List<User> onlineUser = new LinkedList<>();
    	for (String uid : onlineUserId) {
    	    onlineUser.add(userService.findById(Integer.valueOf(uid)));
        }

    	model.addAttribute("onlineUserList", onlineUser);
    	model.addAttribute("newUserList", newUser);
    	model.addAttribute("hotCate", hotCate);

    	return "public/indexSide";
    }
}