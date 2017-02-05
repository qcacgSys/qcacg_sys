package com.qcacg.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.qcacg.common.entity.SysAdmin;
/**
 * 对管理员操作的url请求进行拦截，若是非管理员登录状态，重定向到登录页面
 * @author AB
 *
 */
public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		SysAdmin sysAdmin = (SysAdmin) session.getAttribute("sysAdmin");
		if(sysAdmin==null){
			session.setAttribute("message", "非管理员登录状态无法操作，请登录");
			response.sendRedirect("/qcacg_sys/loginView");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
