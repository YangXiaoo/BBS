package online.yangxiao.service;

import online.yangxiao.common.PageHelper;
import online.yangxiao.entity.Category;

import java.util.List;

public interface CategoryService {

    int addCategory(Category category);

    Category findById(Integer cid);

    List<Category> findAll();

    void updateById(Category category);

    void deleteById(Integer cid);

    PageHelper.Page<Category> findAll(Integer pageNum, Integer pageSize);
}
