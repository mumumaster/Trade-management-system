package com.mybatis.bean;

import java.util.ArrayList;
import java.util.List;

public class BillExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public BillExample() {
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

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andOrderidIsNull() {
            addCriterion("orderId is null");
            return (Criteria) this;
        }

        public Criteria andOrderidIsNotNull() {
            addCriterion("orderId is not null");
            return (Criteria) this;
        }

        public Criteria andOrderidEqualTo(String value) {
            addCriterion("orderId =", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotEqualTo(String value) {
            addCriterion("orderId <>", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidGreaterThan(String value) {
            addCriterion("orderId >", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidGreaterThanOrEqualTo(String value) {
            addCriterion("orderId >=", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidLessThan(String value) {
            addCriterion("orderId <", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidLessThanOrEqualTo(String value) {
            addCriterion("orderId <=", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidLike(String value) {
            addCriterion("orderId like", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotLike(String value) {
            addCriterion("orderId not like", value, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidIn(List<String> values) {
            addCriterion("orderId in", values, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotIn(List<String> values) {
            addCriterion("orderId not in", values, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidBetween(String value1, String value2) {
            addCriterion("orderId between", value1, value2, "orderid");
            return (Criteria) this;
        }

        public Criteria andOrderidNotBetween(String value1, String value2) {
            addCriterion("orderId not between", value1, value2, "orderid");
            return (Criteria) this;
        }

        public Criteria andCostIsNull() {
            addCriterion("cost is null");
            return (Criteria) this;
        }

        public Criteria andCostIsNotNull() {
            addCriterion("cost is not null");
            return (Criteria) this;
        }

        public Criteria andCostEqualTo(Float value) {
            addCriterion("cost =", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostNotEqualTo(Float value) {
            addCriterion("cost <>", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostGreaterThan(Float value) {
            addCriterion("cost >", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostGreaterThanOrEqualTo(Float value) {
            addCriterion("cost >=", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostLessThan(Float value) {
            addCriterion("cost <", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostLessThanOrEqualTo(Float value) {
            addCriterion("cost <=", value, "cost");
            return (Criteria) this;
        }

        public Criteria andCostIn(List<Float> values) {
            addCriterion("cost in", values, "cost");
            return (Criteria) this;
        }

        public Criteria andCostNotIn(List<Float> values) {
            addCriterion("cost not in", values, "cost");
            return (Criteria) this;
        }

        public Criteria andCostBetween(Float value1, Float value2) {
            addCriterion("cost between", value1, value2, "cost");
            return (Criteria) this;
        }

        public Criteria andCostNotBetween(Float value1, Float value2) {
            addCriterion("cost not between", value1, value2, "cost");
            return (Criteria) this;
        }

        public Criteria andProvideridIsNull() {
            addCriterion("providerId is null");
            return (Criteria) this;
        }

        public Criteria andProvideridIsNotNull() {
            addCriterion("providerId is not null");
            return (Criteria) this;
        }

        public Criteria andProvideridEqualTo(Integer value) {
            addCriterion("providerId =", value, "providerid");
            return (Criteria) this;
        }

        public Criteria andProvideridNotEqualTo(Integer value) {
            addCriterion("providerId <>", value, "providerid");
            return (Criteria) this;
        }

        public Criteria andProvideridGreaterThan(Integer value) {
            addCriterion("providerId >", value, "providerid");
            return (Criteria) this;
        }

        public Criteria andProvideridGreaterThanOrEqualTo(Integer value) {
            addCriterion("providerId >=", value, "providerid");
            return (Criteria) this;
        }

        public Criteria andProvideridLessThan(Integer value) {
            addCriterion("providerId <", value, "providerid");
            return (Criteria) this;
        }

        public Criteria andProvideridLessThanOrEqualTo(Integer value) {
            addCriterion("providerId <=", value, "providerid");
            return (Criteria) this;
        }

        public Criteria andProvideridIn(List<Integer> values) {
            addCriterion("providerId in", values, "providerid");
            return (Criteria) this;
        }

        public Criteria andProvideridNotIn(List<Integer> values) {
            addCriterion("providerId not in", values, "providerid");
            return (Criteria) this;
        }

        public Criteria andProvideridBetween(Integer value1, Integer value2) {
            addCriterion("providerId between", value1, value2, "providerid");
            return (Criteria) this;
        }

        public Criteria andProvideridNotBetween(Integer value1, Integer value2) {
            addCriterion("providerId not between", value1, value2, "providerid");
            return (Criteria) this;
        }

        public Criteria andIspaymentIsNull() {
            addCriterion("isPayment is null");
            return (Criteria) this;
        }

        public Criteria andIspaymentIsNotNull() {
            addCriterion("isPayment is not null");
            return (Criteria) this;
        }

        public Criteria andIspaymentEqualTo(Integer value) {
            addCriterion("isPayment =", value, "ispayment");
            return (Criteria) this;
        }

        public Criteria andIspaymentNotEqualTo(Integer value) {
            addCriterion("isPayment <>", value, "ispayment");
            return (Criteria) this;
        }

        public Criteria andIspaymentGreaterThan(Integer value) {
            addCriterion("isPayment >", value, "ispayment");
            return (Criteria) this;
        }

        public Criteria andIspaymentGreaterThanOrEqualTo(Integer value) {
            addCriterion("isPayment >=", value, "ispayment");
            return (Criteria) this;
        }

        public Criteria andIspaymentLessThan(Integer value) {
            addCriterion("isPayment <", value, "ispayment");
            return (Criteria) this;
        }

        public Criteria andIspaymentLessThanOrEqualTo(Integer value) {
            addCriterion("isPayment <=", value, "ispayment");
            return (Criteria) this;
        }

        public Criteria andIspaymentIn(List<Integer> values) {
            addCriterion("isPayment in", values, "ispayment");
            return (Criteria) this;
        }

        public Criteria andIspaymentNotIn(List<Integer> values) {
            addCriterion("isPayment not in", values, "ispayment");
            return (Criteria) this;
        }

        public Criteria andIspaymentBetween(Integer value1, Integer value2) {
            addCriterion("isPayment between", value1, value2, "ispayment");
            return (Criteria) this;
        }

        public Criteria andIspaymentNotBetween(Integer value1, Integer value2) {
            addCriterion("isPayment not between", value1, value2, "ispayment");
            return (Criteria) this;
        }
    }

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