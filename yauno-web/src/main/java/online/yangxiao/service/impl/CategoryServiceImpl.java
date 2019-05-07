package online.yangxiao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import online.yangxiao.common.PageHelper;
import online.yangxiao.common.PageHelper.Page;
import online.yangxiao.dao.CategoryMapper;
import online.yangxiao.entity.Category;
import online.yangxiao.service.CategoryService;

import java.util.List;


@Service
public class CategoryServiceImpl implements CategoryService{
    @Autowired
    private CategoryMapper categoryMapper;


    @Transactional
    public int addCategory(Category category) {
        int i = categoryMapper.insertSelective(category);
        return i;
    }


    public Category findById(Integer cid) {
        Category category = new Category();
        category.setId(cid);
        return categoryMapper.selectOne(category);
    }


    public List<Category> findAll() {
        return categoryMapper.select(null);
    }


    public void updateById(Category category) {
        categoryMapper.updateByPrimaryKeySelective(category);
    }


    public void deleteById(Integer cid) {
        categoryMapper.deleteCateById(cid);

    }

    public Page<Category> findAll(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Category> list = categoryMapper.select(null);
        Page endPage = PageHelper.endPage();

        return endPage;
    }

}
