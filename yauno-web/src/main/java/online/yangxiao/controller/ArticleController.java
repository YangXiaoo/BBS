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
import online.yangxiao.entity.Comment;
// import online.yangxiao.entity.UserInfo;
import online.yangxiao.service.ArticleService;
import online.yangxiao.service.CategoryService;
import online.yangxiao.service.UserService;
import online.yangxiao.service.CommentService;

import static online.yangxiao.common.AjaxReturn.*;

import java.util.List;

@Controller
public class ArticleController {
	private final static Logger log = Logger.getLogger(ArticleController.class);

	@Autowired
	private ArticleService articleService;

	@Autowired
	private UserService userService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private CommentService commentService;

    @RequestMapping("/article")
    public String article(Model model, 
                          @RequestParam(value="aid", required=false) Integer aid) {
        log.info("article detail.");
        // 不使用关联查找
        Article article = articleService.findById(aid);
        User user = userService.findById(article.getUserId());
        Category category = categoryService.findById(article.getCategoryId());

        // 查询前10条评论
        Page<Comment> page = commentService.findAllByArticleId(aid, 1, 10);
        for (Comment cmt : page.getResult()) {
        	List<Comment> childComments = commentService.findAllChild(cmt.getId());
        	User ruser = userService.findById(cmt.getUserId());
        	cmt.setUser(ruser);

        	for (Comment child : childComments) {
	        	User cuser = userService.findById(child.getUserId());
	        	child.setUser(cuser);
                child.setPuser(ruser);
                cmt.setComment(child);
        	}
        }

        model.addAttribute("a", article);
        model.addAttribute("user", user);
        model.addAttribute("cate", category);
        model.addAttribute("comments", page);
        return "article/detail";
    }
	


}

