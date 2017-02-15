package com.qcacg.common.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qcacg.common.entity.SysAdmin;
import com.qcacg.common.service.SysAdminService;
import com.qcacg.common.util.MD5Util;

@Controller
public class SysAdminController {
	@Resource
	private SysAdminService sysAdminServiceImpl;
	/**
	 * 登录页面
	 * @return
	 */
	@RequestMapping("/loginView")
	public String loginView(HttpSession session){
		if(session.getAttribute("sysAdmin")!=null){
			return "redirect:/admin/adminView";
		}
		return "/WEB-INF/view/login.jsp";
	}
	/**
	 * 登录动作
	 * @param sysAdmin
	 * @param session
	 * @return
	 */
	@PostMapping("/login")
	public String login(SysAdmin sysAdmin,HttpSession session){
		if(sysAdmin.getAdminName()==null||"".equals(sysAdmin.getAdminName())){
			session.setAttribute("message", "请填写用户名");
			return "redirect:/loginView";
		}
		if(sysAdmin.getAdminPassword()==null||"".equals(sysAdmin.getAdminPassword())){
			session.setAttribute("message", "请填写密码");
			return "redirect:/loginView";
		}
		sysAdmin.setAdminPassword(MD5Util.encrypt32(sysAdmin.getAdminPassword()));
		SysAdmin checkSysAdmin = sysAdminServiceImpl.checkSysAdmin(sysAdmin);
		if(checkSysAdmin!=null){
			session.setAttribute("message","登录成功");
			session.setAttribute("sysAdmin", sysAdmin);
			return "redirect:/admin/adminView";
		}else {
			session.setAttribute("message", "用户名或者密码错误");
			return "redirect:/loginView";
		}
	}
	/**
	 * 登出操作
	 * @param session
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.removeAttribute("sysUser");
		session.setAttribute("message","未登录");
		return "redirect:/loginView";
	}
	/**
	 * 管理员操作页面
	 * @return
	 */
	@RequestMapping("/admin/adminView")
	public String welcomeView(){
		return "/WEB-INF/view/admin.jsp";
	}
}
