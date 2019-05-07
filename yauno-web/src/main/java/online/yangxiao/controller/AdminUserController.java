package online.yangxiao.controller;

import com.alibaba.fastjson.JSON;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.PathVariable;

import online.yangxiao.common.PageHelper.Page;
import online.yangxiao.entity.User;
import online.yangxiao.service.UserService;

import java.util.*;

import static online.yangxiao.common.AjaxReturn.*;

@Controller
public class AdminUserController {
	private final static Logger log = Logger.getLogger(AdminUserController.class);

	@Autowired
	private UserService userService;


    @RequestMapping("/admin/user")
    public String userList(Model model, 
                              @RequestParam(value="pageNum", required=false) Integer pageNum,
                              @RequestParam(value="pageSize", required=false) Integer pageSize) {
        log.info("/admin/user");
        Page<User> page = userService.findAll(pageNum, pageSize);

        model.addAttribute("page", page);
        model.addAttribute("userList", JSON.toJSONString(page.getResult()));

        return "/admin/user/index";
    }


    @RequestMapping("/admin/user/add")
    public String addUser(Model model) {
        log.info("admin/addUser");

        return "/admin/user/add";
    }


    @RequestMapping("/admin/user/save")
    @ResponseBody
    public Map<String,Object> saveNewUser(Model model,
                                          @RequestParam(value="username", required=false) String username,
                                          @RequestParam(value="password",required=false) String password,
                                          @RequestParam(value="email", required=false) String email,
                                          @RequestParam(value="status", required=false) String status,
                                          @RequestParam(value="admin", required=false) String admin) {
        // 数据类型在前端检查
        log.info("/admin/user/save");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setIsActive(status);
        user.setIsAdmin(admin);
        user.setProfile("/images/default_profile.jpg");
        userService.regist(user);

        Map<String, Object> map = ajaxReturn("用户添加成功", "/admin/user");

        return map;
    }

    @RequestMapping("/admin/user/delete")
    @ResponseBody
    public Map<String,Object> userDelete(@RequestParam(value="id") String id) {

        log.info("/admin/user/delete");
        Map<String, Object> map = new HashMap<>();

        String[] idList = id.split(",");

        if (idList.length == 0) {
            map = ajaxReturn("未知操作");

            return map;
        }

        try {
            // 逐个删除
            for (String x : idList) {
                userService.deleteById(Integer.valueOf(x));
            }
            map = ajaxReturn("删除成功", "");
        } catch (Exception e) {
            e.printStackTrace();
            map = ajaxReturn("删除失败");
        }

        return map;
    }
}

