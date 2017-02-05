package com.qcacg.cms.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WorBookExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public WorBookExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getOffset() {
        return offset;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andBookidIsNull() {
            addCriterion("BookId is null");
            return (Criteria) this;
        }

        public Criteria andBookidIsNotNull() {
            addCriterion("BookId is not null");
            return (Criteria) this;
        }

        public Criteria andBookidEqualTo(Long value) {
            addCriterion("BookId =", value, "bookid");
            return (Criteria) this;
        }

        public Criteria andBookidNotEqualTo(Long value) {
            addCriterion("BookId <>", value, "bookid");
            return (Criteria) this;
        }

        public Criteria andBookidGreaterThan(Long value) {
            addCriterion("BookId >", value, "bookid");
            return (Criteria) this;
        }

        public Criteria andBookidGreaterThanOrEqualTo(Long value) {
            addCriterion("BookId >=", value, "bookid");
            return (Criteria) this;
        }

        public Criteria andBookidLessThan(Long value) {
            addCriterion("BookId <", value, "bookid");
            return (Criteria) this;
        }

        public Criteria andBookidLessThanOrEqualTo(Long value) {
            addCriterion("BookId <=", value, "bookid");
            return (Criteria) this;
        }

        public Criteria andBookidIn(List<Long> values) {
            addCriterion("BookId in", values, "bookid");
            return (Criteria) this;
        }

        public Criteria andBookidNotIn(List<Long> values) {
            addCriterion("BookId not in", values, "bookid");
            return (Criteria) this;
        }

        public Criteria andBookidBetween(Long value1, Long value2) {
            addCriterion("BookId between", value1, value2, "bookid");
            return (Criteria) this;
        }

        public Criteria andBookidNotBetween(Long value1, Long value2) {
            addCriterion("BookId not between", value1, value2, "bookid");
            return (Criteria) this;
        }

        public Criteria andUseridIsNull() {
            addCriterion("UserId is null");
            return (Criteria) this;
        }

        public Criteria andUseridIsNotNull() {
            addCriterion("UserId is not null");
            return (Criteria) this;
        }

        public Criteria andUseridEqualTo(Long value) {
            addCriterion("UserId =", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotEqualTo(Long value) {
            addCriterion("UserId <>", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThan(Long value) {
            addCriterion("UserId >", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThanOrEqualTo(Long value) {
            addCriterion("UserId >=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThan(Long value) {
            addCriterion("UserId <", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThanOrEqualTo(Long value) {
            addCriterion("UserId <=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridIn(List<Long> values) {
            addCriterion("UserId in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotIn(List<Long> values) {
            addCriterion("UserId not in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridBetween(Long value1, Long value2) {
            addCriterion("UserId between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotBetween(Long value1, Long value2) {
            addCriterion("UserId not between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andBooknameIsNull() {
            addCriterion("BookName is null");
            return (Criteria) this;
        }

        public Criteria andBooknameIsNotNull() {
            addCriterion("BookName is not null");
            return (Criteria) this;
        }

        public Criteria andBooknameEqualTo(String value) {
            addCriterion("BookName =", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameNotEqualTo(String value) {
            addCriterion("BookName <>", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameGreaterThan(String value) {
            addCriterion("BookName >", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameGreaterThanOrEqualTo(String value) {
            addCriterion("BookName >=", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameLessThan(String value) {
            addCriterion("BookName <", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameLessThanOrEqualTo(String value) {
            addCriterion("BookName <=", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameLike(String value) {
            addCriterion("BookName like", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameNotLike(String value) {
            addCriterion("BookName not like", value, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameIn(List<String> values) {
            addCriterion("BookName in", values, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameNotIn(List<String> values) {
            addCriterion("BookName not in", values, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameBetween(String value1, String value2) {
            addCriterion("BookName between", value1, value2, "bookname");
            return (Criteria) this;
        }

        public Criteria andBooknameNotBetween(String value1, String value2) {
            addCriterion("BookName not between", value1, value2, "bookname");
            return (Criteria) this;
        }

        public Criteria andSortIsNull() {
            addCriterion("Sort is null");
            return (Criteria) this;
        }

        public Criteria andSortIsNotNull() {
            addCriterion("Sort is not null");
            return (Criteria) this;
        }

        public Criteria andSortEqualTo(String value) {
            addCriterion("Sort =", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortNotEqualTo(String value) {
            addCriterion("Sort <>", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortGreaterThan(String value) {
            addCriterion("Sort >", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortGreaterThanOrEqualTo(String value) {
            addCriterion("Sort >=", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortLessThan(String value) {
            addCriterion("Sort <", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortLessThanOrEqualTo(String value) {
            addCriterion("Sort <=", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortLike(String value) {
            addCriterion("Sort like", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortNotLike(String value) {
            addCriterion("Sort not like", value, "sort");
            return (Criteria) this;
        }

        public Criteria andSortIn(List<String> values) {
            addCriterion("Sort in", values, "sort");
            return (Criteria) this;
        }

        public Criteria andSortNotIn(List<String> values) {
            addCriterion("Sort not in", values, "sort");
            return (Criteria) this;
        }

        public Criteria andSortBetween(String value1, String value2) {
            addCriterion("Sort between", value1, value2, "sort");
            return (Criteria) this;
        }

        public Criteria andSortNotBetween(String value1, String value2) {
            addCriterion("Sort not between", value1, value2, "sort");
            return (Criteria) this;
        }

        public Criteria andBookupdateIsNull() {
            addCriterion("BookUpdate is null");
            return (Criteria) this;
        }

        public Criteria andBookupdateIsNotNull() {
            addCriterion("BookUpdate is not null");
            return (Criteria) this;
        }

        public Criteria andBookupdateEqualTo(Date value) {
            addCriterion("BookUpdate =", value, "bookupdate");
            return (Criteria) this;
        }

        public Criteria andBookupdateNotEqualTo(Date value) {
            addCriterion("BookUpdate <>", value, "bookupdate");
            return (Criteria) this;
        }

        public Criteria andBookupdateGreaterThan(Date value) {
            addCriterion("BookUpdate >", value, "bookupdate");
            return (Criteria) this;
        }

        public Criteria andBookupdateGreaterThanOrEqualTo(Date value) {
            addCriterion("BookUpdate >=", value, "bookupdate");
            return (Criteria) this;
        }

        public Criteria andBookupdateLessThan(Date value) {
            addCriterion("BookUpdate <", value, "bookupdate");
            return (Criteria) this;
        }

        public Criteria andBookupdateLessThanOrEqualTo(Date value) {
            addCriterion("BookUpdate <=", value, "bookupdate");
            return (Criteria) this;
        }

        public Criteria andBookupdateIn(List<Date> values) {
            addCriterion("BookUpdate in", values, "bookupdate");
            return (Criteria) this;
        }

        public Criteria andBookupdateNotIn(List<Date> values) {
            addCriterion("BookUpdate not in", values, "bookupdate");
            return (Criteria) this;
        }

        public Criteria andBookupdateBetween(Date value1, Date value2) {
            addCriterion("BookUpdate between", value1, value2, "bookupdate");
            return (Criteria) this;
        }

        public Criteria andBookupdateNotBetween(Date value1, Date value2) {
            addCriterion("BookUpdate not between", value1, value2, "bookupdate");
            return (Criteria) this;
        }

        public Criteria andBookcreatetimeIsNull() {
            addCriterion("BookCreateTime is null");
            return (Criteria) this;
        }

        public Criteria andBookcreatetimeIsNotNull() {
            addCriterion("BookCreateTime is not null");
            return (Criteria) this;
        }

        public Criteria andBookcreatetimeEqualTo(Date value) {
            addCriterion("BookCreateTime =", value, "bookcreatetime");
            return (Criteria) this;
        }

        public Criteria andBookcreatetimeNotEqualTo(Date value) {
            addCriterion("BookCreateTime <>", value, "bookcreatetime");
            return (Criteria) this;
        }

        public Criteria andBookcreatetimeGreaterThan(Date value) {
            addCriterion("BookCreateTime >", value, "bookcreatetime");
            return (Criteria) this;
        }

        public Criteria andBookcreatetimeGreaterThanOrEqualTo(Date value) {
            addCriterion("BookCreateTime >=", value, "bookcreatetime");
            return (Criteria) this;
        }

        public Criteria andBookcreatetimeLessThan(Date value) {
            addCriterion("BookCreateTime <", value, "bookcreatetime");
            return (Criteria) this;
        }

        public Criteria andBookcreatetimeLessThanOrEqualTo(Date value) {
            addCriterion("BookCreateTime <=", value, "bookcreatetime");
            return (Criteria) this;
        }

        public Criteria andBookcreatetimeIn(List<Date> values) {
            addCriterion("BookCreateTime in", values, "bookcreatetime");
            return (Criteria) this;
        }

        public Criteria andBookcreatetimeNotIn(List<Date> values) {
            addCriterion("BookCreateTime not in", values, "bookcreatetime");
            return (Criteria) this;
        }

        public Criteria andBookcreatetimeBetween(Date value1, Date value2) {
            addCriterion("BookCreateTime between", value1, value2, "bookcreatetime");
            return (Criteria) this;
        }

        public Criteria andBookcreatetimeNotBetween(Date value1, Date value2) {
            addCriterion("BookCreateTime not between", value1, value2, "bookcreatetime");
            return (Criteria) this;
        }

        public Criteria andBookcoverimageIsNull() {
            addCriterion("BookCoverImage is null");
            return (Criteria) this;
        }

        public Criteria andBookcoverimageIsNotNull() {
            addCriterion("BookCoverImage is not null");
            return (Criteria) this;
        }

        public Criteria andBookcoverimageEqualTo(String value) {
            addCriterion("BookCoverImage =", value, "bookcoverimage");
            return (Criteria) this;
        }

        public Criteria andBookcoverimageNotEqualTo(String value) {
            addCriterion("BookCoverImage <>", value, "bookcoverimage");
            return (Criteria) this;
        }

        public Criteria andBookcoverimageGreaterThan(String value) {
            addCriterion("BookCoverImage >", value, "bookcoverimage");
            return (Criteria) this;
        }

        public Criteria andBookcoverimageGreaterThanOrEqualTo(String value) {
            addCriterion("BookCoverImage >=", value, "bookcoverimage");
            return (Criteria) this;
        }

        public Criteria andBookcoverimageLessThan(String value) {
            addCriterion("BookCoverImage <", value, "bookcoverimage");
            return (Criteria) this;
        }

        public Criteria andBookcoverimageLessThanOrEqualTo(String value) {
            addCriterion("BookCoverImage <=", value, "bookcoverimage");
            return (Criteria) this;
        }

        public Criteria andBookcoverimageLike(String value) {
            addCriterion("BookCoverImage like", value, "bookcoverimage");
            return (Criteria) this;
        }

        public Criteria andBookcoverimageNotLike(String value) {
            addCriterion("BookCoverImage not like", value, "bookcoverimage");
            return (Criteria) this;
        }

        public Criteria andBookcoverimageIn(List<String> values) {
            addCriterion("BookCoverImage in", values, "bookcoverimage");
            return (Criteria) this;
        }

        public Criteria andBookcoverimageNotIn(List<String> values) {
            addCriterion("BookCoverImage not in", values, "bookcoverimage");
            return (Criteria) this;
        }

        public Criteria andBookcoverimageBetween(String value1, String value2) {
            addCriterion("BookCoverImage between", value1, value2, "bookcoverimage");
            return (Criteria) this;
        }

        public Criteria andBookcoverimageNotBetween(String value1, String value2) {
            addCriterion("BookCoverImage not between", value1, value2, "bookcoverimage");
            return (Criteria) this;
        }

        public Criteria andBookwordcountIsNull() {
            addCriterion("BookWordCount is null");
            return (Criteria) this;
        }

        public Criteria andBookwordcountIsNotNull() {
            addCriterion("BookWordCount is not null");
            return (Criteria) this;
        }

        public Criteria andBookwordcountEqualTo(Long value) {
            addCriterion("BookWordCount =", value, "bookwordcount");
            return (Criteria) this;
        }

        public Criteria andBookwordcountNotEqualTo(Long value) {
            addCriterion("BookWordCount <>", value, "bookwordcount");
            return (Criteria) this;
        }

        public Criteria andBookwordcountGreaterThan(Long value) {
            addCriterion("BookWordCount >", value, "bookwordcount");
            return (Criteria) this;
        }

        public Criteria andBookwordcountGreaterThanOrEqualTo(Long value) {
            addCriterion("BookWordCount >=", value, "bookwordcount");
            return (Criteria) this;
        }

        public Criteria andBookwordcountLessThan(Long value) {
            addCriterion("BookWordCount <", value, "bookwordcount");
            return (Criteria) this;
        }

        public Criteria andBookwordcountLessThanOrEqualTo(Long value) {
            addCriterion("BookWordCount <=", value, "bookwordcount");
            return (Criteria) this;
        }

        public Criteria andBookwordcountIn(List<Long> values) {
            addCriterion("BookWordCount in", values, "bookwordcount");
            return (Criteria) this;
        }

        public Criteria andBookwordcountNotIn(List<Long> values) {
            addCriterion("BookWordCount not in", values, "bookwordcount");
            return (Criteria) this;
        }

        public Criteria andBookwordcountBetween(Long value1, Long value2) {
            addCriterion("BookWordCount between", value1, value2, "bookwordcount");
            return (Criteria) this;
        }

        public Criteria andBookwordcountNotBetween(Long value1, Long value2) {
            addCriterion("BookWordCount not between", value1, value2, "bookwordcount");
            return (Criteria) this;
        }

        public Criteria andBookreviewstatusIsNull() {
            addCriterion("BookReviewStatus is null");
            return (Criteria) this;
        }

        public Criteria andBookreviewstatusIsNotNull() {
            addCriterion("BookReviewStatus is not null");
            return (Criteria) this;
        }

        public Criteria andBookreviewstatusEqualTo(String value) {
            addCriterion("BookReviewStatus =", value, "bookreviewstatus");
            return (Criteria) this;
        }

        public Criteria andBookreviewstatusNotEqualTo(String value) {
            addCriterion("BookReviewStatus <>", value, "bookreviewstatus");
            return (Criteria) this;
        }

        public Criteria andBookreviewstatusGreaterThan(String value) {
            addCriterion("BookReviewStatus >", value, "bookreviewstatus");
            return (Criteria) this;
        }

        public Criteria andBookreviewstatusGreaterThanOrEqualTo(String value) {
            addCriterion("BookReviewStatus >=", value, "bookreviewstatus");
            return (Criteria) this;
        }

        public Criteria andBookreviewstatusLessThan(String value) {
            addCriterion("BookReviewStatus <", value, "bookreviewstatus");
            return (Criteria) this;
        }

        public Criteria andBookreviewstatusLessThanOrEqualTo(String value) {
            addCriterion("BookReviewStatus <=", value, "bookreviewstatus");
            return (Criteria) this;
        }

        public Criteria andBookreviewstatusLike(String value) {
            addCriterion("BookReviewStatus like", value, "bookreviewstatus");
            return (Criteria) this;
        }

        public Criteria andBookreviewstatusNotLike(String value) {
            addCriterion("BookReviewStatus not like", value, "bookreviewstatus");
            return (Criteria) this;
        }

        public Criteria andBookreviewstatusIn(List<String> values) {
            addCriterion("BookReviewStatus in", values, "bookreviewstatus");
            return (Criteria) this;
        }

        public Criteria andBookreviewstatusNotIn(List<String> values) {
            addCriterion("BookReviewStatus not in", values, "bookreviewstatus");
            return (Criteria) this;
        }

        public Criteria andBookreviewstatusBetween(String value1, String value2) {
            addCriterion("BookReviewStatus between", value1, value2, "bookreviewstatus");
            return (Criteria) this;
        }

        public Criteria andBookreviewstatusNotBetween(String value1, String value2) {
            addCriterion("BookReviewStatus not between", value1, value2, "bookreviewstatus");
            return (Criteria) this;
        }

        public Criteria andBookstatusIsNull() {
            addCriterion("BookStatus is null");
            return (Criteria) this;
        }

        public Criteria andBookstatusIsNotNull() {
            addCriterion("BookStatus is not null");
            return (Criteria) this;
        }

        public Criteria andBookstatusEqualTo(String value) {
            addCriterion("BookStatus =", value, "bookstatus");
            return (Criteria) this;
        }

        public Criteria andBookstatusNotEqualTo(String value) {
            addCriterion("BookStatus <>", value, "bookstatus");
            return (Criteria) this;
        }

        public Criteria andBookstatusGreaterThan(String value) {
            addCriterion("BookStatus >", value, "bookstatus");
            return (Criteria) this;
        }

        public Criteria andBookstatusGreaterThanOrEqualTo(String value) {
            addCriterion("BookStatus >=", value, "bookstatus");
            return (Criteria) this;
        }

        public Criteria andBookstatusLessThan(String value) {
            addCriterion("BookStatus <", value, "bookstatus");
            return (Criteria) this;
        }

        public Criteria andBookstatusLessThanOrEqualTo(String value) {
            addCriterion("BookStatus <=", value, "bookstatus");
            return (Criteria) this;
        }

        public Criteria andBookstatusLike(String value) {
            addCriterion("BookStatus like", value, "bookstatus");
            return (Criteria) this;
        }

        public Criteria andBookstatusNotLike(String value) {
            addCriterion("BookStatus not like", value, "bookstatus");
            return (Criteria) this;
        }

        public Criteria andBookstatusIn(List<String> values) {
            addCriterion("BookStatus in", values, "bookstatus");
            return (Criteria) this;
        }

        public Criteria andBookstatusNotIn(List<String> values) {
            addCriterion("BookStatus not in", values, "bookstatus");
            return (Criteria) this;
        }

        public Criteria andBookstatusBetween(String value1, String value2) {
            addCriterion("BookStatus between", value1, value2, "bookstatus");
            return (Criteria) this;
        }

        public Criteria andBookstatusNotBetween(String value1, String value2) {
            addCriterion("BookStatus not between", value1, value2, "bookstatus");
            return (Criteria) this;
        }

        public Criteria andBookhitIsNull() {
            addCriterion("BookHit is null");
            return (Criteria) this;
        }

        public Criteria andBookhitIsNotNull() {
            addCriterion("BookHit is not null");
            return (Criteria) this;
        }

        public Criteria andBookhitEqualTo(Long value) {
            addCriterion("BookHit =", value, "bookhit");
            return (Criteria) this;
        }

        public Criteria andBookhitNotEqualTo(Long value) {
            addCriterion("BookHit <>", value, "bookhit");
            return (Criteria) this;
        }

        public Criteria andBookhitGreaterThan(Long value) {
            addCriterion("BookHit >", value, "bookhit");
            return (Criteria) this;
        }

        public Criteria andBookhitGreaterThanOrEqualTo(Long value) {
            addCriterion("BookHit >=", value, "bookhit");
            return (Criteria) this;
        }

        public Criteria andBookhitLessThan(Long value) {
            addCriterion("BookHit <", value, "bookhit");
            return (Criteria) this;
        }

        public Criteria andBookhitLessThanOrEqualTo(Long value) {
            addCriterion("BookHit <=", value, "bookhit");
            return (Criteria) this;
        }

        public Criteria andBookhitIn(List<Long> values) {
            addCriterion("BookHit in", values, "bookhit");
            return (Criteria) this;
        }

        public Criteria andBookhitNotIn(List<Long> values) {
            addCriterion("BookHit not in", values, "bookhit");
            return (Criteria) this;
        }

        public Criteria andBookhitBetween(Long value1, Long value2) {
            addCriterion("BookHit between", value1, value2, "bookhit");
            return (Criteria) this;
        }

        public Criteria andBookhitNotBetween(Long value1, Long value2) {
            addCriterion("BookHit not between", value1, value2, "bookhit");
            return (Criteria) this;
        }

        public Criteria andBookcollectIsNull() {
            addCriterion("BookCollect is null");
            return (Criteria) this;
        }

        public Criteria andBookcollectIsNotNull() {
            addCriterion("BookCollect is not null");
            return (Criteria) this;
        }

        public Criteria andBookcollectEqualTo(Long value) {
            addCriterion("BookCollect =", value, "bookcollect");
            return (Criteria) this;
        }

        public Criteria andBookcollectNotEqualTo(Long value) {
            addCriterion("BookCollect <>", value, "bookcollect");
            return (Criteria) this;
        }

        public Criteria andBookcollectGreaterThan(Long value) {
            addCriterion("BookCollect >", value, "bookcollect");
            return (Criteria) this;
        }

        public Criteria andBookcollectGreaterThanOrEqualTo(Long value) {
            addCriterion("BookCollect >=", value, "bookcollect");
            return (Criteria) this;
        }

        public Criteria andBookcollectLessThan(Long value) {
            addCriterion("BookCollect <", value, "bookcollect");
            return (Criteria) this;
        }

        public Criteria andBookcollectLessThanOrEqualTo(Long value) {
            addCriterion("BookCollect <=", value, "bookcollect");
            return (Criteria) this;
        }

        public Criteria andBookcollectIn(List<Long> values) {
            addCriterion("BookCollect in", values, "bookcollect");
            return (Criteria) this;
        }

        public Criteria andBookcollectNotIn(List<Long> values) {
            addCriterion("BookCollect not in", values, "bookcollect");
            return (Criteria) this;
        }

        public Criteria andBookcollectBetween(Long value1, Long value2) {
            addCriterion("BookCollect between", value1, value2, "bookcollect");
            return (Criteria) this;
        }

        public Criteria andBookcollectNotBetween(Long value1, Long value2) {
            addCriterion("BookCollect not between", value1, value2, "bookcollect");
            return (Criteria) this;
        }

        public Criteria andBookcoppercoinsIsNull() {
            addCriterion("BookCopperCoins is null");
            return (Criteria) this;
        }

        public Criteria andBookcoppercoinsIsNotNull() {
            addCriterion("BookCopperCoins is not null");
            return (Criteria) this;
        }

        public Criteria andBookcoppercoinsEqualTo(Long value) {
            addCriterion("BookCopperCoins =", value, "bookcoppercoins");
            return (Criteria) this;
        }

        public Criteria andBookcoppercoinsNotEqualTo(Long value) {
            addCriterion("BookCopperCoins <>", value, "bookcoppercoins");
            return (Criteria) this;
        }

        public Criteria andBookcoppercoinsGreaterThan(Long value) {
            addCriterion("BookCopperCoins >", value, "bookcoppercoins");
            return (Criteria) this;
        }

        public Criteria andBookcoppercoinsGreaterThanOrEqualTo(Long value) {
            addCriterion("BookCopperCoins >=", value, "bookcoppercoins");
            return (Criteria) this;
        }

        public Criteria andBookcoppercoinsLessThan(Long value) {
            addCriterion("BookCopperCoins <", value, "bookcoppercoins");
            return (Criteria) this;
        }

        public Criteria andBookcoppercoinsLessThanOrEqualTo(Long value) {
            addCriterion("BookCopperCoins <=", value, "bookcoppercoins");
            return (Criteria) this;
        }

        public Criteria andBookcoppercoinsIn(List<Long> values) {
            addCriterion("BookCopperCoins in", values, "bookcoppercoins");
            return (Criteria) this;
        }

        public Criteria andBookcoppercoinsNotIn(List<Long> values) {
            addCriterion("BookCopperCoins not in", values, "bookcoppercoins");
            return (Criteria) this;
        }

        public Criteria andBookcoppercoinsBetween(Long value1, Long value2) {
            addCriterion("BookCopperCoins between", value1, value2, "bookcoppercoins");
            return (Criteria) this;
        }

        public Criteria andBookcoppercoinsNotBetween(Long value1, Long value2) {
            addCriterion("BookCopperCoins not between", value1, value2, "bookcoppercoins");
            return (Criteria) this;
        }

        public Criteria andBooksilvercoinsIsNull() {
            addCriterion("BookSilverCoins is null");
            return (Criteria) this;
        }

        public Criteria andBooksilvercoinsIsNotNull() {
            addCriterion("BookSilverCoins is not null");
            return (Criteria) this;
        }

        public Criteria andBooksilvercoinsEqualTo(Long value) {
            addCriterion("BookSilverCoins =", value, "booksilvercoins");
            return (Criteria) this;
        }

        public Criteria andBooksilvercoinsNotEqualTo(Long value) {
            addCriterion("BookSilverCoins <>", value, "booksilvercoins");
            return (Criteria) this;
        }

        public Criteria andBooksilvercoinsGreaterThan(Long value) {
            addCriterion("BookSilverCoins >", value, "booksilvercoins");
            return (Criteria) this;
        }

        public Criteria andBooksilvercoinsGreaterThanOrEqualTo(Long value) {
            addCriterion("BookSilverCoins >=", value, "booksilvercoins");
            return (Criteria) this;
        }

        public Criteria andBooksilvercoinsLessThan(Long value) {
            addCriterion("BookSilverCoins <", value, "booksilvercoins");
            return (Criteria) this;
        }

        public Criteria andBooksilvercoinsLessThanOrEqualTo(Long value) {
            addCriterion("BookSilverCoins <=", value, "booksilvercoins");
            return (Criteria) this;
        }

        public Criteria andBooksilvercoinsIn(List<Long> values) {
            addCriterion("BookSilverCoins in", values, "booksilvercoins");
            return (Criteria) this;
        }

        public Criteria andBooksilvercoinsNotIn(List<Long> values) {
            addCriterion("BookSilverCoins not in", values, "booksilvercoins");
            return (Criteria) this;
        }

        public Criteria andBooksilvercoinsBetween(Long value1, Long value2) {
            addCriterion("BookSilverCoins between", value1, value2, "booksilvercoins");
            return (Criteria) this;
        }

        public Criteria andBooksilvercoinsNotBetween(Long value1, Long value2) {
            addCriterion("BookSilverCoins not between", value1, value2, "booksilvercoins");
            return (Criteria) this;
        }

        public Criteria andWeekwordcountIsNull() {
            addCriterion("WeekWordCount is null");
            return (Criteria) this;
        }

        public Criteria andWeekwordcountIsNotNull() {
            addCriterion("WeekWordCount is not null");
            return (Criteria) this;
        }

        public Criteria andWeekwordcountEqualTo(Long value) {
            addCriterion("WeekWordCount =", value, "weekwordcount");
            return (Criteria) this;
        }

        public Criteria andWeekwordcountNotEqualTo(Long value) {
            addCriterion("WeekWordCount <>", value, "weekwordcount");
            return (Criteria) this;
        }

        public Criteria andWeekwordcountGreaterThan(Long value) {
            addCriterion("WeekWordCount >", value, "weekwordcount");
            return (Criteria) this;
        }

        public Criteria andWeekwordcountGreaterThanOrEqualTo(Long value) {
            addCriterion("WeekWordCount >=", value, "weekwordcount");
            return (Criteria) this;
        }

        public Criteria andWeekwordcountLessThan(Long value) {
            addCriterion("WeekWordCount <", value, "weekwordcount");
            return (Criteria) this;
        }

        public Criteria andWeekwordcountLessThanOrEqualTo(Long value) {
            addCriterion("WeekWordCount <=", value, "weekwordcount");
            return (Criteria) this;
        }

        public Criteria andWeekwordcountIn(List<Long> values) {
            addCriterion("WeekWordCount in", values, "weekwordcount");
            return (Criteria) this;
        }

        public Criteria andWeekwordcountNotIn(List<Long> values) {
            addCriterion("WeekWordCount not in", values, "weekwordcount");
            return (Criteria) this;
        }

        public Criteria andWeekwordcountBetween(Long value1, Long value2) {
            addCriterion("WeekWordCount between", value1, value2, "weekwordcount");
            return (Criteria) this;
        }

        public Criteria andWeekwordcountNotBetween(Long value1, Long value2) {
            addCriterion("WeekWordCount not between", value1, value2, "weekwordcount");
            return (Criteria) this;
        }

        public Criteria andWeekhitIsNull() {
            addCriterion("WeekHit is null");
            return (Criteria) this;
        }

        public Criteria andWeekhitIsNotNull() {
            addCriterion("WeekHit is not null");
            return (Criteria) this;
        }

        public Criteria andWeekhitEqualTo(Long value) {
            addCriterion("WeekHit =", value, "weekhit");
            return (Criteria) this;
        }

        public Criteria andWeekhitNotEqualTo(Long value) {
            addCriterion("WeekHit <>", value, "weekhit");
            return (Criteria) this;
        }

        public Criteria andWeekhitGreaterThan(Long value) {
            addCriterion("WeekHit >", value, "weekhit");
            return (Criteria) this;
        }

        public Criteria andWeekhitGreaterThanOrEqualTo(Long value) {
            addCriterion("WeekHit >=", value, "weekhit");
            return (Criteria) this;
        }

        public Criteria andWeekhitLessThan(Long value) {
            addCriterion("WeekHit <", value, "weekhit");
            return (Criteria) this;
        }

        public Criteria andWeekhitLessThanOrEqualTo(Long value) {
            addCriterion("WeekHit <=", value, "weekhit");
            return (Criteria) this;
        }

        public Criteria andWeekhitIn(List<Long> values) {
            addCriterion("WeekHit in", values, "weekhit");
            return (Criteria) this;
        }

        public Criteria andWeekhitNotIn(List<Long> values) {
            addCriterion("WeekHit not in", values, "weekhit");
            return (Criteria) this;
        }

        public Criteria andWeekhitBetween(Long value1, Long value2) {
            addCriterion("WeekHit between", value1, value2, "weekhit");
            return (Criteria) this;
        }

        public Criteria andWeekhitNotBetween(Long value1, Long value2) {
            addCriterion("WeekHit not between", value1, value2, "weekhit");
            return (Criteria) this;
        }

        public Criteria andWeekcoppercoinsIsNull() {
            addCriterion("WeekCopperCoins is null");
            return (Criteria) this;
        }

        public Criteria andWeekcoppercoinsIsNotNull() {
            addCriterion("WeekCopperCoins is not null");
            return (Criteria) this;
        }

        public Criteria andWeekcoppercoinsEqualTo(Long value) {
            addCriterion("WeekCopperCoins =", value, "weekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andWeekcoppercoinsNotEqualTo(Long value) {
            addCriterion("WeekCopperCoins <>", value, "weekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andWeekcoppercoinsGreaterThan(Long value) {
            addCriterion("WeekCopperCoins >", value, "weekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andWeekcoppercoinsGreaterThanOrEqualTo(Long value) {
            addCriterion("WeekCopperCoins >=", value, "weekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andWeekcoppercoinsLessThan(Long value) {
            addCriterion("WeekCopperCoins <", value, "weekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andWeekcoppercoinsLessThanOrEqualTo(Long value) {
            addCriterion("WeekCopperCoins <=", value, "weekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andWeekcoppercoinsIn(List<Long> values) {
            addCriterion("WeekCopperCoins in", values, "weekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andWeekcoppercoinsNotIn(List<Long> values) {
            addCriterion("WeekCopperCoins not in", values, "weekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andWeekcoppercoinsBetween(Long value1, Long value2) {
            addCriterion("WeekCopperCoins between", value1, value2, "weekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andWeekcoppercoinsNotBetween(Long value1, Long value2) {
            addCriterion("WeekCopperCoins not between", value1, value2, "weekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andMonthwordcountIsNull() {
            addCriterion("MonthWordCount is null");
            return (Criteria) this;
        }

        public Criteria andMonthwordcountIsNotNull() {
            addCriterion("MonthWordCount is not null");
            return (Criteria) this;
        }

        public Criteria andMonthwordcountEqualTo(Long value) {
            addCriterion("MonthWordCount =", value, "monthwordcount");
            return (Criteria) this;
        }

        public Criteria andMonthwordcountNotEqualTo(Long value) {
            addCriterion("MonthWordCount <>", value, "monthwordcount");
            return (Criteria) this;
        }

        public Criteria andMonthwordcountGreaterThan(Long value) {
            addCriterion("MonthWordCount >", value, "monthwordcount");
            return (Criteria) this;
        }

        public Criteria andMonthwordcountGreaterThanOrEqualTo(Long value) {
            addCriterion("MonthWordCount >=", value, "monthwordcount");
            return (Criteria) this;
        }

        public Criteria andMonthwordcountLessThan(Long value) {
            addCriterion("MonthWordCount <", value, "monthwordcount");
            return (Criteria) this;
        }

        public Criteria andMonthwordcountLessThanOrEqualTo(Long value) {
            addCriterion("MonthWordCount <=", value, "monthwordcount");
            return (Criteria) this;
        }

        public Criteria andMonthwordcountIn(List<Long> values) {
            addCriterion("MonthWordCount in", values, "monthwordcount");
            return (Criteria) this;
        }

        public Criteria andMonthwordcountNotIn(List<Long> values) {
            addCriterion("MonthWordCount not in", values, "monthwordcount");
            return (Criteria) this;
        }

        public Criteria andMonthwordcountBetween(Long value1, Long value2) {
            addCriterion("MonthWordCount between", value1, value2, "monthwordcount");
            return (Criteria) this;
        }

        public Criteria andMonthwordcountNotBetween(Long value1, Long value2) {
            addCriterion("MonthWordCount not between", value1, value2, "monthwordcount");
            return (Criteria) this;
        }

        public Criteria andMonthhitIsNull() {
            addCriterion("MonthHit is null");
            return (Criteria) this;
        }

        public Criteria andMonthhitIsNotNull() {
            addCriterion("MonthHit is not null");
            return (Criteria) this;
        }

        public Criteria andMonthhitEqualTo(Long value) {
            addCriterion("MonthHit =", value, "monthhit");
            return (Criteria) this;
        }

        public Criteria andMonthhitNotEqualTo(Long value) {
            addCriterion("MonthHit <>", value, "monthhit");
            return (Criteria) this;
        }

        public Criteria andMonthhitGreaterThan(Long value) {
            addCriterion("MonthHit >", value, "monthhit");
            return (Criteria) this;
        }

        public Criteria andMonthhitGreaterThanOrEqualTo(Long value) {
            addCriterion("MonthHit >=", value, "monthhit");
            return (Criteria) this;
        }

        public Criteria andMonthhitLessThan(Long value) {
            addCriterion("MonthHit <", value, "monthhit");
            return (Criteria) this;
        }

        public Criteria andMonthhitLessThanOrEqualTo(Long value) {
            addCriterion("MonthHit <=", value, "monthhit");
            return (Criteria) this;
        }

        public Criteria andMonthhitIn(List<Long> values) {
            addCriterion("MonthHit in", values, "monthhit");
            return (Criteria) this;
        }

        public Criteria andMonthhitNotIn(List<Long> values) {
            addCriterion("MonthHit not in", values, "monthhit");
            return (Criteria) this;
        }

        public Criteria andMonthhitBetween(Long value1, Long value2) {
            addCriterion("MonthHit between", value1, value2, "monthhit");
            return (Criteria) this;
        }

        public Criteria andMonthhitNotBetween(Long value1, Long value2) {
            addCriterion("MonthHit not between", value1, value2, "monthhit");
            return (Criteria) this;
        }

        public Criteria andMonthcoppercoinsIsNull() {
            addCriterion("MonthCopperCoins is null");
            return (Criteria) this;
        }

        public Criteria andMonthcoppercoinsIsNotNull() {
            addCriterion("MonthCopperCoins is not null");
            return (Criteria) this;
        }

        public Criteria andMonthcoppercoinsEqualTo(Long value) {
            addCriterion("MonthCopperCoins =", value, "monthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andMonthcoppercoinsNotEqualTo(Long value) {
            addCriterion("MonthCopperCoins <>", value, "monthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andMonthcoppercoinsGreaterThan(Long value) {
            addCriterion("MonthCopperCoins >", value, "monthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andMonthcoppercoinsGreaterThanOrEqualTo(Long value) {
            addCriterion("MonthCopperCoins >=", value, "monthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andMonthcoppercoinsLessThan(Long value) {
            addCriterion("MonthCopperCoins <", value, "monthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andMonthcoppercoinsLessThanOrEqualTo(Long value) {
            addCriterion("MonthCopperCoins <=", value, "monthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andMonthcoppercoinsIn(List<Long> values) {
            addCriterion("MonthCopperCoins in", values, "monthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andMonthcoppercoinsNotIn(List<Long> values) {
            addCriterion("MonthCopperCoins not in", values, "monthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andMonthcoppercoinsBetween(Long value1, Long value2) {
            addCriterion("MonthCopperCoins between", value1, value2, "monthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andMonthcoppercoinsNotBetween(Long value1, Long value2) {
            addCriterion("MonthCopperCoins not between", value1, value2, "monthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEveryweekwordcountIsNull() {
            addCriterion("EveryWeekWordCount is null");
            return (Criteria) this;
        }

        public Criteria andEveryweekwordcountIsNotNull() {
            addCriterion("EveryWeekWordCount is not null");
            return (Criteria) this;
        }

        public Criteria andEveryweekwordcountEqualTo(Long value) {
            addCriterion("EveryWeekWordCount =", value, "everyweekwordcount");
            return (Criteria) this;
        }

        public Criteria andEveryweekwordcountNotEqualTo(Long value) {
            addCriterion("EveryWeekWordCount <>", value, "everyweekwordcount");
            return (Criteria) this;
        }

        public Criteria andEveryweekwordcountGreaterThan(Long value) {
            addCriterion("EveryWeekWordCount >", value, "everyweekwordcount");
            return (Criteria) this;
        }

        public Criteria andEveryweekwordcountGreaterThanOrEqualTo(Long value) {
            addCriterion("EveryWeekWordCount >=", value, "everyweekwordcount");
            return (Criteria) this;
        }

        public Criteria andEveryweekwordcountLessThan(Long value) {
            addCriterion("EveryWeekWordCount <", value, "everyweekwordcount");
            return (Criteria) this;
        }

        public Criteria andEveryweekwordcountLessThanOrEqualTo(Long value) {
            addCriterion("EveryWeekWordCount <=", value, "everyweekwordcount");
            return (Criteria) this;
        }

        public Criteria andEveryweekwordcountIn(List<Long> values) {
            addCriterion("EveryWeekWordCount in", values, "everyweekwordcount");
            return (Criteria) this;
        }

        public Criteria andEveryweekwordcountNotIn(List<Long> values) {
            addCriterion("EveryWeekWordCount not in", values, "everyweekwordcount");
            return (Criteria) this;
        }

        public Criteria andEveryweekwordcountBetween(Long value1, Long value2) {
            addCriterion("EveryWeekWordCount between", value1, value2, "everyweekwordcount");
            return (Criteria) this;
        }

        public Criteria andEveryweekwordcountNotBetween(Long value1, Long value2) {
            addCriterion("EveryWeekWordCount not between", value1, value2, "everyweekwordcount");
            return (Criteria) this;
        }

        public Criteria andEveryweekhitIsNull() {
            addCriterion("EveryWeekHit is null");
            return (Criteria) this;
        }

        public Criteria andEveryweekhitIsNotNull() {
            addCriterion("EveryWeekHit is not null");
            return (Criteria) this;
        }

        public Criteria andEveryweekhitEqualTo(Long value) {
            addCriterion("EveryWeekHit =", value, "everyweekhit");
            return (Criteria) this;
        }

        public Criteria andEveryweekhitNotEqualTo(Long value) {
            addCriterion("EveryWeekHit <>", value, "everyweekhit");
            return (Criteria) this;
        }

        public Criteria andEveryweekhitGreaterThan(Long value) {
            addCriterion("EveryWeekHit >", value, "everyweekhit");
            return (Criteria) this;
        }

        public Criteria andEveryweekhitGreaterThanOrEqualTo(Long value) {
            addCriterion("EveryWeekHit >=", value, "everyweekhit");
            return (Criteria) this;
        }

        public Criteria andEveryweekhitLessThan(Long value) {
            addCriterion("EveryWeekHit <", value, "everyweekhit");
            return (Criteria) this;
        }

        public Criteria andEveryweekhitLessThanOrEqualTo(Long value) {
            addCriterion("EveryWeekHit <=", value, "everyweekhit");
            return (Criteria) this;
        }

        public Criteria andEveryweekhitIn(List<Long> values) {
            addCriterion("EveryWeekHit in", values, "everyweekhit");
            return (Criteria) this;
        }

        public Criteria andEveryweekhitNotIn(List<Long> values) {
            addCriterion("EveryWeekHit not in", values, "everyweekhit");
            return (Criteria) this;
        }

        public Criteria andEveryweekhitBetween(Long value1, Long value2) {
            addCriterion("EveryWeekHit between", value1, value2, "everyweekhit");
            return (Criteria) this;
        }

        public Criteria andEveryweekhitNotBetween(Long value1, Long value2) {
            addCriterion("EveryWeekHit not between", value1, value2, "everyweekhit");
            return (Criteria) this;
        }

        public Criteria andEveryweekcoppercoinsIsNull() {
            addCriterion("EveryWeekCopperCoins is null");
            return (Criteria) this;
        }

        public Criteria andEveryweekcoppercoinsIsNotNull() {
            addCriterion("EveryWeekCopperCoins is not null");
            return (Criteria) this;
        }

        public Criteria andEveryweekcoppercoinsEqualTo(Long value) {
            addCriterion("EveryWeekCopperCoins =", value, "everyweekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEveryweekcoppercoinsNotEqualTo(Long value) {
            addCriterion("EveryWeekCopperCoins <>", value, "everyweekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEveryweekcoppercoinsGreaterThan(Long value) {
            addCriterion("EveryWeekCopperCoins >", value, "everyweekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEveryweekcoppercoinsGreaterThanOrEqualTo(Long value) {
            addCriterion("EveryWeekCopperCoins >=", value, "everyweekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEveryweekcoppercoinsLessThan(Long value) {
            addCriterion("EveryWeekCopperCoins <", value, "everyweekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEveryweekcoppercoinsLessThanOrEqualTo(Long value) {
            addCriterion("EveryWeekCopperCoins <=", value, "everyweekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEveryweekcoppercoinsIn(List<Long> values) {
            addCriterion("EveryWeekCopperCoins in", values, "everyweekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEveryweekcoppercoinsNotIn(List<Long> values) {
            addCriterion("EveryWeekCopperCoins not in", values, "everyweekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEveryweekcoppercoinsBetween(Long value1, Long value2) {
            addCriterion("EveryWeekCopperCoins between", value1, value2, "everyweekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEveryweekcoppercoinsNotBetween(Long value1, Long value2) {
            addCriterion("EveryWeekCopperCoins not between", value1, value2, "everyweekcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEverymonthwordcountIsNull() {
            addCriterion("EveryMonthWordCount is null");
            return (Criteria) this;
        }

        public Criteria andEverymonthwordcountIsNotNull() {
            addCriterion("EveryMonthWordCount is not null");
            return (Criteria) this;
        }

        public Criteria andEverymonthwordcountEqualTo(Long value) {
            addCriterion("EveryMonthWordCount =", value, "everymonthwordcount");
            return (Criteria) this;
        }

        public Criteria andEverymonthwordcountNotEqualTo(Long value) {
            addCriterion("EveryMonthWordCount <>", value, "everymonthwordcount");
            return (Criteria) this;
        }

        public Criteria andEverymonthwordcountGreaterThan(Long value) {
            addCriterion("EveryMonthWordCount >", value, "everymonthwordcount");
            return (Criteria) this;
        }

        public Criteria andEverymonthwordcountGreaterThanOrEqualTo(Long value) {
            addCriterion("EveryMonthWordCount >=", value, "everymonthwordcount");
            return (Criteria) this;
        }

        public Criteria andEverymonthwordcountLessThan(Long value) {
            addCriterion("EveryMonthWordCount <", value, "everymonthwordcount");
            return (Criteria) this;
        }

        public Criteria andEverymonthwordcountLessThanOrEqualTo(Long value) {
            addCriterion("EveryMonthWordCount <=", value, "everymonthwordcount");
            return (Criteria) this;
        }

        public Criteria andEverymonthwordcountIn(List<Long> values) {
            addCriterion("EveryMonthWordCount in", values, "everymonthwordcount");
            return (Criteria) this;
        }

        public Criteria andEverymonthwordcountNotIn(List<Long> values) {
            addCriterion("EveryMonthWordCount not in", values, "everymonthwordcount");
            return (Criteria) this;
        }

        public Criteria andEverymonthwordcountBetween(Long value1, Long value2) {
            addCriterion("EveryMonthWordCount between", value1, value2, "everymonthwordcount");
            return (Criteria) this;
        }

        public Criteria andEverymonthwordcountNotBetween(Long value1, Long value2) {
            addCriterion("EveryMonthWordCount not between", value1, value2, "everymonthwordcount");
            return (Criteria) this;
        }

        public Criteria andEverymonthhitIsNull() {
            addCriterion("EveryMonthHit is null");
            return (Criteria) this;
        }

        public Criteria andEverymonthhitIsNotNull() {
            addCriterion("EveryMonthHit is not null");
            return (Criteria) this;
        }

        public Criteria andEverymonthhitEqualTo(Long value) {
            addCriterion("EveryMonthHit =", value, "everymonthhit");
            return (Criteria) this;
        }

        public Criteria andEverymonthhitNotEqualTo(Long value) {
            addCriterion("EveryMonthHit <>", value, "everymonthhit");
            return (Criteria) this;
        }

        public Criteria andEverymonthhitGreaterThan(Long value) {
            addCriterion("EveryMonthHit >", value, "everymonthhit");
            return (Criteria) this;
        }

        public Criteria andEverymonthhitGreaterThanOrEqualTo(Long value) {
            addCriterion("EveryMonthHit >=", value, "everymonthhit");
            return (Criteria) this;
        }

        public Criteria andEverymonthhitLessThan(Long value) {
            addCriterion("EveryMonthHit <", value, "everymonthhit");
            return (Criteria) this;
        }

        public Criteria andEverymonthhitLessThanOrEqualTo(Long value) {
            addCriterion("EveryMonthHit <=", value, "everymonthhit");
            return (Criteria) this;
        }

        public Criteria andEverymonthhitIn(List<Long> values) {
            addCriterion("EveryMonthHit in", values, "everymonthhit");
            return (Criteria) this;
        }

        public Criteria andEverymonthhitNotIn(List<Long> values) {
            addCriterion("EveryMonthHit not in", values, "everymonthhit");
            return (Criteria) this;
        }

        public Criteria andEverymonthhitBetween(Long value1, Long value2) {
            addCriterion("EveryMonthHit between", value1, value2, "everymonthhit");
            return (Criteria) this;
        }

        public Criteria andEverymonthhitNotBetween(Long value1, Long value2) {
            addCriterion("EveryMonthHit not between", value1, value2, "everymonthhit");
            return (Criteria) this;
        }

        public Criteria andEverymonthcoppercoinsIsNull() {
            addCriterion("EveryMonthCopperCoins is null");
            return (Criteria) this;
        }

        public Criteria andEverymonthcoppercoinsIsNotNull() {
            addCriterion("EveryMonthCopperCoins is not null");
            return (Criteria) this;
        }

        public Criteria andEverymonthcoppercoinsEqualTo(Long value) {
            addCriterion("EveryMonthCopperCoins =", value, "everymonthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEverymonthcoppercoinsNotEqualTo(Long value) {
            addCriterion("EveryMonthCopperCoins <>", value, "everymonthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEverymonthcoppercoinsGreaterThan(Long value) {
            addCriterion("EveryMonthCopperCoins >", value, "everymonthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEverymonthcoppercoinsGreaterThanOrEqualTo(Long value) {
            addCriterion("EveryMonthCopperCoins >=", value, "everymonthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEverymonthcoppercoinsLessThan(Long value) {
            addCriterion("EveryMonthCopperCoins <", value, "everymonthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEverymonthcoppercoinsLessThanOrEqualTo(Long value) {
            addCriterion("EveryMonthCopperCoins <=", value, "everymonthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEverymonthcoppercoinsIn(List<Long> values) {
            addCriterion("EveryMonthCopperCoins in", values, "everymonthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEverymonthcoppercoinsNotIn(List<Long> values) {
            addCriterion("EveryMonthCopperCoins not in", values, "everymonthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEverymonthcoppercoinsBetween(Long value1, Long value2) {
            addCriterion("EveryMonthCopperCoins between", value1, value2, "everymonthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andEverymonthcoppercoinsNotBetween(Long value1, Long value2) {
            addCriterion("EveryMonthCopperCoins not between", value1, value2, "everymonthcoppercoins");
            return (Criteria) this;
        }

        public Criteria andBookissignIsNull() {
            addCriterion("BookIsSign is null");
            return (Criteria) this;
        }

        public Criteria andBookissignIsNotNull() {
            addCriterion("BookIsSign is not null");
            return (Criteria) this;
        }

        public Criteria andBookissignEqualTo(String value) {
            addCriterion("BookIsSign =", value, "bookissign");
            return (Criteria) this;
        }

        public Criteria andBookissignNotEqualTo(String value) {
            addCriterion("BookIsSign <>", value, "bookissign");
            return (Criteria) this;
        }

        public Criteria andBookissignGreaterThan(String value) {
            addCriterion("BookIsSign >", value, "bookissign");
            return (Criteria) this;
        }

        public Criteria andBookissignGreaterThanOrEqualTo(String value) {
            addCriterion("BookIsSign >=", value, "bookissign");
            return (Criteria) this;
        }

        public Criteria andBookissignLessThan(String value) {
            addCriterion("BookIsSign <", value, "bookissign");
            return (Criteria) this;
        }

        public Criteria andBookissignLessThanOrEqualTo(String value) {
            addCriterion("BookIsSign <=", value, "bookissign");
            return (Criteria) this;
        }

        public Criteria andBookissignLike(String value) {
            addCriterion("BookIsSign like", value, "bookissign");
            return (Criteria) this;
        }

        public Criteria andBookissignNotLike(String value) {
            addCriterion("BookIsSign not like", value, "bookissign");
            return (Criteria) this;
        }

        public Criteria andBookissignIn(List<String> values) {
            addCriterion("BookIsSign in", values, "bookissign");
            return (Criteria) this;
        }

        public Criteria andBookissignNotIn(List<String> values) {
            addCriterion("BookIsSign not in", values, "bookissign");
            return (Criteria) this;
        }

        public Criteria andBookissignBetween(String value1, String value2) {
            addCriterion("BookIsSign between", value1, value2, "bookissign");
            return (Criteria) this;
        }

        public Criteria andBookissignNotBetween(String value1, String value2) {
            addCriterion("BookIsSign not between", value1, value2, "bookissign");
            return (Criteria) this;
        }

        public Criteria andIsrecommendedIsNull() {
            addCriterion("IsRecommended is null");
            return (Criteria) this;
        }

        public Criteria andIsrecommendedIsNotNull() {
            addCriterion("IsRecommended is not null");
            return (Criteria) this;
        }

        public Criteria andIsrecommendedEqualTo(String value) {
            addCriterion("IsRecommended =", value, "isrecommended");
            return (Criteria) this;
        }

        public Criteria andIsrecommendedNotEqualTo(String value) {
            addCriterion("IsRecommended <>", value, "isrecommended");
            return (Criteria) this;
        }

        public Criteria andIsrecommendedGreaterThan(String value) {
            addCriterion("IsRecommended >", value, "isrecommended");
            return (Criteria) this;
        }

        public Criteria andIsrecommendedGreaterThanOrEqualTo(String value) {
            addCriterion("IsRecommended >=", value, "isrecommended");
            return (Criteria) this;
        }

        public Criteria andIsrecommendedLessThan(String value) {
            addCriterion("IsRecommended <", value, "isrecommended");
            return (Criteria) this;
        }

        public Criteria andIsrecommendedLessThanOrEqualTo(String value) {
            addCriterion("IsRecommended <=", value, "isrecommended");
            return (Criteria) this;
        }

        public Criteria andIsrecommendedLike(String value) {
            addCriterion("IsRecommended like", value, "isrecommended");
            return (Criteria) this;
        }

        public Criteria andIsrecommendedNotLike(String value) {
            addCriterion("IsRecommended not like", value, "isrecommended");
            return (Criteria) this;
        }

        public Criteria andIsrecommendedIn(List<String> values) {
            addCriterion("IsRecommended in", values, "isrecommended");
            return (Criteria) this;
        }

        public Criteria andIsrecommendedNotIn(List<String> values) {
            addCriterion("IsRecommended not in", values, "isrecommended");
            return (Criteria) this;
        }

        public Criteria andIsrecommendedBetween(String value1, String value2) {
            addCriterion("IsRecommended between", value1, value2, "isrecommended");
            return (Criteria) this;
        }

        public Criteria andIsrecommendedNotBetween(String value1, String value2) {
            addCriterion("IsRecommended not between", value1, value2, "isrecommended");
            return (Criteria) this;
        }

        public Criteria andBookonindexIsNull() {
            addCriterion("BookOnIndex is null");
            return (Criteria) this;
        }

        public Criteria andBookonindexIsNotNull() {
            addCriterion("BookOnIndex is not null");
            return (Criteria) this;
        }

        public Criteria andBookonindexEqualTo(String value) {
            addCriterion("BookOnIndex =", value, "bookonindex");
            return (Criteria) this;
        }

        public Criteria andBookonindexNotEqualTo(String value) {
            addCriterion("BookOnIndex <>", value, "bookonindex");
            return (Criteria) this;
        }

        public Criteria andBookonindexGreaterThan(String value) {
            addCriterion("BookOnIndex >", value, "bookonindex");
            return (Criteria) this;
        }

        public Criteria andBookonindexGreaterThanOrEqualTo(String value) {
            addCriterion("BookOnIndex >=", value, "bookonindex");
            return (Criteria) this;
        }

        public Criteria andBookonindexLessThan(String value) {
            addCriterion("BookOnIndex <", value, "bookonindex");
            return (Criteria) this;
        }

        public Criteria andBookonindexLessThanOrEqualTo(String value) {
            addCriterion("BookOnIndex <=", value, "bookonindex");
            return (Criteria) this;
        }

        public Criteria andBookonindexLike(String value) {
            addCriterion("BookOnIndex like", value, "bookonindex");
            return (Criteria) this;
        }

        public Criteria andBookonindexNotLike(String value) {
            addCriterion("BookOnIndex not like", value, "bookonindex");
            return (Criteria) this;
        }

        public Criteria andBookonindexIn(List<String> values) {
            addCriterion("BookOnIndex in", values, "bookonindex");
            return (Criteria) this;
        }

        public Criteria andBookonindexNotIn(List<String> values) {
            addCriterion("BookOnIndex not in", values, "bookonindex");
            return (Criteria) this;
        }

        public Criteria andBookonindexBetween(String value1, String value2) {
            addCriterion("BookOnIndex between", value1, value2, "bookonindex");
            return (Criteria) this;
        }

        public Criteria andBookonindexNotBetween(String value1, String value2) {
            addCriterion("BookOnIndex not between", value1, value2, "bookonindex");
            return (Criteria) this;
        }

        public Criteria andUpdatecycleIsNull() {
            addCriterion("UpdateCycle is null");
            return (Criteria) this;
        }

        public Criteria andUpdatecycleIsNotNull() {
            addCriterion("UpdateCycle is not null");
            return (Criteria) this;
        }

        public Criteria andUpdatecycleEqualTo(Integer value) {
            addCriterion("UpdateCycle =", value, "updatecycle");
            return (Criteria) this;
        }

        public Criteria andUpdatecycleNotEqualTo(Integer value) {
            addCriterion("UpdateCycle <>", value, "updatecycle");
            return (Criteria) this;
        }

        public Criteria andUpdatecycleGreaterThan(Integer value) {
            addCriterion("UpdateCycle >", value, "updatecycle");
            return (Criteria) this;
        }

        public Criteria andUpdatecycleGreaterThanOrEqualTo(Integer value) {
            addCriterion("UpdateCycle >=", value, "updatecycle");
            return (Criteria) this;
        }

        public Criteria andUpdatecycleLessThan(Integer value) {
            addCriterion("UpdateCycle <", value, "updatecycle");
            return (Criteria) this;
        }

        public Criteria andUpdatecycleLessThanOrEqualTo(Integer value) {
            addCriterion("UpdateCycle <=", value, "updatecycle");
            return (Criteria) this;
        }

        public Criteria andUpdatecycleIn(List<Integer> values) {
            addCriterion("UpdateCycle in", values, "updatecycle");
            return (Criteria) this;
        }

        public Criteria andUpdatecycleNotIn(List<Integer> values) {
            addCriterion("UpdateCycle not in", values, "updatecycle");
            return (Criteria) this;
        }

        public Criteria andUpdatecycleBetween(Integer value1, Integer value2) {
            addCriterion("UpdateCycle between", value1, value2, "updatecycle");
            return (Criteria) this;
        }

        public Criteria andUpdatecycleNotBetween(Integer value1, Integer value2) {
            addCriterion("UpdateCycle not between", value1, value2, "updatecycle");
            return (Criteria) this;
        }

        public Criteria andChangeupdatecycletimeIsNull() {
            addCriterion("ChangeUpdateCycleTime is null");
            return (Criteria) this;
        }

        public Criteria andChangeupdatecycletimeIsNotNull() {
            addCriterion("ChangeUpdateCycleTime is not null");
            return (Criteria) this;
        }

        public Criteria andChangeupdatecycletimeEqualTo(Date value) {
            addCriterion("ChangeUpdateCycleTime =", value, "changeupdatecycletime");
            return (Criteria) this;
        }

        public Criteria andChangeupdatecycletimeNotEqualTo(Date value) {
            addCriterion("ChangeUpdateCycleTime <>", value, "changeupdatecycletime");
            return (Criteria) this;
        }

        public Criteria andChangeupdatecycletimeGreaterThan(Date value) {
            addCriterion("ChangeUpdateCycleTime >", value, "changeupdatecycletime");
            return (Criteria) this;
        }

        public Criteria andChangeupdatecycletimeGreaterThanOrEqualTo(Date value) {
            addCriterion("ChangeUpdateCycleTime >=", value, "changeupdatecycletime");
            return (Criteria) this;
        }

        public Criteria andChangeupdatecycletimeLessThan(Date value) {
            addCriterion("ChangeUpdateCycleTime <", value, "changeupdatecycletime");
            return (Criteria) this;
        }

        public Criteria andChangeupdatecycletimeLessThanOrEqualTo(Date value) {
            addCriterion("ChangeUpdateCycleTime <=", value, "changeupdatecycletime");
            return (Criteria) this;
        }

        public Criteria andChangeupdatecycletimeIn(List<Date> values) {
            addCriterion("ChangeUpdateCycleTime in", values, "changeupdatecycletime");
            return (Criteria) this;
        }

        public Criteria andChangeupdatecycletimeNotIn(List<Date> values) {
            addCriterion("ChangeUpdateCycleTime not in", values, "changeupdatecycletime");
            return (Criteria) this;
        }

        public Criteria andChangeupdatecycletimeBetween(Date value1, Date value2) {
            addCriterion("ChangeUpdateCycleTime between", value1, value2, "changeupdatecycletime");
            return (Criteria) this;
        }

        public Criteria andChangeupdatecycletimeNotBetween(Date value1, Date value2) {
            addCriterion("ChangeUpdateCycleTime not between", value1, value2, "changeupdatecycletime");
            return (Criteria) this;
        }

        public Criteria andNextupdatecycleIsNull() {
            addCriterion("NextUpdateCycle is null");
            return (Criteria) this;
        }

        public Criteria andNextupdatecycleIsNotNull() {
            addCriterion("NextUpdateCycle is not null");
            return (Criteria) this;
        }

        public Criteria andNextupdatecycleEqualTo(Integer value) {
            addCriterion("NextUpdateCycle =", value, "nextupdatecycle");
            return (Criteria) this;
        }

        public Criteria andNextupdatecycleNotEqualTo(Integer value) {
            addCriterion("NextUpdateCycle <>", value, "nextupdatecycle");
            return (Criteria) this;
        }

        public Criteria andNextupdatecycleGreaterThan(Integer value) {
            addCriterion("NextUpdateCycle >", value, "nextupdatecycle");
            return (Criteria) this;
        }

        public Criteria andNextupdatecycleGreaterThanOrEqualTo(Integer value) {
            addCriterion("NextUpdateCycle >=", value, "nextupdatecycle");
            return (Criteria) this;
        }

        public Criteria andNextupdatecycleLessThan(Integer value) {
            addCriterion("NextUpdateCycle <", value, "nextupdatecycle");
            return (Criteria) this;
        }

        public Criteria andNextupdatecycleLessThanOrEqualTo(Integer value) {
            addCriterion("NextUpdateCycle <=", value, "nextupdatecycle");
            return (Criteria) this;
        }

        public Criteria andNextupdatecycleIn(List<Integer> values) {
            addCriterion("NextUpdateCycle in", values, "nextupdatecycle");
            return (Criteria) this;
        }

        public Criteria andNextupdatecycleNotIn(List<Integer> values) {
            addCriterion("NextUpdateCycle not in", values, "nextupdatecycle");
            return (Criteria) this;
        }

        public Criteria andNextupdatecycleBetween(Integer value1, Integer value2) {
            addCriterion("NextUpdateCycle between", value1, value2, "nextupdatecycle");
            return (Criteria) this;
        }

        public Criteria andNextupdatecycleNotBetween(Integer value1, Integer value2) {
            addCriterion("NextUpdateCycle not between", value1, value2, "nextupdatecycle");
            return (Criteria) this;
        }
    }

    /**
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}