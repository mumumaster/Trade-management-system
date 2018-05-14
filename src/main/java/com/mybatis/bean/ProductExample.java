package com.mybatis.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ProductExample() {
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

        public Criteria andProductidIsNull() {
            addCriterion("productId is null");
            return (Criteria) this;
        }

        public Criteria andProductidIsNotNull() {
            addCriterion("productId is not null");
            return (Criteria) this;
        }

        public Criteria andProductidEqualTo(String value) {
            addCriterion("productId =", value, "productid");
            return (Criteria) this;
        }

        public Criteria andProductidNotEqualTo(String value) {
            addCriterion("productId <>", value, "productid");
            return (Criteria) this;
        }

        public Criteria andProductidGreaterThan(String value) {
            addCriterion("productId >", value, "productid");
            return (Criteria) this;
        }

        public Criteria andProductidGreaterThanOrEqualTo(String value) {
            addCriterion("productId >=", value, "productid");
            return (Criteria) this;
        }

        public Criteria andProductidLessThan(String value) {
            addCriterion("productId <", value, "productid");
            return (Criteria) this;
        }

        public Criteria andProductidLessThanOrEqualTo(String value) {
            addCriterion("productId <=", value, "productid");
            return (Criteria) this;
        }

        public Criteria andProductidLike(String value) {
            addCriterion("productId like", value, "productid");
            return (Criteria) this;
        }

        public Criteria andProductidNotLike(String value) {
            addCriterion("productId not like", value, "productid");
            return (Criteria) this;
        }

        public Criteria andProductidIn(List<String> values) {
            addCriterion("productId in", values, "productid");
            return (Criteria) this;
        }

        public Criteria andProductidNotIn(List<String> values) {
            addCriterion("productId not in", values, "productid");
            return (Criteria) this;
        }

        public Criteria andProductidBetween(String value1, String value2) {
            addCriterion("productId between", value1, value2, "productid");
            return (Criteria) this;
        }

        public Criteria andProductidNotBetween(String value1, String value2) {
            addCriterion("productId not between", value1, value2, "productid");
            return (Criteria) this;
        }

        public Criteria andProductnameIsNull() {
            addCriterion("productName is null");
            return (Criteria) this;
        }

        public Criteria andProductnameIsNotNull() {
            addCriterion("productName is not null");
            return (Criteria) this;
        }

        public Criteria andProductnameEqualTo(String value) {
            addCriterion("productName =", value, "productname");
            return (Criteria) this;
        }

        public Criteria andProductnameNotEqualTo(String value) {
            addCriterion("productName <>", value, "productname");
            return (Criteria) this;
        }

        public Criteria andProductnameGreaterThan(String value) {
            addCriterion("productName >", value, "productname");
            return (Criteria) this;
        }

        public Criteria andProductnameGreaterThanOrEqualTo(String value) {
            addCriterion("productName >=", value, "productname");
            return (Criteria) this;
        }

        public Criteria andProductnameLessThan(String value) {
            addCriterion("productName <", value, "productname");
            return (Criteria) this;
        }

        public Criteria andProductnameLessThanOrEqualTo(String value) {
            addCriterion("productName <=", value, "productname");
            return (Criteria) this;
        }

        public Criteria andProductnameLike(String value) {
            addCriterion("productName like", value, "productname");
            return (Criteria) this;
        }

        public Criteria andProductnameNotLike(String value) {
            addCriterion("productName not like", value, "productname");
            return (Criteria) this;
        }

        public Criteria andProductnameIn(List<String> values) {
            addCriterion("productName in", values, "productname");
            return (Criteria) this;
        }

        public Criteria andProductnameNotIn(List<String> values) {
            addCriterion("productName not in", values, "productname");
            return (Criteria) this;
        }

        public Criteria andProductnameBetween(String value1, String value2) {
            addCriterion("productName between", value1, value2, "productname");
            return (Criteria) this;
        }

        public Criteria andProductnameNotBetween(String value1, String value2) {
            addCriterion("productName not between", value1, value2, "productname");
            return (Criteria) this;
        }

        public Criteria andProductdescIsNull() {
            addCriterion("productDesc is null");
            return (Criteria) this;
        }

        public Criteria andProductdescIsNotNull() {
            addCriterion("productDesc is not null");
            return (Criteria) this;
        }

        public Criteria andProductdescEqualTo(String value) {
            addCriterion("productDesc =", value, "productdesc");
            return (Criteria) this;
        }

        public Criteria andProductdescNotEqualTo(String value) {
            addCriterion("productDesc <>", value, "productdesc");
            return (Criteria) this;
        }

        public Criteria andProductdescGreaterThan(String value) {
            addCriterion("productDesc >", value, "productdesc");
            return (Criteria) this;
        }

        public Criteria andProductdescGreaterThanOrEqualTo(String value) {
            addCriterion("productDesc >=", value, "productdesc");
            return (Criteria) this;
        }

        public Criteria andProductdescLessThan(String value) {
            addCriterion("productDesc <", value, "productdesc");
            return (Criteria) this;
        }

        public Criteria andProductdescLessThanOrEqualTo(String value) {
            addCriterion("productDesc <=", value, "productdesc");
            return (Criteria) this;
        }

        public Criteria andProductdescLike(String value) {
            addCriterion("productDesc like", value, "productdesc");
            return (Criteria) this;
        }

        public Criteria andProductdescNotLike(String value) {
            addCriterion("productDesc not like", value, "productdesc");
            return (Criteria) this;
        }

        public Criteria andProductdescIn(List<String> values) {
            addCriterion("productDesc in", values, "productdesc");
            return (Criteria) this;
        }

        public Criteria andProductdescNotIn(List<String> values) {
            addCriterion("productDesc not in", values, "productdesc");
            return (Criteria) this;
        }

        public Criteria andProductdescBetween(String value1, String value2) {
            addCriterion("productDesc between", value1, value2, "productdesc");
            return (Criteria) this;
        }

        public Criteria andProductdescNotBetween(String value1, String value2) {
            addCriterion("productDesc not between", value1, value2, "productdesc");
            return (Criteria) this;
        }

        public Criteria andProductunitIsNull() {
            addCriterion("productUnit is null");
            return (Criteria) this;
        }

        public Criteria andProductunitIsNotNull() {
            addCriterion("productUnit is not null");
            return (Criteria) this;
        }

        public Criteria andProductunitEqualTo(String value) {
            addCriterion("productUnit =", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitNotEqualTo(String value) {
            addCriterion("productUnit <>", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitGreaterThan(String value) {
            addCriterion("productUnit >", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitGreaterThanOrEqualTo(String value) {
            addCriterion("productUnit >=", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitLessThan(String value) {
            addCriterion("productUnit <", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitLessThanOrEqualTo(String value) {
            addCriterion("productUnit <=", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitLike(String value) {
            addCriterion("productUnit like", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitNotLike(String value) {
            addCriterion("productUnit not like", value, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitIn(List<String> values) {
            addCriterion("productUnit in", values, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitNotIn(List<String> values) {
            addCriterion("productUnit not in", values, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitBetween(String value1, String value2) {
            addCriterion("productUnit between", value1, value2, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductunitNotBetween(String value1, String value2) {
            addCriterion("productUnit not between", value1, value2, "productunit");
            return (Criteria) this;
        }

        public Criteria andProductcountIsNull() {
            addCriterion("productCount is null");
            return (Criteria) this;
        }

        public Criteria andProductcountIsNotNull() {
            addCriterion("productCount is not null");
            return (Criteria) this;
        }

        public Criteria andProductcountEqualTo(Integer value) {
            addCriterion("productCount =", value, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountNotEqualTo(Integer value) {
            addCriterion("productCount <>", value, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountGreaterThan(Integer value) {
            addCriterion("productCount >", value, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountGreaterThanOrEqualTo(Integer value) {
            addCriterion("productCount >=", value, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountLessThan(Integer value) {
            addCriterion("productCount <", value, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountLessThanOrEqualTo(Integer value) {
            addCriterion("productCount <=", value, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountIn(List<Integer> values) {
            addCriterion("productCount in", values, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountNotIn(List<Integer> values) {
            addCriterion("productCount not in", values, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountBetween(Integer value1, Integer value2) {
            addCriterion("productCount between", value1, value2, "productcount");
            return (Criteria) this;
        }

        public Criteria andProductcountNotBetween(Integer value1, Integer value2) {
            addCriterion("productCount not between", value1, value2, "productcount");
            return (Criteria) this;
        }

        public Criteria andPriceIsNull() {
            addCriterion("price is null");
            return (Criteria) this;
        }

        public Criteria andPriceIsNotNull() {
            addCriterion("price is not null");
            return (Criteria) this;
        }

        public Criteria andPriceEqualTo(Float value) {
            addCriterion("price =", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotEqualTo(Float value) {
            addCriterion("price <>", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThan(Float value) {
            addCriterion("price >", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceGreaterThanOrEqualTo(Float value) {
            addCriterion("price >=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThan(Float value) {
            addCriterion("price <", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceLessThanOrEqualTo(Float value) {
            addCriterion("price <=", value, "price");
            return (Criteria) this;
        }

        public Criteria andPriceIn(List<Float> values) {
            addCriterion("price in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotIn(List<Float> values) {
            addCriterion("price not in", values, "price");
            return (Criteria) this;
        }

        public Criteria andPriceBetween(Float value1, Float value2) {
            addCriterion("price between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andPriceNotBetween(Float value1, Float value2) {
            addCriterion("price not between", value1, value2, "price");
            return (Criteria) this;
        }

        public Criteria andCreatedbyIsNull() {
            addCriterion("createdBy is null");
            return (Criteria) this;
        }

        public Criteria andCreatedbyIsNotNull() {
            addCriterion("createdBy is not null");
            return (Criteria) this;
        }

        public Criteria andCreatedbyEqualTo(Integer value) {
            addCriterion("createdBy =", value, "createdby");
            return (Criteria) this;
        }

        public Criteria andCreatedbyNotEqualTo(Integer value) {
            addCriterion("createdBy <>", value, "createdby");
            return (Criteria) this;
        }

        public Criteria andCreatedbyGreaterThan(Integer value) {
            addCriterion("createdBy >", value, "createdby");
            return (Criteria) this;
        }

        public Criteria andCreatedbyGreaterThanOrEqualTo(Integer value) {
            addCriterion("createdBy >=", value, "createdby");
            return (Criteria) this;
        }

        public Criteria andCreatedbyLessThan(Integer value) {
            addCriterion("createdBy <", value, "createdby");
            return (Criteria) this;
        }

        public Criteria andCreatedbyLessThanOrEqualTo(Integer value) {
            addCriterion("createdBy <=", value, "createdby");
            return (Criteria) this;
        }

        public Criteria andCreatedbyIn(List<Integer> values) {
            addCriterion("createdBy in", values, "createdby");
            return (Criteria) this;
        }

        public Criteria andCreatedbyNotIn(List<Integer> values) {
            addCriterion("createdBy not in", values, "createdby");
            return (Criteria) this;
        }

        public Criteria andCreatedbyBetween(Integer value1, Integer value2) {
            addCriterion("createdBy between", value1, value2, "createdby");
            return (Criteria) this;
        }

        public Criteria andCreatedbyNotBetween(Integer value1, Integer value2) {
            addCriterion("createdBy not between", value1, value2, "createdby");
            return (Criteria) this;
        }

        public Criteria andCreationdateIsNull() {
            addCriterion("creationDate is null");
            return (Criteria) this;
        }

        public Criteria andCreationdateIsNotNull() {
            addCriterion("creationDate is not null");
            return (Criteria) this;
        }

        public Criteria andCreationdateEqualTo(Date value) {
            addCriterion("creationDate =", value, "creationdate");
            return (Criteria) this;
        }

        public Criteria andCreationdateNotEqualTo(Date value) {
            addCriterion("creationDate <>", value, "creationdate");
            return (Criteria) this;
        }

        public Criteria andCreationdateGreaterThan(Date value) {
            addCriterion("creationDate >", value, "creationdate");
            return (Criteria) this;
        }

        public Criteria andCreationdateGreaterThanOrEqualTo(Date value) {
            addCriterion("creationDate >=", value, "creationdate");
            return (Criteria) this;
        }

        public Criteria andCreationdateLessThan(Date value) {
            addCriterion("creationDate <", value, "creationdate");
            return (Criteria) this;
        }

        public Criteria andCreationdateLessThanOrEqualTo(Date value) {
            addCriterion("creationDate <=", value, "creationdate");
            return (Criteria) this;
        }

        public Criteria andCreationdateIn(List<Date> values) {
            addCriterion("creationDate in", values, "creationdate");
            return (Criteria) this;
        }

        public Criteria andCreationdateNotIn(List<Date> values) {
            addCriterion("creationDate not in", values, "creationdate");
            return (Criteria) this;
        }

        public Criteria andCreationdateBetween(Date value1, Date value2) {
            addCriterion("creationDate between", value1, value2, "creationdate");
            return (Criteria) this;
        }

        public Criteria andCreationdateNotBetween(Date value1, Date value2) {
            addCriterion("creationDate not between", value1, value2, "creationdate");
            return (Criteria) this;
        }

        public Criteria andModifybyIsNull() {
            addCriterion("modifyBy is null");
            return (Criteria) this;
        }

        public Criteria andModifybyIsNotNull() {
            addCriterion("modifyBy is not null");
            return (Criteria) this;
        }

        public Criteria andModifybyEqualTo(Integer value) {
            addCriterion("modifyBy =", value, "modifyby");
            return (Criteria) this;
        }

        public Criteria andModifybyNotEqualTo(Integer value) {
            addCriterion("modifyBy <>", value, "modifyby");
            return (Criteria) this;
        }

        public Criteria andModifybyGreaterThan(Integer value) {
            addCriterion("modifyBy >", value, "modifyby");
            return (Criteria) this;
        }

        public Criteria andModifybyGreaterThanOrEqualTo(Integer value) {
            addCriterion("modifyBy >=", value, "modifyby");
            return (Criteria) this;
        }

        public Criteria andModifybyLessThan(Integer value) {
            addCriterion("modifyBy <", value, "modifyby");
            return (Criteria) this;
        }

        public Criteria andModifybyLessThanOrEqualTo(Integer value) {
            addCriterion("modifyBy <=", value, "modifyby");
            return (Criteria) this;
        }

        public Criteria andModifybyIn(List<Integer> values) {
            addCriterion("modifyBy in", values, "modifyby");
            return (Criteria) this;
        }

        public Criteria andModifybyNotIn(List<Integer> values) {
            addCriterion("modifyBy not in", values, "modifyby");
            return (Criteria) this;
        }

        public Criteria andModifybyBetween(Integer value1, Integer value2) {
            addCriterion("modifyBy between", value1, value2, "modifyby");
            return (Criteria) this;
        }

        public Criteria andModifybyNotBetween(Integer value1, Integer value2) {
            addCriterion("modifyBy not between", value1, value2, "modifyby");
            return (Criteria) this;
        }

        public Criteria andModifydateIsNull() {
            addCriterion("modifyDate is null");
            return (Criteria) this;
        }

        public Criteria andModifydateIsNotNull() {
            addCriterion("modifyDate is not null");
            return (Criteria) this;
        }

        public Criteria andModifydateEqualTo(Date value) {
            addCriterion("modifyDate =", value, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateNotEqualTo(Date value) {
            addCriterion("modifyDate <>", value, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateGreaterThan(Date value) {
            addCriterion("modifyDate >", value, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateGreaterThanOrEqualTo(Date value) {
            addCriterion("modifyDate >=", value, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateLessThan(Date value) {
            addCriterion("modifyDate <", value, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateLessThanOrEqualTo(Date value) {
            addCriterion("modifyDate <=", value, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateIn(List<Date> values) {
            addCriterion("modifyDate in", values, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateNotIn(List<Date> values) {
            addCriterion("modifyDate not in", values, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateBetween(Date value1, Date value2) {
            addCriterion("modifyDate between", value1, value2, "modifydate");
            return (Criteria) this;
        }

        public Criteria andModifydateNotBetween(Date value1, Date value2) {
            addCriterion("modifyDate not between", value1, value2, "modifydate");
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