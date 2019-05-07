package online.yangxiao.dao;

import online.yangxiao.entity.OpenUser;

public interface OpenUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OpenUser record);

    int insertSelective(OpenUser record);

    OpenUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OpenUser record);

    int updateByPrimaryKey(OpenUser record);
}