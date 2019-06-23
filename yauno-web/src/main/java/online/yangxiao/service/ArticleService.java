package online.yangxiao.service;

import online.yangxiao.common.PageHelper;

import online.yangxiao.entity.Article;

import java.util.List;

public interface ArticleService {
    
    int addArticle(Article content);

	// int insertArticle(Article article);
	
    List<Article> findByUserId(Integer uid);

    Article findById(Integer aid);

    List<Article> findAll();

    void updateById(Article content);

    void deleteById(Integer cid);

    PageHelper.Page<Article> findAll(Integer pageNum, Integer pageSize);

    List<Article> selectAllByJoin();

    PageHelper.Page<Article> findAllByJoin(Integer pageNum, Integer pageSize);

    PageHelper.Page<Article> findAllByTime(Integer pageNum, Integer pageSize);

    PageHelper.Page<Article> findAllByBrowse(Integer pageNum, Integer pageSize);

    PageHelper.Page<Article> findByCategoryId(Integer cid, Integer pageNum, Integer pageSize);

    PageHelper.Page<Article> findByUserId(Integer uid, Integer pageNum, Integer pageSize);
}
