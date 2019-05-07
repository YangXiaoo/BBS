package online.yangxiao.dao;

import online.yangxiao.entity.Guestbook;

public interface GuestbookMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Guestbook record);

    int insertSelective(Guestbook record);

    Guestbook selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Guestbook record);

    int updateByPrimaryKeyWithBLOBs(Guestbook record);

    int updateByPrimaryKey(Guestbook record);
}