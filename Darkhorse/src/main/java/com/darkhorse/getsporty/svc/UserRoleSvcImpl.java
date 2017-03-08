package com.darkhorse.getsporty.svc;

import com.darkhorse.getsporty.domain.UserRole;

/** test comments */
public class UserRoleSvcImpl implements UserRoleSvc {
	
	/** find user role by role code*/
	public UserRole findByCode(String code){
		return userRoleDao.findByCode(code);
		
	}
	
}
