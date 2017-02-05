package com.qcacg.cms.entity;

import java.util.Date;

public class WorBook {
    /**
    * 小说ID
    */
    private Long bookid;

    /**
    * 用户ID
    */
    private Long userid;

    /**
    * 小说名称
    */
    private String bookname;

    private String sort;

    /**
    * 更新日期
    */
    private Date bookupdate;

    /**
    * 小说创建时间
    */
    private Date bookcreatetime;

    /**
    * 封面图片
    */
    private String bookcoverimage;

    /**
    * 小说字数
    */
    private Long bookwordcount;

    /**
    * 小说审核状态
    */
    private String bookreviewstatus;

    /**
    * 小说状态
    */
    private String bookstatus;

    /**
    * 点击率
    */
    private Long bookhit;

    /**
    * 收藏数
    */
    private Long bookcollect;

    /**
    * 好人币数
    */
    private Long bookcoppercoins;

    /**
    * 白银币数
    */
    private Long booksilvercoins;

    /**
    * 小说字数上周统计
    */
    private Long weekwordcount;

    /**
    * 小说点击上周统计
    */
    private Long weekhit;

    /**
    * 小说上周好人币数统计
    */
    private Long weekcoppercoins;

    /**
    * 小说字数上月统计
    */
    private Long monthwordcount;

    /**
    * 小说点击上月统计
    */
    private Long monthhit;

    /**
    * 小说上月好人币数统计
    */
    private Long monthcoppercoins;

    /**
    * 小说字数每周统计
    */
    private Long everyweekwordcount;

    /**
    * 小说点击每月统计
    */
    private Long everyweekhit;

    /**
    * 小说每周好人币数统计
    */
    private Long everyweekcoppercoins;

    /**
    * 小说字数每月统计
    */
    private Long everymonthwordcount;

    /**
    * 小说点击每月统计
    */
    private Long everymonthhit;

    /**
    * 小说每月好人币数统计
    */
    private Long everymonthcoppercoins;

    /**
    * 是否为签约作品
    */
    private String bookissign;

    /**
    * 是否是被推荐作品
    */
    private String isrecommended;

    /**
    * 在主页显示的小说
    */
    private String bookonindex;

    /**
    * 小说更新周期，null或者0表示未设定，1表示日更，2表示月更
    */
    private Integer updatecycle;

    /**
    * 提交更新周期修改申请的时间，隔月生效
    */
    private Date changeupdatecycletime;

    /**
    * 下月更新周期
    */
    private Integer nextupdatecycle;

    /**
    * 作品简介
    */
    private String bookintroduction;

    public Long getBookid() {
        return bookid;
    }

    public void setBookid(Long bookid) {
        this.bookid = bookid;
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public Date getBookupdate() {
        return bookupdate;
    }

    public void setBookupdate(Date bookupdate) {
        this.bookupdate = bookupdate;
    }

    public Date getBookcreatetime() {
        return bookcreatetime;
    }

    public void setBookcreatetime(Date bookcreatetime) {
        this.bookcreatetime = bookcreatetime;
    }

    public String getBookcoverimage() {
        return bookcoverimage;
    }

    public void setBookcoverimage(String bookcoverimage) {
        this.bookcoverimage = bookcoverimage;
    }

    public Long getBookwordcount() {
        return bookwordcount;
    }

    public void setBookwordcount(Long bookwordcount) {
        this.bookwordcount = bookwordcount;
    }

    public String getBookreviewstatus() {
        return bookreviewstatus;
    }

    public void setBookreviewstatus(String bookreviewstatus) {
        this.bookreviewstatus = bookreviewstatus;
    }

    public String getBookstatus() {
        return bookstatus;
    }

    public void setBookstatus(String bookstatus) {
        this.bookstatus = bookstatus;
    }

    public Long getBookhit() {
        return bookhit;
    }

    public void setBookhit(Long bookhit) {
        this.bookhit = bookhit;
    }

    public Long getBookcollect() {
        return bookcollect;
    }

    public void setBookcollect(Long bookcollect) {
        this.bookcollect = bookcollect;
    }

    public Long getBookcoppercoins() {
        return bookcoppercoins;
    }

    public void setBookcoppercoins(Long bookcoppercoins) {
        this.bookcoppercoins = bookcoppercoins;
    }

    public Long getBooksilvercoins() {
        return booksilvercoins;
    }

    public void setBooksilvercoins(Long booksilvercoins) {
        this.booksilvercoins = booksilvercoins;
    }

    public Long getWeekwordcount() {
        return weekwordcount;
    }

    public void setWeekwordcount(Long weekwordcount) {
        this.weekwordcount = weekwordcount;
    }

    public Long getWeekhit() {
        return weekhit;
    }

    public void setWeekhit(Long weekhit) {
        this.weekhit = weekhit;
    }

    public Long getWeekcoppercoins() {
        return weekcoppercoins;
    }

    public void setWeekcoppercoins(Long weekcoppercoins) {
        this.weekcoppercoins = weekcoppercoins;
    }

    public Long getMonthwordcount() {
        return monthwordcount;
    }

    public void setMonthwordcount(Long monthwordcount) {
        this.monthwordcount = monthwordcount;
    }

    public Long getMonthhit() {
        return monthhit;
    }

    public void setMonthhit(Long monthhit) {
        this.monthhit = monthhit;
    }

    public Long getMonthcoppercoins() {
        return monthcoppercoins;
    }

    public void setMonthcoppercoins(Long monthcoppercoins) {
        this.monthcoppercoins = monthcoppercoins;
    }

    public Long getEveryweekwordcount() {
        return everyweekwordcount;
    }

    public void setEveryweekwordcount(Long everyweekwordcount) {
        this.everyweekwordcount = everyweekwordcount;
    }

    public Long getEveryweekhit() {
        return everyweekhit;
    }

    public void setEveryweekhit(Long everyweekhit) {
        this.everyweekhit = everyweekhit;
    }

    public Long getEveryweekcoppercoins() {
        return everyweekcoppercoins;
    }

    public void setEveryweekcoppercoins(Long everyweekcoppercoins) {
        this.everyweekcoppercoins = everyweekcoppercoins;
    }

    public Long getEverymonthwordcount() {
        return everymonthwordcount;
    }

    public void setEverymonthwordcount(Long everymonthwordcount) {
        this.everymonthwordcount = everymonthwordcount;
    }

    public Long getEverymonthhit() {
        return everymonthhit;
    }

    public void setEverymonthhit(Long everymonthhit) {
        this.everymonthhit = everymonthhit;
    }

    public Long getEverymonthcoppercoins() {
        return everymonthcoppercoins;
    }

    public void setEverymonthcoppercoins(Long everymonthcoppercoins) {
        this.everymonthcoppercoins = everymonthcoppercoins;
    }

    public String getBookissign() {
        return bookissign;
    }

    public void setBookissign(String bookissign) {
        this.bookissign = bookissign;
    }

    public String getIsrecommended() {
        return isrecommended;
    }

    public void setIsrecommended(String isrecommended) {
        this.isrecommended = isrecommended;
    }

    public String getBookonindex() {
        return bookonindex;
    }

    public void setBookonindex(String bookonindex) {
        this.bookonindex = bookonindex;
    }

    public Integer getUpdatecycle() {
        return updatecycle;
    }

    public void setUpdatecycle(Integer updatecycle) {
        this.updatecycle = updatecycle;
    }

    public Date getChangeupdatecycletime() {
        return changeupdatecycletime;
    }

    public void setChangeupdatecycletime(Date changeupdatecycletime) {
        this.changeupdatecycletime = changeupdatecycletime;
    }

    public Integer getNextupdatecycle() {
        return nextupdatecycle;
    }

    public void setNextupdatecycle(Integer nextupdatecycle) {
        this.nextupdatecycle = nextupdatecycle;
    }

    public String getBookintroduction() {
        return bookintroduction;
    }

    public void setBookintroduction(String bookintroduction) {
        this.bookintroduction = bookintroduction;
    }
}