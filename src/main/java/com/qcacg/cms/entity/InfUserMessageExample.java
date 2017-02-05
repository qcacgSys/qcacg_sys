package com.qcacg.cms.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class InfUserMessageExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Integer limit;

    private Integer offset;

    public InfUserMessageExample() {
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

        public Criteria andMessageidIsNull() {
            addCriterion("MessageId is null");
            return (Criteria) this;
        }

        public Criteria andMessageidIsNotNull() {
            addCriterion("MessageId is not null");
            return (Criteria) this;
        }

        public Criteria andMessageidEqualTo(Integer value) {
            addCriterion("MessageId =", value, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidNotEqualTo(Integer value) {
            addCriterion("MessageId <>", value, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidGreaterThan(Integer value) {
            addCriterion("MessageId >", value, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidGreaterThanOrEqualTo(Integer value) {
            addCriterion("MessageId >=", value, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidLessThan(Integer value) {
            addCriterion("MessageId <", value, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidLessThanOrEqualTo(Integer value) {
            addCriterion("MessageId <=", value, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidIn(List<Integer> values) {
            addCriterion("MessageId in", values, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidNotIn(List<Integer> values) {
            addCriterion("MessageId not in", values, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidBetween(Integer value1, Integer value2) {
            addCriterion("MessageId between", value1, value2, "messageid");
            return (Criteria) this;
        }

        public Criteria andMessageidNotBetween(Integer value1, Integer value2) {
            addCriterion("MessageId not between", value1, value2, "messageid");
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

        public Criteria andUseridEqualTo(Integer value) {
            addCriterion("UserId =", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotEqualTo(Integer value) {
            addCriterion("UserId <>", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThan(Integer value) {
            addCriterion("UserId >", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridGreaterThanOrEqualTo(Integer value) {
            addCriterion("UserId >=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThan(Integer value) {
            addCriterion("UserId <", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridLessThanOrEqualTo(Integer value) {
            addCriterion("UserId <=", value, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridIn(List<Integer> values) {
            addCriterion("UserId in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotIn(List<Integer> values) {
            addCriterion("UserId not in", values, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridBetween(Integer value1, Integer value2) {
            addCriterion("UserId between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andUseridNotBetween(Integer value1, Integer value2) {
            addCriterion("UserId not between", value1, value2, "userid");
            return (Criteria) this;
        }

        public Criteria andMessagetitleIsNull() {
            addCriterion("MessageTitle is null");
            return (Criteria) this;
        }

        public Criteria andMessagetitleIsNotNull() {
            addCriterion("MessageTitle is not null");
            return (Criteria) this;
        }

        public Criteria andMessagetitleEqualTo(String value) {
            addCriterion("MessageTitle =", value, "messagetitle");
            return (Criteria) this;
        }

        public Criteria andMessagetitleNotEqualTo(String value) {
            addCriterion("MessageTitle <>", value, "messagetitle");
            return (Criteria) this;
        }

        public Criteria andMessagetitleGreaterThan(String value) {
            addCriterion("MessageTitle >", value, "messagetitle");
            return (Criteria) this;
        }

        public Criteria andMessagetitleGreaterThanOrEqualTo(String value) {
            addCriterion("MessageTitle >=", value, "messagetitle");
            return (Criteria) this;
        }

        public Criteria andMessagetitleLessThan(String value) {
            addCriterion("MessageTitle <", value, "messagetitle");
            return (Criteria) this;
        }

        public Criteria andMessagetitleLessThanOrEqualTo(String value) {
            addCriterion("MessageTitle <=", value, "messagetitle");
            return (Criteria) this;
        }

        public Criteria andMessagetitleLike(String value) {
            addCriterion("MessageTitle like", value, "messagetitle");
            return (Criteria) this;
        }

        public Criteria andMessagetitleNotLike(String value) {
            addCriterion("MessageTitle not like", value, "messagetitle");
            return (Criteria) this;
        }

        public Criteria andMessagetitleIn(List<String> values) {
            addCriterion("MessageTitle in", values, "messagetitle");
            return (Criteria) this;
        }

        public Criteria andMessagetitleNotIn(List<String> values) {
            addCriterion("MessageTitle not in", values, "messagetitle");
            return (Criteria) this;
        }

        public Criteria andMessagetitleBetween(String value1, String value2) {
            addCriterion("MessageTitle between", value1, value2, "messagetitle");
            return (Criteria) this;
        }

        public Criteria andMessagetitleNotBetween(String value1, String value2) {
            addCriterion("MessageTitle not between", value1, value2, "messagetitle");
            return (Criteria) this;
        }

        public Criteria andMessagecreatedateIsNull() {
            addCriterion("MessageCreateDate is null");
            return (Criteria) this;
        }

        public Criteria andMessagecreatedateIsNotNull() {
            addCriterion("MessageCreateDate is not null");
            return (Criteria) this;
        }

        public Criteria andMessagecreatedateEqualTo(Date value) {
            addCriterion("MessageCreateDate =", value, "messagecreatedate");
            return (Criteria) this;
        }

        public Criteria andMessagecreatedateNotEqualTo(Date value) {
            addCriterion("MessageCreateDate <>", value, "messagecreatedate");
            return (Criteria) this;
        }

        public Criteria andMessagecreatedateGreaterThan(Date value) {
            addCriterion("MessageCreateDate >", value, "messagecreatedate");
            return (Criteria) this;
        }

        public Criteria andMessagecreatedateGreaterThanOrEqualTo(Date value) {
            addCriterion("MessageCreateDate >=", value, "messagecreatedate");
            return (Criteria) this;
        }

        public Criteria andMessagecreatedateLessThan(Date value) {
            addCriterion("MessageCreateDate <", value, "messagecreatedate");
            return (Criteria) this;
        }

        public Criteria andMessagecreatedateLessThanOrEqualTo(Date value) {
            addCriterion("MessageCreateDate <=", value, "messagecreatedate");
            return (Criteria) this;
        }

        public Criteria andMessagecreatedateIn(List<Date> values) {
            addCriterion("MessageCreateDate in", values, "messagecreatedate");
            return (Criteria) this;
        }

        public Criteria andMessagecreatedateNotIn(List<Date> values) {
            addCriterion("MessageCreateDate not in", values, "messagecreatedate");
            return (Criteria) this;
        }

        public Criteria andMessagecreatedateBetween(Date value1, Date value2) {
            addCriterion("MessageCreateDate between", value1, value2, "messagecreatedate");
            return (Criteria) this;
        }

        public Criteria andMessagecreatedateNotBetween(Date value1, Date value2) {
            addCriterion("MessageCreateDate not between", value1, value2, "messagecreatedate");
            return (Criteria) this;
        }

        public Criteria andMessagetypeIsNull() {
            addCriterion("MessageType is null");
            return (Criteria) this;
        }

        public Criteria andMessagetypeIsNotNull() {
            addCriterion("MessageType is not null");
            return (Criteria) this;
        }

        public Criteria andMessagetypeEqualTo(String value) {
            addCriterion("MessageType =", value, "messagetype");
            return (Criteria) this;
        }

        public Criteria andMessagetypeNotEqualTo(String value) {
            addCriterion("MessageType <>", value, "messagetype");
            return (Criteria) this;
        }

        public Criteria andMessagetypeGreaterThan(String value) {
            addCriterion("MessageType >", value, "messagetype");
            return (Criteria) this;
        }

        public Criteria andMessagetypeGreaterThanOrEqualTo(String value) {
            addCriterion("MessageType >=", value, "messagetype");
            return (Criteria) this;
        }

        public Criteria andMessagetypeLessThan(String value) {
            addCriterion("MessageType <", value, "messagetype");
            return (Criteria) this;
        }

        public Criteria andMessagetypeLessThanOrEqualTo(String value) {
            addCriterion("MessageType <=", value, "messagetype");
            return (Criteria) this;
        }

        public Criteria andMessagetypeLike(String value) {
            addCriterion("MessageType like", value, "messagetype");
            return (Criteria) this;
        }

        public Criteria andMessagetypeNotLike(String value) {
            addCriterion("MessageType not like", value, "messagetype");
            return (Criteria) this;
        }

        public Criteria andMessagetypeIn(List<String> values) {
            addCriterion("MessageType in", values, "messagetype");
            return (Criteria) this;
        }

        public Criteria andMessagetypeNotIn(List<String> values) {
            addCriterion("MessageType not in", values, "messagetype");
            return (Criteria) this;
        }

        public Criteria andMessagetypeBetween(String value1, String value2) {
            addCriterion("MessageType between", value1, value2, "messagetype");
            return (Criteria) this;
        }

        public Criteria andMessagetypeNotBetween(String value1, String value2) {
            addCriterion("MessageType not between", value1, value2, "messagetype");
            return (Criteria) this;
        }

        public Criteria andMessagestatusIsNull() {
            addCriterion("MessageStatus is null");
            return (Criteria) this;
        }

        public Criteria andMessagestatusIsNotNull() {
            addCriterion("MessageStatus is not null");
            return (Criteria) this;
        }

        public Criteria andMessagestatusEqualTo(String value) {
            addCriterion("MessageStatus =", value, "messagestatus");
            return (Criteria) this;
        }

        public Criteria andMessagestatusNotEqualTo(String value) {
            addCriterion("MessageStatus <>", value, "messagestatus");
            return (Criteria) this;
        }

        public Criteria andMessagestatusGreaterThan(String value) {
            addCriterion("MessageStatus >", value, "messagestatus");
            return (Criteria) this;
        }

        public Criteria andMessagestatusGreaterThanOrEqualTo(String value) {
            addCriterion("MessageStatus >=", value, "messagestatus");
            return (Criteria) this;
        }

        public Criteria andMessagestatusLessThan(String value) {
            addCriterion("MessageStatus <", value, "messagestatus");
            return (Criteria) this;
        }

        public Criteria andMessagestatusLessThanOrEqualTo(String value) {
            addCriterion("MessageStatus <=", value, "messagestatus");
            return (Criteria) this;
        }

        public Criteria andMessagestatusLike(String value) {
            addCriterion("MessageStatus like", value, "messagestatus");
            return (Criteria) this;
        }

        public Criteria andMessagestatusNotLike(String value) {
            addCriterion("MessageStatus not like", value, "messagestatus");
            return (Criteria) this;
        }

        public Criteria andMessagestatusIn(List<String> values) {
            addCriterion("MessageStatus in", values, "messagestatus");
            return (Criteria) this;
        }

        public Criteria andMessagestatusNotIn(List<String> values) {
            addCriterion("MessageStatus not in", values, "messagestatus");
            return (Criteria) this;
        }

        public Criteria andMessagestatusBetween(String value1, String value2) {
            addCriterion("MessageStatus between", value1, value2, "messagestatus");
            return (Criteria) this;
        }

        public Criteria andMessagestatusNotBetween(String value1, String value2) {
            addCriterion("MessageStatus not between", value1, value2, "messagestatus");
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