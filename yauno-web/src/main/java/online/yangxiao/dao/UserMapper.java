package online.yangxiao.dao;

import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;
import online.yangxiao.entity.User;

public interface UserMapper extends Mapper<User>{
	String TABLE_NAME = "user";

	// 删除
	@Delete({"DELETE FROM",TABLE_NAME, "WHERE id=#{uid}"})
	int deleteUserById(Integer uid);
}