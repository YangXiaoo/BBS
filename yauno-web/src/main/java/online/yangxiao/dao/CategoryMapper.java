package online.yangxiao.dao;

import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;

import online.yangxiao.entity.Category;

public interface CategoryMapper extends Mapper<Category>{
	String TABLE_NAME = "category";

	// 删除
	@Delete({"DELETE FROM",TABLE_NAME, "WHERE id=#{cid}"})
	int deleteCateById(@Param("cid") Integer cid);
}