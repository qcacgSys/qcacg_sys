package com.qcacg.common.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qcacg.common.entity.SysAdmin;
import com.qcacg.common.service.SysAdminService;
import com.qcacg.common.util.CommonUtil;
import com.qcacg.common.util.JedisUtil;
import com.qcacg.common.util.MD5Util;

import redis.clients.jedis.Jedis;

@Controller
public class SysAdminController {
	private final static String key = "7bdecd4da0ea2e82f7c6acdeb43337d2";
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
	public String login(SysAdmin sysAdmin,HttpSession session,HttpServletRequest request){
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
			String ip = CommonUtil.toIpAddr(request);
			if("0:0:0:0:0:0:0:1".equals(ip)){
				ip = "127.0.0.1";
			}
			String value = MD5Util.encrypt32(ip);
			Jedis jedis = null;
			try {
				jedis = JedisUtil.getJedis();
				jedis.setex(key, 86400, value);
			} finally {
				JedisUtil.close(jedis);
			}
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
		session.removeAttribute("sysAdmin");
		session.setAttribute("message","未登录");
		Jedis jedis = null;
		try {
			jedis = JedisUtil.getJedis();
			jedis.del(key);
		} finally {
			jedis.close();
		}
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
