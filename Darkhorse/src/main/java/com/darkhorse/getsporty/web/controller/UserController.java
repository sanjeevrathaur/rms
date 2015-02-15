package com.darkhorse.getsporty.web.controller;

import java.math.BigInteger;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.darkhorse.getsporty.domain.User;
import com.darkhorse.getsporty.domain.UserRole;

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
	public String saveUser(Model uiModel, User user, HttpServletRequest req) {
		userSvc.saveUser(user);
		String message = "thanks !!!!";
		uiModel.addAttribute("users", userSvc.findAllUsers());
		uiModel.addAttribute("message", message);
		 return "users/list";
	}
	
    @RequestMapping(value = "edit/{id}", params = "form", produces = "text/html")
    public String updateUser(@PathVariable("id") BigInteger id, Model uiModel) {
    	User user = userSvc.findUser(id);
    	if(user == null){
    		user = new User();
    	}
		List<UserRole> userRoles = userRoleSvc.findAllUserRoles();
		uiModel.addAttribute("userRoles", userRoles);
    	uiModel.addAttribute("user", user);
        return "users/createUser";
    }

	
}
