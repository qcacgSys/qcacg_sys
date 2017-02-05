package com.qcacg.cms.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.qcacg.cms.entity.SysUser;

public interface SysUserService {

	/**
	 * 验证用户手机号和密码
	 * @param sysUser
	 * @return
	 */
	public SysUser checkSysUser(SysUser sysUser);
	/**
	 * 查找所有的SysUser
	 * @param sysUsers
	 * @return
	 */
	public PageInfo<SysUser> findAllSysUser(PageInfo<SysUser> sysUsers);
}
