package online.yangxiao.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import online.yangxiao.common.PageHelper.Page;
import online.yangxiao.entity.Article;
import online.yangxiao.entity.Category;
import online.yangxiao.entity.User;
import online.yangxiao.service.ArticleService;
import online.yangxiao.service.CategoryService;
import online.yangxiao.service.UserService;

import java.util.List;

@Controller
public class CategoryController {
	private final static Logger log = Logger.getLogger(CategoryController.class);

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private ArticleService articleService;

	@Autowired
	private UserService userService;

    @RequestMapping("/category")
    public String category(Model model) {
    	List<Category> cateList = categoryService.findAll();
        model.addAttribute("cateList", cateList);
        return "category/index";
    }


    @RequestMapping("/category/deatil")
    public String categoryDetail(Model model,
    							 @RequestParam(value="cid", required=false) Integer cid,
    							 @RequestParam(value="pageNum", required=false) Integer pageNum,
                              	 @RequestParam(value="pageSize", required=false) Integer pageSize) {
    	Category cate = categoryService.findById(cid);
    	Page<Article> pageArticle = articleService.findByCategoryId(cid, pageNum, pageSize);

    	// 应该使用关联查找, 但懒得写SQL
    	for (Article a : pageArticle.getResult()) {
    		User user = userService.findById(a.getUserId());
    		a.setUser(user);
    	}

    	model.addAttribute("cate", cate);
    	model.addAttribute("page", pageArticle);

    	return "category/detail";
    }
}