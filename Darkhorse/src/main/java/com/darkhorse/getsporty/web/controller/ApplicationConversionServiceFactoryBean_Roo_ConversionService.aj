// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.darkhorse.getsporty.web.controller;

import com.darkhorse.getsporty.domain.Academy;
import com.darkhorse.getsporty.domain.Coach;
import com.darkhorse.getsporty.domain.Player;
import com.darkhorse.getsporty.domain.User;
import com.darkhorse.getsporty.domain.UserRole;
import com.darkhorse.getsporty.svc.UserRoleSvc;
import com.darkhorse.getsporty.svc.UserSvc;
import com.darkhorse.getsporty.svc.academy.AcademySvc;
import com.darkhorse.getsporty.svc.coach.CoachSvc;
import com.darkhorse.getsporty.svc.player.PlayerSvc;
import com.darkhorse.getsporty.web.controller.ApplicationConversionServiceFactoryBean;
import java.math.BigInteger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    @Autowired
    AcademySvc ApplicationConversionServiceFactoryBean.academySvc;
    
    @Autowired
    CoachSvc ApplicationConversionServiceFactoryBean.coachSvc;
    
    @Autowired
    PlayerSvc ApplicationConversionServiceFactoryBean.playerSvc;
    
    @Autowired
    UserSvc ApplicationConversionServiceFactoryBean.userSvc;
    
    @Autowired
    UserRoleSvc ApplicationConversionServiceFactoryBean.userRoleSvc;
    
    public Converter<Academy, String> ApplicationConversionServiceFactoryBean.getAcademyToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.darkhorse.getsporty.domain.Academy, java.lang.String>() {
            public String convert(Academy academy) {
                return new StringBuilder().toString();
            }
        };
    }
    
    public Converter<BigInteger, Academy> ApplicationConversionServiceFactoryBean.getIdToAcademyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.math.BigInteger, com.darkhorse.getsporty.domain.Academy>() {
            public com.darkhorse.getsporty.domain.Academy convert(java.math.BigInteger id) {
                return academySvc.findAcademy(id);
            }
        };
    }
    
    public Converter<String, Academy> ApplicationConversionServiceFactoryBean.getStringToAcademyConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.darkhorse.getsporty.domain.Academy>() {
            public com.darkhorse.getsporty.domain.Academy convert(String id) {
                return getObject().convert(getObject().convert(id, BigInteger.class), Academy.class);
            }
        };
    }
    
    public Converter<Coach, String> ApplicationConversionServiceFactoryBean.getCoachToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.darkhorse.getsporty.domain.Coach, java.lang.String>() {
            public String convert(Coach coach) {
                return new StringBuilder().append(coach.getDOB()).append(" ").append(coach.getPlayerLevel()).toString();
            }
        };
    }
    
    public Converter<BigInteger, Coach> ApplicationConversionServiceFactoryBean.getIdToCoachConverter() {
        return new org.springframework.core.convert.converter.Converter<java.math.BigInteger, com.darkhorse.getsporty.domain.Coach>() {
            public com.darkhorse.getsporty.domain.Coach convert(java.math.BigInteger id) {
                return coachSvc.findCoach(id);
            }
        };
    }
    
    public Converter<String, Coach> ApplicationConversionServiceFactoryBean.getStringToCoachConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.darkhorse.getsporty.domain.Coach>() {
            public com.darkhorse.getsporty.domain.Coach convert(String id) {
                return getObject().convert(getObject().convert(id, BigInteger.class), Coach.class);
            }
        };
    }
    
    public Converter<Player, String> ApplicationConversionServiceFactoryBean.getPlayerToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.darkhorse.getsporty.domain.Player, java.lang.String>() {
            public String convert(Player player) {
                return new StringBuilder().append(player.getDOB()).append(" ").append(player.getPlayerLevel()).toString();
            }
        };
    }
    
    public Converter<BigInteger, Player> ApplicationConversionServiceFactoryBean.getIdToPlayerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.math.BigInteger, com.darkhorse.getsporty.domain.Player>() {
            public com.darkhorse.getsporty.domain.Player convert(java.math.BigInteger id) {
                return playerSvc.findPlayer(id);
            }
        };
    }
    
    public Converter<String, Player> ApplicationConversionServiceFactoryBean.getStringToPlayerConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.darkhorse.getsporty.domain.Player>() {
            public com.darkhorse.getsporty.domain.Player convert(String id) {
                return getObject().convert(getObject().convert(id, BigInteger.class), Player.class);
            }
        };
    }
    
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
        registry.addConverter(getAcademyToStringConverter());
        registry.addConverter(getIdToAcademyConverter());
        registry.addConverter(getStringToAcademyConverter());
        registry.addConverter(getCoachToStringConverter());
        registry.addConverter(getIdToCoachConverter());
        registry.addConverter(getStringToCoachConverter());
        registry.addConverter(getPlayerToStringConverter());
        registry.addConverter(getIdToPlayerConverter());
        registry.addConverter(getStringToPlayerConverter());
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
