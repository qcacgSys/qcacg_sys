package com.qcacg.common.entity;

public class SysAdmin {
    /**
    * 管理员Id
    */
    private Integer adminId;

    /**
    * 管理员帐号名
    */
    private String adminName;

    /**
    * 管理员帐号密码
    */
    private String adminPassword;

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }
}