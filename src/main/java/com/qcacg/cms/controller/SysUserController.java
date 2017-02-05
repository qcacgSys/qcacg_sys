package com.qcacg.cms.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.qcacg.cms.entity.SysUser;
import com.qcacg.cms.service.SysUserService;
import com.qcacg.cms.service.WorBookService;

@Controller
public class SysUserController {
	@Resource
	private WorBookService worBookServiceImpl;
	@Resource
	private SysUserService sysUserServiceImpl;
	/**
	 * 查看所有sysUser
	 * @param sysUsers
	 * @return
	 */
	@RequestMapping("/admin/userlist")
	@ResponseBody
	public PageInfo<SysUser> findAllUsers(PageInfo<SysUser> sysUsers){
		return sysUserServiceImpl.findAllSysUser(sysUsers);
	}
}
