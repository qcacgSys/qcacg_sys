package com.qcacg.cms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.qcacg.cms.entity.WorBook;
import com.qcacg.cms.service.WorBookService;

@Controller
public class WorBookController {
	@Resource
	private WorBookService worBookServiceImpl;
	/**
	 * 查看所有签约作品
	 * @param worBooks
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/admin/signbooklist")
	public PageInfo<WorBook> findAllSignBook(PageInfo<WorBook> worBooks){
		return worBookServiceImpl.findAllSignBook(worBooks);
	}
	/**
	 * 跳转到小编推荐页面
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin/recommend")
	public String recommendedView(Model model){
		List<WorBook> list = worBookServiceImpl.findAllRecommendBook();
		model.addAttribute("recommendBook", list);
		return "/WEB-INF/view/recommend.jsp";
	}
}
