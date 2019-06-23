package online.yangxiao.dao;

import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import online.yangxiao.entity.Category;

import java.util.List;

public interface CategoryMapper extends Mapper<Category>{
	String TABLE_NAME = "category";
	String SELECT_FILES = "id, pid, category_name, description, paper_count, browse, status, sorts";

	// 删除
	@Delete({"DELETE FROM",TABLE_NAME, "WHERE id=#{cid}"})
	int deleteCateById(@Param("cid") Integer cid);

	@Select({"SELECT * FROM", TABLE_NAME, "WHERE status='1' ORDER BY browse DESC"})
	List<Category> selectByBrowse();
}