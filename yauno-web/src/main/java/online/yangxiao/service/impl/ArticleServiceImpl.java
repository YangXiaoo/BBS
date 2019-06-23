package online.yangxiao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import online.yangxiao.common.PageHelper;
import online.yangxiao.common.PageHelper.Page;
import online.yangxiao.dao.ArticleMapper;
import online.yangxiao.entity.Article;
import online.yangxiao.service.ArticleService;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService{
    @Autowired
    private ArticleMapper articleMapper;

    public int addArticle(Article article) {
        return articleMapper.insertSelected(article);
    }


    public List<Article> findByUserId(Integer uid) {
        return articleMapper.selectByUserId(uid);
    }


    public List<Article> findAll() {
        return articleMapper.select(null);
    }

    public Article findById(Integer aid) {
        return articleMapper.selectById(aid);
    }

    public void updateById(Article content) {
        articleMapper.updateByPrimaryKeySelective(content);
    }


    public void deleteById(Integer cid) {
        articleMapper.deleteArticleById(cid);
    }

    public Page<Article> findAll(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Article> list = articleMapper.select(null);
        Page endPage = PageHelper.endPage();

        return endPage;
    }

    public List<Article> selectAllByJoin() {
        return articleMapper.selectAllByJion();
    }

    public Page<Article> findAllByJoin(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Article> list = articleMapper.selectAllByJion();
        Page endPage = PageHelper.endPage();

        return endPage;
    }

    public Page<Article> findAllByTime(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Article> list = articleMapper.selectAllByTime();
        Page endPage = PageHelper.endPage();

        return endPage;
    }

    public Page<Article> findAllByBrowse(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Article> list = articleMapper.selectAllByTime();
        Page endPage = PageHelper.endPage();

        return endPage;
    }

    public Page<Article> findByCategoryId(Integer cid, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Article> list = articleMapper.selectByCategoryId(cid);
        Page endPage = PageHelper.endPage();

        return endPage;
    }

    public Page<Article> findByUserId(Integer uid, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Article> list = articleMapper.selectByUserId(uid);
        Page endPage = PageHelper.endPage();

        return endPage;
    }
}
