package com.qcacg.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qcacg.cms.dao.WorBookMapper;
import com.qcacg.cms.entity.WorBook;
import com.qcacg.cms.entity.WorBookExample;
import com.qcacg.cms.service.WorBookService;
@Service
public class WorBookServiceImpl implements WorBookService {

	@Resource
	private WorBookMapper worBookMapper;
	@Override
	public PageInfo<WorBook> findAllSignBook(PageInfo<WorBook> worBooks) {
		WorBookExample example = new WorBookExample();
		example.or().andBookissignEqualTo("1");
		PageHelper.startPage(worBooks.getPageNum(), worBooks.getPageSize());
		List<WorBook> list = worBookMapper.selectByExample(example);
		worBooks.setList(list);
		return worBooks;
	}
	@Override
	public List<WorBook> findAllRecommendBook() {
		WorBookExample example = new WorBookExample();
		example.or().andIsrecommendedEqualTo("1");
		List<WorBook> list = worBookMapper.selectByExample(example);
		return list;
	}

}
