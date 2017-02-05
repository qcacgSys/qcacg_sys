package com.qcacg.cms.service;

import java.util.List;

import com.qcacg.cms.entity.InfUserMessage;

public interface InfUserMessageService {
	
	/**
	 * 发送全体系统消息
	 * @param infUserMessage
	 * @return
	 */
	public int sendSysInfUserMessage(InfUserMessage infUserMessage);
	/**
	 * 发送官方公告
	 * @param infUserMessage
	 * @return
	 */
	public int sendOffInfUserMessage(InfUserMessage infUserMessage);
	/**
	 * 发送对用户的系统消息
	 * @param infUserMessage
	 * @param userIds
	 * @return
	 */
	public int sendSysInfUserMessages(InfUserMessage infUserMessage,Integer[] userIds);
}
