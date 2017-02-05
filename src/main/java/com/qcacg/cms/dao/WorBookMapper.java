package com.qcacg.cms.dao;

import com.qcacg.cms.entity.WorBook;
import com.qcacg.cms.entity.WorBookExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WorBookMapper {
    int countByExample(WorBookExample example);

    int deleteByExample(WorBookExample example);

    int deleteByPrimaryKey(Long bookid);

    int insert(WorBook record);

    int insertSelective(WorBook record);

    List<WorBook> selectByExampleWithBLOBs(WorBookExample example);

    List<WorBook> selectByExample(WorBookExample example);

    WorBook selectByPrimaryKey(Long bookid);

    int updateByExampleSelective(@Param("record") WorBook record, @Param("example") WorBookExample example);

    int updateByExampleWithBLOBs(@Param("record") WorBook record, @Param("example") WorBookExample example);

    int updateByExample(@Param("record") WorBook record, @Param("example") WorBookExample example);

    int updateByPrimaryKeySelective(WorBook record);

    int updateByPrimaryKeyWithBLOBs(WorBook record);

    int updateByPrimaryKey(WorBook record);
}