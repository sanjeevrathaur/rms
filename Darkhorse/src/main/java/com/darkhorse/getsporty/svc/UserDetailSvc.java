/**   
 * 
 */
package com.darkhorse.getsporty.svc;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.darkhorse.getsporty.domain.User;
import com.darkhorse.getsporty.domain.UserRole;

public class UserDetailSvc implements UserDetailsService {

	@Autowired
	private UserSvc userSvc;

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {

		List<GrantedAuthority> authList = new ArrayList<GrantedAuthority>();
		User usr = userSvc.findByEmail(username.toLowerCase());

		if (usr == null) {
			throw new UsernameNotFoundException("User not found or activated.");
		} else if (usr.getIsEnabled() == false) {
			throw new UsernameNotFoundException("User not activated.");
		}
		
		org.springframework.security.core.userdetails.User user = null;
		try {
			List<UserRole> userRoles = usr.getUserRoles();
			List<String> roleCodes = new ArrayList<String>();
			if (userRoles != null && !userRoles.isEmpty()) {
				for (UserRole userRole : userRoles) {
					authList.add(new SimpleGrantedAuthority(userRole.getCode()));
					roleCodes.add(userRole.getCode());
				}
			}
			user = new org.springframework.security.core.userdetails.User(usr.getName(), usr.getPasswd(), usr.getIsEnabled(), true, true, true, authList);


		} catch (RuntimeException e) {
			e.printStackTrace();
			throw e;
		}
		return user;
	}
}