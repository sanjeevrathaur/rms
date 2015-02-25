package com.darkhorse.getsporty.web.controller;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.darkhorse.getsporty.domain.User;
import com.darkhorse.getsporty.domain.UserRole;
import com.darkhorse.getsporty.util.Utils;

/**
 * @author Sanjeev
 * 
 */
@RooWebJson(jsonObject = User.class)
@Controller
@RequestMapping("/users")
@RooWebScaffold(path = "users", formBackingObject = User.class)
public class UserController {

	@RequestMapping(method = RequestMethod.GET, value = "/create", produces = "text/html")
	public String createUser(Model uiModel) {
		User user = new User();
		List<UserRole> userRoles = userRoleSvc.findAllUserRoles();
		uiModel.addAttribute("userRoles", userRoles);
		uiModel.addAttribute("user", user);
		return "users/createUser";

	}

	@RequestMapping(value = "/create", method = RequestMethod.POST, produces = "text/html")
	public String saveUser(
			Model uiModel,
			User user,
			HttpServletRequest req,
			@RequestParam(value = "userRoless", required = false) BigInteger userRolesId) {
		if (Utils.isEmpty(user.getEmail())) {
			List<UserRole> userRoles = userRoleSvc.findAllUserRoles();
			uiModel.addAttribute("userRoles", userRoles);
			String message = "Email id is required. !!!";
			uiModel.addAttribute("message", message);
			return "users/createUser";

		}
		User usr = userSvc.findByEmail(user.getEmail());
		if (usr != null) {
			List<UserRole> userRoles = userRoleSvc.findAllUserRoles();
			uiModel.addAttribute("userRoles", userRoles);
			String message = "User with this email id already exits!!!";
			uiModel.addAttribute("message", message);
			return "users/createUser";
		}
		String pass = user.getPasswd();
		String encodedPassword = Utils.encodePassword(pass);
		user.setPasswd(encodedPassword);
		UserRole userRole = userRoleSvc.findUserRole(userRolesId);
		if (userRole != null) {
			List<UserRole> userRoles = new ArrayList<UserRole>();
			userRoles.add(userRole);
			user.setUserRoles(userRoles);
		}
		userSvc.saveUser(user);
		String message = "thanks !!!!";
		uiModel.addAttribute("users", userSvc.findAllUsers());
		uiModel.addAttribute("message", message);
		return "users/list";
	}

	@RequestMapping(value = "edit/{id}", params = "form", produces = "text/html")
	public String editUser(@PathVariable("id") BigInteger id, Model uiModel) {
		User user = userSvc.findUser(id);
		if (user == null) {
			user = new User();
		}
		List<UserRole> userRoles = userRoleSvc.findAllUserRoles();
		uiModel.addAttribute("userRoles", userRoles);
		uiModel.addAttribute("user", user);
		return "users/createUser";
	}

	@RequestMapping(value = "edit/{id}", params = "form", produces = "text/html", method = RequestMethod.POST)
	public String updateUser(
			@PathVariable("id") BigInteger id,
			Model uiModel,
			User user,
			@RequestParam(value = "userRoless", required = false) BigInteger userRolesId) {

		if (Utils.isEmpty(user.getEmail())) {
			List<UserRole> userRoles = userRoleSvc.findAllUserRoles();
			uiModel.addAttribute("userRoles", userRoles);
			String message = "Email id is required. !!!";
			uiModel.addAttribute("message", message);
			return "users/createUser";

		}
		User usr = userSvc.findUser(id);
		if (usr != null) {
			String pass = user.getPasswd();
			String encodedPassword = Utils.encodePassword(pass);
			user.setPasswd(encodedPassword);
			UserRole userRole = userRoleSvc.findUserRole(userRolesId);
			if (userRole != null) {
				List<UserRole> userRoles = new ArrayList<UserRole>();
				userRoles.add(userRole);
				user.setUserRoles(userRoles);
			}
			userSvc.updateUser(user);
		}
		List<UserRole> userRoles = userRoleSvc.findAllUserRoles();
		uiModel.addAttribute("userRoles", userRoles);
		uiModel.addAttribute("user", user);
		uiModel.addAttribute("users", userSvc.findAllUsers());
		return "users/list";
	}

}
