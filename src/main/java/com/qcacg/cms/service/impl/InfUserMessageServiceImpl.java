package com.qcacg.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qcacg.cms.dao.InfUserMessageMapper;
import com.qcacg.cms.entity.InfUserMessage;
import com.qcacg.cms.service.InfUserMessageService;
@Service
public class InfUserMessageServiceImpl implements InfUserMessageService {

	@Resource
	private InfUserMessageMapper infUserMessageMapper;
	
	@Override
	public int sendSysInfUserMessage(InfUserMessage infUserMessage) {
		return infUserMessageMapper.insert(infUserMessage);
	}

	@Override
	public int sendOffInfUserMessage(InfUserMessage infUserMessage) {
		return infUserMessageMapper.insert(infUserMessage);
	}

	@Transactional
	@Override
	public int sendSysInfUserMessages(InfUserMessage infUserMessage, Integer[] userIds) {
		int i = 0;
		for (Integer userId : userIds) {
			infUserMessage.setMessageid(userId);
			i = i + infUserMessageMapper.insert(infUserMessage);
		}
		return i;
	}

}
