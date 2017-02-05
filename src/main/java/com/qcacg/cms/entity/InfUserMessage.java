package com.qcacg.cms.entity;

import java.util.Date;

public class InfUserMessage {
    /**
    * 个人消息ID
    */
    private Integer messageid;

    /**
    * 用户ID
    */
    private Integer userid;

    private String messagetitle;

    /**
    * 消息发送时间
    */
    private Date messagecreatedate;

    /**
    * 0:作品相关 1:系统公告 2:官方公告
    */
    private String messagetype;

    /**
    * 0:未读  1:已读 
    */
    private String messagestatus;

    private String message;

    public Integer getMessageid() {
        return messageid;
    }

    public void setMessageid(Integer messageid) {
        this.messageid = messageid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getMessagetitle() {
        return messagetitle;
    }

    public void setMessagetitle(String messagetitle) {
        this.messagetitle = messagetitle;
    }

    public Date getMessagecreatedate() {
        return messagecreatedate;
    }

    public void setMessagecreatedate(Date messagecreatedate) {
        this.messagecreatedate = messagecreatedate;
    }

    public String getMessagetype() {
        return messagetype;
    }

    public void setMessagetype(String messagetype) {
        this.messagetype = messagetype;
    }

    public String getMessagestatus() {
        return messagestatus;
    }

    public void setMessagestatus(String messagestatus) {
        this.messagestatus = messagestatus;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}