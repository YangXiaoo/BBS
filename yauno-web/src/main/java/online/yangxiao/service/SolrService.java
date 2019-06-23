package online.yangxiao.service;
import online.yangxiao.entity.Article;
import online.yangxiao.common.PageHelper.Page;

public interface SolrService {
    Page<Article> findByKeyWords(String keyword, Integer pageNum, Integer pageSize);

    public void addArticle(Article cont);

    public void updateArticle(Article cont);

    public void deleteById(Integer id);
}