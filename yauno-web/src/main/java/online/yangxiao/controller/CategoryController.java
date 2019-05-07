package online.yangxiao.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import online.yangxiao.entity.Article;
import online.yangxiao.service.ArticleService;

import java.util.List;

@Controller
public class CategoryController {
	private final static Logger log = Logger.getLogger(CategoryController.class);

    @RequestMapping("/category")
    public String category(Model mode) {
        mode.addAttribute("title", "分类");
        return "category/index";
    }


}