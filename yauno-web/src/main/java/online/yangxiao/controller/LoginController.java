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

import online.yangxiao.entity.User;
import online.yangxiao.service.UserService;
import static online.yangxiao.common.AjaxReturn.*;

import java.util.*;

@Controller
public class LoginController extends BaseController {
	private final static Logger log = Logger.getLogger(LoginController.class);

	@Autowired
	private UserService userService;

	@RequestMapping("/login")
	@ResponseBody
	public Map<String, Object> doLogin(Model model,
											   @RequestParam(name = "username", required = false) String username,
											   @RequestParam(name = "password", required = false) String password) {
		User user = userService.findByUsername(username);
		Map map = new HashMap<String, Object>();
		log.debug(user.getPassword() + ", " + password);
		if (user == null) {
			map = ajaxReturn("用户不存在");
		} else {
			if (!user.getPassword().trim().equals(password.trim())) {
				map = ajaxReturn("密码错误");
			} else {
				map= ajaxReturn("登录成功", "success");
				getSession().setAttribute("user", user);
			}
		}

		return map;
	}
}
