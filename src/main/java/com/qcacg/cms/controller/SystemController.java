package com.qcacg.cms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qcacg.cms.dto.BookDTO;



@Controller
@RequestMapping("/admin")
public class SystemController {
	
	/**
	 * 用户管理
	 * @return
	 */
	@RequestMapping("/allUser")
	public String allUser(){
		return "/WEB-INF/view/users.jsp";
	}
	
	/**
	 * 作品管理
	 * @return
	 */
	@RequestMapping("/allBookCore")
	public String allBookCore(){
		return "/WEB-INF/view/book_core.jsp";
	}
	
	/**
	 * 推荐管理
	 * @return
	 */
	@RequestMapping("/allRecom")
	public String allRecom(){
		return "/WEB-INF/view/book_recom.jsp";
	}
	
	/**
	 * 管理员日更统计
	 * @return
	 */
	@RequestMapping("/daysUpdateAccounts")
	public String daysUpdateAccounts(){
		return "/WEB-INF/view/days_update_accounts.jsp";
	}
	
	/**
	 * 管理员月更统计
	 * @return
	 */
	@RequestMapping("/mouthUpdateAccounts")
	public String mouthUpdateAccounts(){
		return "/WEB-INF/view/mouth_update_accounts.jsp";
	}
	
	/**
	 * 查看当月签约等级核算
	 * @return
	 */
	@RequestMapping("/mouthLevelAccounts")
	public String mouthLevelAccounts(){
		return "/WEB-INF/view/book_accounts.jsp";
	}
	
	/**
	 * 查看历史签约等级核算
	 * @return
	 */
	@RequestMapping("/allLevelAccounts")
	public String allLevelAccounts(){
		return "/WEB-INF/view/all_book_accounts.jsp";
	}
	
	/**
	 * 查看所有举报数据
	 */
	@RequestMapping("/allReport")
	public String allReport(){
		return "/WEB-INF/view/report.jsp";
	}
	
	/**
	 * 查看所有签约等级数据
	 * @return
	 */
	@RequestMapping("/allSignLevel")
	public String allSignLevelView(){
		return "/WEB-INF/view/book_sign_level.jsp";
	}
	
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
	/**
	 * 查看所有日志
	 * @return
	 */
	@RequestMapping("/allLog")
	public String logView(){
		return "/WEB-INF/view/log.jsp";
	}
	/**
	 * 查看所有提现
	 * @return
	 */
	@RequestMapping("/allWithdrawals")
	public String withdrawalsView(){
		return "/WEB-INF/view/withdrawals.jsp";
	}
}
