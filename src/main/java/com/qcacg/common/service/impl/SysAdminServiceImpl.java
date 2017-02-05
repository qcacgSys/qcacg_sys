package com.qcacg.common.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qcacg.common.dao.SysAdminMapper;
import com.qcacg.common.entity.SysAdmin;
import com.qcacg.common.entity.SysAdminExample;
import com.qcacg.common.service.SysAdminService;
@Service
public class SysAdminServiceImpl implements SysAdminService {
	@Resource
	private SysAdminMapper sysAdminMapper;
	@Override
	public SysAdmin checkSysAdmin(SysAdmin sysAdmin) {
		SysAdmin result = null ;
		SysAdminExample example = new SysAdminExample();
		example.or().andAdminNameEqualTo(sysAdmin.getAdminName()).andAdminPasswordEqualTo(sysAdmin.getAdminPassword());
		List<SysAdmin> list = sysAdminMapper.selectByExample(example);
		if(list!=null&&list.size()>0){
			result = list.get(0);			
		}
		return result;
	}

}
