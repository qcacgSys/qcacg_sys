package com.qcacg.cms.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.qcacg.cms.entity.WorBook;

public interface WorBookService {
	/**
	 * 根据分页查看所有签约作品
	 * @param worBooks
	 * @return
	 */
	public PageInfo<WorBook> findAllSignBook(PageInfo<WorBook> worBooks);
	/**
	 * 找到所有首页推荐的作品
	 * @return
	 */
	public List<WorBook> findAllRecommendBook();
}
