package online.yangxiao.dao;

import org.apache.ibatis.annotations.*;
import tk.mybatis.mapper.common.Mapper;
import online.yangxiao.entity.User;

import java.util.List;

public interface UserMapper extends Mapper<User>{
	String TABLE_NAME = "user";
	String SELECT_FIELDS = "";

	// 删除
	@Delete({"DELETE FROM",TABLE_NAME, "WHERE id=#{uid}"})
	int deleteUserById(Integer uid);

	@Select({"SELECT * FROM", TABLE_NAME, "ORDER BY id DESC LIMIT #{limit}"})
	List<User> selectByTime(@Param("limit") Integer limit);
}