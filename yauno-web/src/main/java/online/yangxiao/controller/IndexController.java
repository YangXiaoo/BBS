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
import online.yangxiao.entity.User;
import online.yangxiao.entity.Category;
import online.yangxiao.service.ArticleService;
import online.yangxiao.service.CategoryService;
import online.yangxiao.service.SolrService;

import static online.yangxiao.common.AjaxReturn.*;

import java.util.List;

@Controller
public class IndexController extends BaseController{
	private final static Logger log = Logger.getLogger(IndexController.class);

	@Autowired
	private ArticleService articleService;

    @Autowired
    private SolrService solrService;

    @RequestMapping("/index")
    public String index(Model model, 
    					@RequestParam(value="keyword", required=false) String keyword,
                        @RequestParam(value="pageNum", required=false) Integer pageNum,
                        @RequestParam(value="pageSize", required=false) Integer pageSize) {
        model.addAttribute("info", "info-index");
        log.info( "===========进入index_list=========" );
        User user = getCurrentUser();
        if(user!=null){
            model.addAttribute( "user",user );
        }
        if(keyword.length() == 0){
            Page<Article> page = solrService.findByKeyWords(keyword, pageNum, pageSize);
            model.addAttribute("keyword", keyword);
            model.addAttribute("page", page);
        }else {
            Page<Article> page =  articleService.findAll(pageNum, pageSize);
            model.addAttribute( "page", page );
        }
        return "../index";
    }
	

	@RequestMapping("/newArticle")
	public String newArticle(Model model, 
                             @RequestParam(value="pageNum", required=false) Integer pageNum,
                             @RequestParam(value="pageSize", required=false) Integer pageSize) {
		log.info("new article.");
        Page<Article> page = articleService.findAllByTime(pageNum, pageSize);

        model.addAttribute("page", page);

		return "article/newArticle";
	}


	@RequestMapping("/hotArticle")
	public String hotArticle(Model model, 
                             @RequestParam(value="pageNum", required=false) Integer pageNum,
                             @RequestParam(value="pageSize", required=false) Integer pageSize) {
		log.info("new article.");
        Page<Article> page = articleService.findAllByBrowse(pageNum, pageSize);

        model.addAttribute("page", page);

		return "article/hotArticle";
	}


	@RequestMapping("/pushArticle")
	public String pushArticle(Model model) {
		log.info("new article.");
		// List<Article> articleList = articleService.findAll();

		// model.addAttribute("articles", articleList);

		return "article/pushArticle";
	}


	@RequestMapping("/followArticle")
	public String followArticle(Model model) {
		log.info("new article.");
		// List<Article> articleList = articleService.findAll();

		// model.addAttribute("articles", articleList);

		return "article/followArticle";
	}

	@RequestMapping("/replyQuestion")
	public String replyQuestion(Model model) {
		log.info("new article.");
		// List<Article> articleList = articleService.findAll();

		// model.addAttribute("articles", articleList);

		return "article/replyQuestion";
	}

}

