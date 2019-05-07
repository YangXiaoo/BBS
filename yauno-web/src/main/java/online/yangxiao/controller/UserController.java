package online.yangxiao.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import online.yangxiao.controller.BaseController;
import online.yangxiao.common.PageHelper.Page;
import online.yangxiao.entity.Article;
import online.yangxiao.entity.Category;
import online.yangxiao.entity.User;
import online.yangxiao.service.ArticleService;
import online.yangxiao.service.CategoryService;
import online.yangxiao.service.UserService;

import java.util.List;

@Controller
public class UserController extends BaseController {
	private final static Logger log = Logger.getLogger(CategoryController.class);

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ArticleService articleService;

	@Autowired
	private UserService userService;

    @RequestMapping("/user")
    public String category(Model model,
                           @RequestParam(value="uid", required=false) Integer uid) {
        // 查询用户粉丝,关注,收藏,等级
        
    	User user = userService.findById(uid);
        User curUser = getCurrentUser();
        Integer isCurUser = 0;  // 查询对象是否为当前用户,默认不是

        if (user.getId() == curUser.getId()) {
            isCurUser = 1;
        }

        Page<Article> pageArticle = articleService.findByUserId(uid, 0, 10);

        // 为了统一模板
        for (Article a : pageArticle.getResult()) {
            a.setUser(user);
        }

        model.addAttribute("user", user);
        model.addAttribute("isCurUser", isCurUser);
        model.addAttribute("page", pageArticle);

        return "category/index";
    }

}