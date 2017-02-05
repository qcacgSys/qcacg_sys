package com.qcacg.cms.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qcacg.cms.entity.InfUserMessage;
import com.qcacg.cms.service.InfUserMessageService;

@Controller
@RequestMapping("/InfUserMessage")
public class InfUserMessageController {
	
	@Resource
	private InfUserMessageService infUserMessageServiceImpl;
	/**
	 * 进入系统消息和官方公告的编辑页面
	 * @return
	 */
	@RequestMapping("/eidtView")
	public String editInfUserMessage(){
		return "/WEB-INF/view/editInfUserMessage.jsp";
	}
	/**
	 * 发送系统消息
	 * @param infUserMessage
	 * @return
	 */
	@PostMapping("/system")
	public String sendSysInfUserMessage(InfUserMessage infUserMessage,HttpSession session,Integer[] userIds){
		if(infUserMessage.getMessage()==null||"".equals(infUserMessage.getMessage().trim())){
			session.setAttribute("message", "请输入内容");
		}else if(infUserMessage.getMessagetitle()==null||"".equals(infUserMessage.getMessagetitle().trim())){
			session.setAttribute("message", "请输入标题");		
		}else {
			infUserMessage.setMessagetype("1");
			infUserMessage.setMessagestatus("0");
			infUserMessage.setMessagecreatedate(new Date());
			int i = 0;
			if(userIds!=null&&userIds.length>0){
				i = infUserMessageServiceImpl.sendSysInfUserMessages(infUserMessage, userIds);
			}else{
				i = infUserMessageServiceImpl.sendSysInfUserMessage(infUserMessage);
			}
			if(i>0){
				session.setAttribute("message", "发送成功");
			}else{
				session.setAttribute("message", "发送失败");
			}
		}
		return "redirect:/adminView";
	}
	/**
	 * 发送官方公告
	 * @param infUserMessage
	 * @param session
	 * @return
	 */
	@PostMapping("/official")
	public String sendOffInfUserMessage(InfUserMessage infUserMessage,HttpSession session){
		if(infUserMessage.getMessage()==null||"".equals(infUserMessage.getMessage().trim())){
			session.setAttribute("message", "请输入内容");
		}else if(infUserMessage.getMessagetitle()==null||"".equals(infUserMessage.getMessagetitle().trim())){
			session.setAttribute("message", "请输入标题");		
		}else {
			infUserMessage.setMessagetype("2");
			infUserMessage.setMessagestatus("0");
			infUserMessage.setMessagecreatedate(new Date());
			int i = infUserMessageServiceImpl.sendOffInfUserMessage(infUserMessage);
			if(i>0){
				session.setAttribute("message", "发送成功");
			}else{
				session.setAttribute("message", "发送失败");
			}
		}
		return "redirect:/adminView";
	}
}
