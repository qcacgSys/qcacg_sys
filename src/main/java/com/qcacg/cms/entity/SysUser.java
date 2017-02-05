package com.qcacg.cms.entity;

import java.util.Date;

public class SysUser {
    /**
    * 用户ID
    */
    private Long userid;

    /**
    * 用户名
    */
    private String username;

    /**
    * 手机号
    */
    private String telephone;

    /**
    * 邮箱
    */
    private String email;

    /**
    * 密码
    */
    private String password;

    /**
    * 注册时间
    */
    private Date createdate;

    /**
    * 最后一次登录时间
    */
    private Date lastlogindate;

    /**
    * 用户状态
    */
    private String userstatus;

    /**
    * 头像
    */
    private String userhead;

    /**
    * 性别
    */
    private String sex;

    /**
    * 邀请人
    */
    private String invitepeople;

    /**
    * IP地址
    */
    private String ip;

    /**
    * 备注信息
    */
    private String information;

    /**
    * 验证凭证
    */
    private String credentialssalt;

    /**
    * 生日
    */
    private Date birthday;

    /**
    * 用户关注数量
    */
    private Long userattention;

    /**
    * 签到状态 ‘0’未签到
    */
    private String signstatus;

    /**
    * 签到时间
    */
    private Date signdate;

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getLastlogindate() {
        return lastlogindate;
    }

    public void setLastlogindate(Date lastlogindate) {
        this.lastlogindate = lastlogindate;
    }

    public String getUserstatus() {
        return userstatus;
    }

    public void setUserstatus(String userstatus) {
        this.userstatus = userstatus;
    }

    public String getUserhead() {
        return userhead;
    }

    public void setUserhead(String userhead) {
        this.userhead = userhead;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getInvitepeople() {
        return invitepeople;
    }

    public void setInvitepeople(String invitepeople) {
        this.invitepeople = invitepeople;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public String getCredentialssalt() {
        return credentialssalt;
    }

    public void setCredentialssalt(String credentialssalt) {
        this.credentialssalt = credentialssalt;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Long getUserattention() {
        return userattention;
    }

    public void setUserattention(Long userattention) {
        this.userattention = userattention;
    }

    public String getSignstatus() {
        return signstatus;
    }

    public void setSignstatus(String signstatus) {
        this.signstatus = signstatus;
    }

    public Date getSigndate() {
        return signdate;
    }

    public void setSigndate(Date signdate) {
        this.signdate = signdate;
    }
}