package com.qcacg.cms.dao;

import com.qcacg.cms.entity.InfUserMessage;
import com.qcacg.cms.entity.InfUserMessageExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface InfUserMessageMapper {
    int countByExample(InfUserMessageExample example);

    int deleteByExample(InfUserMessageExample example);

    int deleteByPrimaryKey(Integer messageid);

    int insert(InfUserMessage record);

    int insertSelective(InfUserMessage record);

    List<InfUserMessage> selectByExampleWithBLOBs(InfUserMessageExample example);

    List<InfUserMessage> selectByExample(InfUserMessageExample example);

    InfUserMessage selectByPrimaryKey(Integer messageid);

    int updateByExampleSelective(@Param("record") InfUserMessage record, @Param("example") InfUserMessageExample example);

    int updateByExampleWithBLOBs(@Param("record") InfUserMessage record, @Param("example") InfUserMessageExample example);

    int updateByExample(@Param("record") InfUserMessage record, @Param("example") InfUserMessageExample example);

    int updateByPrimaryKeySelective(InfUserMessage record);

    int updateByPrimaryKeyWithBLOBs(InfUserMessage record);

    int updateByPrimaryKey(InfUserMessage record);
}