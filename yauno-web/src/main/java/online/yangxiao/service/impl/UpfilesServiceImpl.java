package online.yangxiao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import online.yangxiao.common.PageHelper;
import online.yangxiao.common.PageHelper.Page;
import online.yangxiao.dao.UpfilesMapper;
import online.yangxiao.entity.Upfiles;
import online.yangxiao.service.UpfilesService;

import java.util.List;

@Service
public class UpfilesServiceImpl implements UpfilesService{
    @Autowired
    private UpfilesMapper upfilesMapper;


    @Transactional
    public int addUpfiles(Upfiles upfiles) {
        int i = upfilesMapper.insertSelective(upfiles);
        return i;
    }


    public Upfiles findById(Integer fid) {
        Upfiles upfiles = new Upfiles();
        upfiles.setId(fid);
        return upfilesMapper.selectOne(upfiles);
    }


    public List<Upfiles> findAll() {
        return upfilesMapper.select(null);
    }


    public void updateById(Upfiles upfiles) {
        upfilesMapper.updateByPrimaryKeySelective(upfiles);
    }


    public void deleteById(Integer fid) {
        upfilesMapper.selectByPrimaryKey(fid);

    }

    public Page<Upfiles> findAll(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Upfiles> list = upfilesMapper.select(null);
        Page endPage = PageHelper.endPage();

        return endPage;
    }

}
