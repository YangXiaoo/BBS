package online.yangxiao.controller;

// import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.data.redis.core.RedisTemplate;
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
import online.yangxiao.service.UserService;
import online.yangxiao.controller.BaseController;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Controller
public class PublicContoller extends BaseController {
    private final static Logger log = Logger.getLogger(PublicContoller.class);

    @RequestMapping("/headerBar")
    public String header(Model model) {
    	User user = getCurrentUser();
    	if (user != null) {
    		
    		// 用户的其他信息
    		// waiting...
    	}
    	model.addAttribute("user", user);
        log.info("header-bar request.");
        
        return "public/headerBar";
    }
}