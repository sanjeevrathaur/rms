// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.darkhorse.getsporty.domain;

import com.darkhorse.getsporty.domain.User;
import com.darkhorse.getsporty.domain.UserRole;
import java.util.Date;
import java.util.Set;

privileged aspect User_Roo_JavaBean {
    
    public String User.getName() {
        return this.name;
    }
    
    public void User.setName(String name) {
        this.name = name;
    }
    
    public String User.getEmail() {
        return this.email;
    }
    
    public void User.setEmail(String email) {
        this.email = email;
    }
    
    public String User.getPasswd() {
        return this.passwd;
    }
    
    public void User.setPasswd(String passwd) {
        this.passwd = passwd;
    }
    
    public Boolean User.getIsEnabled() {
        return this.isEnabled;
    }
    
    public void User.setIsEnabled(Boolean isEnabled) {
        this.isEnabled = isEnabled;
    }
    
    public Date User.getCreated() {
        return this.created;
    }
    
    public void User.setCreated(Date created) {
        this.created = created;
    }
    
    public Set<UserRole> User.getUserRoles() {
        return this.userRoles;
    }
    
    public void User.setUserRoles(Set<UserRole> userRoles) {
        this.userRoles = userRoles;
    }
    
}
