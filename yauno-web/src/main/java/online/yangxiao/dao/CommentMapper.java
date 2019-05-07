package online.yangxiao.dao;

import org.apache.ibatis.annotations.*;
import online.yangxiao.entity.Comment;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface CommentMapper extends Mapper<Comment> {
	String TABLE_NAME = "comment";
	String SELECT_FIELDS = "id, user_id, article_id, pcomment_id, content, upvote, downvote, status, viewed, create_time";

	@Select({"Select", SELECT_FIELDS, "FROM", TABLE_NAME, "WHERE article_id=#{aid} AND pcomment_id=0"})
	List<Comment> selectByArticleId(@Param("aid") Integer aid);

	@Select({"Select", SELECT_FIELDS, "FROM", TABLE_NAME, "WHERE pcomment_id=#{pid}"})
	List<Comment> selectAllChild(@Param("pid") Integer pid);

    // 删除
	@Delete({"DELETE FROM",TABLE_NAME, "WHERE id=#{cid}"})
	int deleteCommentById(@Param("cid") Integer aid);
}