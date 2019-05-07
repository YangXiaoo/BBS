package online.yangxiao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import online.yangxiao.common.PageHelper;
import online.yangxiao.common.PageHelper.Page;
import online.yangxiao.dao.CommentMapper;
import online.yangxiao.entity.Comment;
import online.yangxiao.service.CommentService;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentMapper commentMapper;

    public int addComment(Comment comment) {
        return commentMapper.insertSelective(comment);
    }


    public Comment findByCommentId(Integer cid) {
        Comment comment = new Comment();
        comment.setId(cid);
        return commentMapper.selectOne(comment);
    }


    public void deleteById(Integer cid) {
        commentMapper.deleteCommentById(cid);
    }

    public Page<Comment> findAll(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Comment> list = commentMapper.select(null);
        Page endPage = PageHelper.endPage();

        return endPage;
    }


    public Page<Comment> findAllByArticleId(Integer aid,Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Comment> list = commentMapper.selectByArticleId(aid);
        Page endPage = PageHelper.endPage();

        return endPage;
    }

    public List<Comment> findAllChild(Integer pid) {
        return commentMapper.selectAllChild(pid);
    }
}
