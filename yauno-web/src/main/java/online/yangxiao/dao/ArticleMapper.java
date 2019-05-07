package online.yangxiao.dao;

import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;
import online.yangxiao.entity.Article;

import java.util.List;

public interface ArticleMapper extends Mapper<Article>{
	String TABLE_NAME = "article";
	String INSERT_FIELDS = "user_id, category_id, title, pic, description, top, content, status";
	String SELECT_FIELDS = "id, user_id, category_id, title, pic, description, top, content, status, upvote, downvote, comment_count, browse, favorite, create_time";
	List<Article> selectAllByJion();

	 List<Article> selectAllByTime();

	 List<Article> selectAllByBrowse();


    int insertSelected(Article article);

    // 删除
	@Delete({"DELETE FROM",TABLE_NAME, "WHERE id=#{aid}"})
	int deleteArticleById(@Param("aid") Integer aid);

	@Select({"Select", SELECT_FIELDS, "FROM", TABLE_NAME, "WHERE id=#{aid}"})
	Article selectById(@Param("aid") Integer aid);
}