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
import online.yangxiao.entity.Article;
import online.yangxiao.entity.Category;
import online.yangxiao.service.ArticleService;
import online.yangxiao.service.CategoryService;

import java.util.*;

import static online.yangxiao.common.AjaxReturn.*;

@Controller
public class AdminArticleController {
	private final static Logger log = Logger.getLogger(AdminArticleController.class);

	@Autowired
	private ArticleService articleService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/admin/article")
    public String articleList(Model model, 
                              @RequestParam(value="pageNum", required=false) Integer pageNum,
                              @RequestParam(value="pageSize", required=false) Integer pageSize) {
        log.info("/admin/article");
        Page<Article> page = articleService.findAllByJoin(pageNum, pageSize);

        model.addAttribute("page", page);
        model.addAttribute("articleList", JSON.toJSONString(page.getResult()));

        return "/admin/article/index";
    }


    @RequestMapping("/admin/article/add")
    public String addArticle(Model model,
                             @RequestParam(value="cid", required=false) Integer cid) {
        log.info("admin/addArticle");
        System.out.println("[admin/addArticle] cid: " + cid);
        if (cid != null) {
            model.addAttribute("cid", cid);
        } else {
            model.addAttribute("cid", 0);
        }
        
        List<Category> cateList = categoryService.findAll();
        model.addAttribute("cateList", cateList);

        return "/admin/article/add";
    }


    @RequestMapping("/admin/article/save")
    @ResponseBody
    public Map<String,Object> saveNewArticle(Model model,
                                             @RequestParam(value="typeid", required=false) Integer cid,
                                             @RequestParam(value="title", required=false) String title,
                                             @RequestParam(value="description", required=false) String desc,
                                             @RequestParam(value="flag[]", required=false) String flag,
                                             @RequestParam(value="pic", required=false) String pic,
                                             @RequestParam(value="content", required=false) String content,
                                             @RequestParam(value="status", required=false) String status) {
        // 数据类型在前端检查
        log.info("/admin/article/save");

        // 保存文章
        Article article = new Article();
        article.setUserId(3);
        article.setCategoryId(cid);
        article.setTitle(title);
        article.setDescription(desc);
        log.debug("flag: " + flag);
        String[] flags = flag.split(",");
        for (String f : flags) {
            if (flag == "h") {      // 设置为置顶
                article.setTop("1");
            }
            if (flag == "p") {      // 封面图像
                article.setPic(pic);
            }
        }
        article.setContent(content);
        article.setStatus(status);
        articleService.addArticle(article);

        // 分类文章+1
        Category category = categoryService.findById(cid);
        category.setPaperCount(category.getPaperCount() + 1);
        categoryService.updateById(category);

        Map<String, Object> map = ajaxReturn("文章保存成功", "/admin/article");

        return map;
    }

    @RequestMapping("/admin/article/delete")
    @ResponseBody
    public Map<String,Object> articleDelete(@RequestParam(value="id") String id) {

        log.info("/admin/article/delete");
        Map<String, Object> map = new HashMap<>();

        String[] idList = id.split(",");

        if (idList.length == 0) {
            map = ajaxReturn("未知操作");

            return map;
        }

        try {
            // 逐个删除
            for (String x : idList) {
                articleService.deleteById(Integer.valueOf(x));
            }
            map = ajaxReturn("删除成功", "");
        } catch (Exception e) {
            e.printStackTrace();
            map = ajaxReturn("删除失败");
        }

        return map;
    }
}

