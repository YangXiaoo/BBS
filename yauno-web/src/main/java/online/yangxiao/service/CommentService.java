package online.yangxiao.service;

import online.yangxiao.common.PageHelper;

import online.yangxiao.entity.Comment;

import java.util.List;

public interface CommentService {
    
    int addComment(Comment content);

    Comment findByCommentId(Integer cid);

    void deleteById(Integer cid);

    PageHelper.Page<Comment> findAll(Integer pageNum, Integer pageSize);

    PageHelper.Page<Comment> findAllByArticleId(Integer aid, Integer pageNum, Integer pageSize);

    List<Comment> findAllChild(Integer pid);
}
