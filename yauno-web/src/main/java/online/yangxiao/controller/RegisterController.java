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
import online.yangxiao.mail.SendEmail;
import online.yangxiao.service.UserService;
import online.yangxiao.controller.BaseController;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@Controller
public class RegisterController extends BaseController {
    private final static Logger log = Logger.getLogger(RegisterController.class);
    @Autowired
    private UserService userService;

    /**
     * 判断邮箱是否已经被注册
     * @param email
     * @return
     */
    @RequestMapping("/checkEmail")
    @ResponseBody   // @responseBody注解的作用是将controller的方法返回的对象通过适当的转换器转换为指定的格式之后，
                    // 写入到response对象的body区，通常用来返回JSON数据或者是XML
    public Map<String, Object> checkEmail(Model model, @RequestParam(value = "email", required = false) String email) {
        log.debug("注册 - 判断邮箱"+ email + "是否可用");
        Map map = new HashMap<String, Object>();
        User user = userService.findByEmail(email);
        if (user == null) {
            map.put("message", "success");
        } else {
            map.put("message", "fail");
        }
        return map;
    }


    /**
     * 判断验证码是否正确
     *
     * @param model
     * @param code
     * @return
     */
    @RequestMapping("/checkCode")
    @ResponseBody
    public Map<String, Object> checkCode(Model model, @RequestParam(value = "code", required = false) String code) {
        log.debug("注册-判断验证码" + code + "是否可用");
        Map map = new HashMap<String, Object>();
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        String vcode = (String) attrs.getRequest().getSession().getAttribute(CodeCaptchaServlet.VERCODE_KEY);

        if (code.equals(vcode)) {
            //验证码正确
            map.put("message", "success");
        } else {
            //验证码错误
            map.put("message", "fail");
        }

        return map;
    }

    // 指定请求的method类型, GET、POST、PUT、DELETE等；
    @RequestMapping("/doRegister")
    public String doRegister(Model model, 
                            @RequestParam(value="email", required=false) String email, 
                            @RequestParam(value="password", required=false) String password,
                            @RequestParam(value="nickName", required=false) String username) {
        log.debug("register.");
        User user = userService.findByEmail(email);
        if (user != null) {
            model.addAttribute("error", "该用户已经被注册！");
            return "../register";
        } else {
            user = new User();
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(email);
            user.setProfile("/images/default_icon.jpg");
            
            // String validateCode = MD5Util.encodeToHex("salt"+email + password);
            // redisTemplate.opsForValue().set(email, validateCode, 24, TimeUnit.HOURS);// 24小时 有效激活 redis保存激活码
            userService.regist(user);   // service/UserService.java定义此方法

            return "../login";
        }
    }


    @RequestMapping("/regist")
    public String register(Model model) {

        log.info("进入注册页面");

        return "../regist";
    }

    @RequestMapping("/main")
    public String main(Model mode, HttpServletRequest req) {
        if (req.getHeader("X-PJAX") != null) {
            log.info("pjax request");
            System.out.println("-------ajax request--------");
            mode.addAttribute("info", "-------ajax request--------");
        } else {
            mode.addAttribute("info", "normal request");
        }
        return "../main";
    }
}

