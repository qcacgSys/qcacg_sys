package com.qcacg.common.service;

import com.qcacg.common.entity.SysAdmin;

public interface SysAdminService {
	/**
	 * 验证管理员用户名密码是否正确
	 * @param sysAdmin
	 * @return
	 */
	public SysAdmin checkSysAdmin(SysAdmin sysAdmin);
}
