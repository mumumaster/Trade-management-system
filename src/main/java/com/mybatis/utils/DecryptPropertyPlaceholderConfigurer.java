package com.mybatis.utils;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

public class DecryptPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer{
	@Override  
    protected String convertProperty(String propertyName,String propertyValue){  
        String value = DES3LEncrypt.decrypt(propertyValue);//调用解密方法  
        value =  value.substring(value.indexOf(':')+1);
        return value;
    }
}
