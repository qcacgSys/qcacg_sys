package com.qcacg.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qcacg.cms.dao.SysUserMapper;
import com.qcacg.cms.entity.SysUser;
import com.qcacg.cms.entity.SysUserExample;
import com.qcacg.cms.service.SysUserService;
@Service
public class SysUserServiceImpl implements SysUserService {

	@Resource
	private SysUserMapper sysUserMapper;
	
	@Override
	public SysUser checkSysUser(SysUser sysUser) {
		SysUserExample sysUserExample = new SysUserExample();
		sysUserExample.or().andTelephoneEqualTo(sysUser.getTelephone()).andPasswordEqualTo(sysUser.getPassword());
		return sysUserMapper.selectByExample(sysUserExample).get(0);
	}

	@Override
	public PageInfo<SysUser> findAllSysUser(PageInfo<SysUser> sysUsers) {
		SysUserExample sysUserExample = new SysUserExample();
		PageHelper.startPage(sysUsers.getPageNum(), sysUsers.getPageSize());
		List<SysUser> sysUserList = sysUserMapper.selectByExample(sysUserExample);
		sysUsers.setList(sysUserList);
		return sysUsers;
	}
}
