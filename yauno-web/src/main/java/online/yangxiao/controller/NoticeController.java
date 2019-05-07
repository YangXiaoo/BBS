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
public class NoticeController {
	private final static Logger log = Logger.getLogger(NoticeController.class);

    @RequestMapping("/notice")
    public String notice(Model mode) {
        mode.addAttribute("info", "公告");
        return "notice/index";
    }


}