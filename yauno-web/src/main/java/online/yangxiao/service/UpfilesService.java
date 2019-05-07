package online.yangxiao.service;

import online.yangxiao.common.PageHelper;
import online.yangxiao.entity.Upfiles;

import java.util.List;

public interface UpfilesService {

    int addUpfiles(Upfiles upfiles);

    Upfiles findById(Integer cid);

    List<Upfiles> findAll();

    void updateById(Upfiles upfiles);

    void deleteById(Integer cid);

    PageHelper.Page<Upfiles> findAll(Integer pageNum, Integer pageSize);
}
