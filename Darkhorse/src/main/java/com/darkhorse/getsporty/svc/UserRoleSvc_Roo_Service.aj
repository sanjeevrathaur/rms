// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.darkhorse.getsporty.svc;

import com.darkhorse.getsporty.domain.UserRole;
import com.darkhorse.getsporty.svc.UserRoleSvc;
import java.math.BigInteger;
import java.util.List;

privileged aspect UserRoleSvc_Roo_Service {
    
    public abstract long UserRoleSvc.countAllUserRoles();    
    public abstract void UserRoleSvc.deleteUserRole(UserRole userRole);    
    public abstract UserRole UserRoleSvc.findUserRole(BigInteger id);    
    public abstract List<UserRole> UserRoleSvc.findAllUserRoles();    
    public abstract List<UserRole> UserRoleSvc.findUserRoleEntries(int firstResult, int maxResults);    
    public abstract void UserRoleSvc.saveUserRole(UserRole userRole);    
    public abstract UserRole UserRoleSvc.updateUserRole(UserRole userRole);    
}
