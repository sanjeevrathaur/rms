// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.darkhorse.getsporty.web.controller;

import com.darkhorse.getsporty.domain.User;
import com.darkhorse.getsporty.domain.UserRole;
import com.darkhorse.getsporty.svc.UserRoleSvc;
import com.darkhorse.getsporty.svc.UserSvc;
import com.darkhorse.getsporty.web.controller.ApplicationConversionServiceFactoryBean;
import java.math.BigInteger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    @Autowired
    UserSvc ApplicationConversionServiceFactoryBean.userSvc;
    
    @Autowired
    UserRoleSvc ApplicationConversionServiceFactoryBean.userRoleSvc;
    
    public Converter<User, String> ApplicationConversionServiceFactoryBean.getUserToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.darkhorse.getsporty.domain.User, java.lang.String>() {
            public String convert(User user) {
                return new StringBuilder().append(user.getName()).append(" ").append(user.getEmail()).append(" ").append(user.getPasswd()).append(" ").append(user.getCreated()).toString();
            }
        };
    }
    
    public Converter<BigInteger, User> ApplicationConversionServiceFactoryBean.getIdToUserConverter() {
        return new org.springframework.core.convert.converter.Converter<java.math.BigInteger, com.darkhorse.getsporty.domain.User>() {
            public com.darkhorse.getsporty.domain.User convert(java.math.BigInteger id) {
                return userSvc.findUser(id);
            }
        };
    }
    
    public Converter<String, User> ApplicationConversionServiceFactoryBean.getStringToUserConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.darkhorse.getsporty.domain.User>() {
            public com.darkhorse.getsporty.domain.User convert(String id) {
                return getObject().convert(getObject().convert(id, BigInteger.class), User.class);
            }
        };
    }
    
    public Converter<UserRole, String> ApplicationConversionServiceFactoryBean.getUserRoleToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.darkhorse.getsporty.domain.UserRole, java.lang.String>() {
            public String convert(UserRole userRole) {
                return new StringBuilder().append(userRole.getCode()).append(" ").append(userRole.getDescription()).toString();
            }
        };
    }
    
    public Converter<BigInteger, UserRole> ApplicationConversionServiceFactoryBean.getIdToUserRoleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.math.BigInteger, com.darkhorse.getsporty.domain.UserRole>() {
            public com.darkhorse.getsporty.domain.UserRole convert(java.math.BigInteger id) {
                return userRoleSvc.findUserRole(id);
            }
        };
    }
    
    public Converter<String, UserRole> ApplicationConversionServiceFactoryBean.getStringToUserRoleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.darkhorse.getsporty.domain.UserRole>() {
            public com.darkhorse.getsporty.domain.UserRole convert(String id) {
                return getObject().convert(getObject().convert(id, BigInteger.class), UserRole.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getUserToStringConverter());
        registry.addConverter(getIdToUserConverter());
        registry.addConverter(getStringToUserConverter());
        registry.addConverter(getUserRoleToStringConverter());
        registry.addConverter(getIdToUserRoleConverter());
        registry.addConverter(getStringToUserRoleConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
