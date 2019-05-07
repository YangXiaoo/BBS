package online.yangxiao.controller;

import com.alibaba.fastjson.JSON;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import online.yangxiao.common.PageHelper.Page;
import online.yangxiao.entity.Category;
import online.yangxiao.service.CategoryService;

import java.util.*;

import static online.yangxiao.common.AjaxReturn.*;

@Controller
public class AdminCategoryController {
	private final static Logger log = Logger.getLogger(AdminCategoryController.class);

	@Autowired
	private CategoryService categoryService;


    @RequestMapping("/admin/category")
    public String categoryList(Model model, 
                               @RequestParam(value="pageNum", required=false) Integer pageNum,
                               @RequestParam(value="pageSize", required=false) Integer pageSize) {
        log.info("/admin/category");
        Page<Category> page = categoryService.findAll(pageNum, pageSize);

        model.addAttribute("page", page);
        model.addAttribute("categoryList", JSON.toJSONString(page.getResult()));

        return "/admin/category/index";
    }


    @RequestMapping("/admin/category/add")
    public String addCategory(Model model) {
        log.info("admin/addCategory");
        model.addAttribute("info", "info-index");

        return "/admin/category/add";
    }


    @RequestMapping("/admin/category/saveNewCategory")
    @ResponseBody
    public Map<String,Object> saveNewCategory(Model model,
                                              @RequestParam(value="categoryName", required=false) String categoryName,
                                              @RequestParam(value="desc", required=false) String desc,
                                              @RequestParam(value="status", required=false) String status,
                                              @RequestParam(value="sorts", required=false) Integer sorts) {
        // 数据类型在前端检查
        log.info("admin/uploadCategory");
        Category category = new Category();
        category.setCategoryName(categoryName);
        category.setDescription(desc);
        category.setStatus(status);
        category.setSorts(sorts);
        int ret = categoryService.addCategory(category);

        Map<String, Object> map = ajaxReturn("保存成功", "/admin/category");

        return map;
    }

    @RequestMapping("/admin/category/delete")
    @ResponseBody
    public Map<String,Object> categoryDelete(@RequestParam(value="id") String id) {
        // id为字符串"1,2,3,4"
        log.info("/admin/category/delete");
        Map<String, Object> map = new HashMap<>();

        String[] idList = id.split(",");
        System.out.println("[/admin/category/delete] idList: " + Arrays.toString(idList));

        if (idList.length == 0) {
            map = ajaxReturn("未知操作");

            return map;
        }

        try {
            // 逐个删除
            for (String x : idList) {
                categoryService.deleteById(Integer.valueOf(x));
            }
            map = ajaxReturn("删除成功", "");
        } catch (Exception e) {
            e.printStackTrace();
            map = ajaxReturn("删除失败");
        }

        return map;
    }
}

