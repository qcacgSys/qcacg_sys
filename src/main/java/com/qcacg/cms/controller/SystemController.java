package com.qcacg.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.qcacg.cms.dto.BookDTO;



@Controller
@RequestMapping("/admin")
public class SystemController {
	/**
	 * 查看所有签约数据
	 * @return
	 */
	@RequestMapping("/allSign")
	public String allSignView(){
		return "/WEB-INF/view/book_sign.jsp";
	}
	/**
	 * 查看所有审核数据
	 * @return
	 */
	@RequestMapping("/allStatus")
	public String allStatusView(){
		return "/WEB-INF/view/book_review.jsp";
	}
	/**
	 * 查看审核细节
	 * @return
	 */
	@RequestMapping("/statusDetails")
	public String statusDetails(){
		return "/WEB-INF/view/book_review_details.jsp";
	}
	/**
	 * 进入签约界面
	 * @param model
	 * @param bookDTO
	 * @return
	 */
	@RequestMapping("/sign")
	public String signView(Model model,BookDTO bookDTO){
		model.addAttribute("bookDTO", bookDTO);
		return "/WEB-INF/view/sign.jsp";
	}
	/**
	 * 进入审核界面
	 * @param model
	 * @param bookDTO
	 * @return
	 */
	@RequestMapping("/status")
	public String statusView(Model model,BookDTO bookDTO){
		model.addAttribute("bookDTO", bookDTO);
		return "/WEB-INF/view/status.jsp";
	}
	/**
	 * 进入发送公告界面
	 * @return
	 */
	@RequestMapping("/sysInfo")
	public String sysInfoView(){
		return "/WEB-INF/view/sysInfo.jsp";
	}
}
