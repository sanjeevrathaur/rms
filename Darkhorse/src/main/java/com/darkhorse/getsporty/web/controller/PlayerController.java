package com.darkhorse.getsporty.web.controller;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.darkhorse.getsporty.domain.Contact;
import com.darkhorse.getsporty.domain.Player;
import com.darkhorse.getsporty.domain.Player.PlayerLevel;
import com.darkhorse.getsporty.domain.User;
import com.darkhorse.getsporty.domain.UserRole;
import com.darkhorse.getsporty.svc.UserRoleSvc;
import com.darkhorse.getsporty.util.Utils;

/**
 * @author sanjeev
 *
 */
@RequestMapping("/players")
@Controller
@RooWebScaffold(path = "players", formBackingObject = Player.class)
public class PlayerController {

	@Autowired
	private UserRoleSvc userRoleSvc;

	@RequestMapping(method = RequestMethod.GET, value = "/createPlayer", produces = "text/html")
	public String createPlayer(Model uiModel) {

		Player player = new Player();
		uiModel.addAttribute("playerLevels", PlayerLevel.values());
		uiModel.addAttribute("player", player);
		return "players/createPlayer";

	}

	@RequestMapping(value = "/createPlayer", method = RequestMethod.POST, produces = "text/html")
	public String saveProductDetail(Model uiModel, Player player, HttpServletRequest req,
			@RequestParam(value = "enable", required = false) boolean enable) {

		User user = null;
		if (!Utils.isEmailValid(player.getUser().getEmail())) {
			uiModel.addAttribute("err", "Please enter valid email id. !!!");
			uiModel.addAttribute("player", player);
			uiModel.addAttribute("playerLevels", PlayerLevel.values());
			return "players/createPlayer";
		}
		user = userSvc.findByEmail(player.getUser().getEmail());
		if (user != null) {
			uiModel.addAttribute("err", "Player with this email id already exists !!!");
			uiModel.addAttribute("player", player);
			uiModel.addAttribute("playerLevels", PlayerLevel.values());
			return "players/createPlayer";

		}
		user = player.getUser();
		String encodedPassword = Utils.encodePassword(user.getPasswd());
		user.setPasswd(encodedPassword);
		user.setIsEnabled(enable);
		UserRole userRole = userRoleSvc.findByCode("Player");
		if (userRole == null) {
			uiModel.addAttribute("err", "There is no player Role Available !!!");
			uiModel.addAttribute("player", player);
			uiModel.addAttribute("playerLevels", PlayerLevel.values());
			return "players/createPlayer";
		}
		Contact contact = player.getContact();
		List<UserRole> userRoles = new ArrayList<UserRole>();
		userRoles.add(userRole);
		user.setUserRoles(userRoles);
		user.setIsEnabled(true);
		userSvc.saveUser(user);
		player.setUser(user);
		if (contact != null) {
			player.setContact(contact);
		}
		
		playerSvc.savePlayer(player);
		String message = "New Player added successfuly !!!";
		
		return "redirect:/players/listPlayers?message=" + message;
	}

	@RequestMapping(method = RequestMethod.GET, value = "/listPlayers", produces = "text/html")
	public String listPlayers(Model uiModel,
			@RequestParam(value = "success", required = false) String success) {

		if (!Utils.isEmpty(success)) {
			uiModel.addAttribute("success", success);
		}
		List<Player> players = playerSvc.findAllPlayers();
		uiModel.addAttribute("players", players);
		return "players/listPlayers";

	}
	
    @RequestMapping(value = "edit/{id}", params = "form", produces = "text/html")
    public String editPlayer(@PathVariable("id") BigInteger id, Model uiModel) {
    	Player player = playerSvc.findPlayer(id);
    	if(player == null){
    		player = new Player();
    	}
		uiModel.addAttribute("playerLevels", PlayerLevel.values());
		uiModel.addAttribute("player", player);
		uiModel.addAttribute("update", true);
		return "players/createPlayer";
    }


    @RequestMapping(value = "edit/{id}", params = "form", produces = "text/html", method = RequestMethod.POST)
    public String updatePlayer(@PathVariable("id") BigInteger id, Model uiModel, Player player) {

    	if(player != null){
    		User user = null;
    		if (!Utils.isEmailValid(player.getUser().getEmail())) {
    			uiModel.addAttribute("err", "Please enter valid email id. !!!");
    			uiModel.addAttribute("player", player);
    			uiModel.addAttribute("playerLevels", PlayerLevel.values());
    			return "players/createPlayer";
    		}
    		user = userSvc.findByEmail(player.getUser().getEmail());
    		
    		user = player.getUser();
    		String encodedPassword = Utils.encodePassword(user.getPasswd());
    		user.setPasswd(encodedPassword);
    		user.setIsEnabled(true);
    		UserRole userRole = userRoleSvc.findByCode("Player");
    		if (userRole == null) {
    			uiModel.addAttribute("err", "There is no player Role Available !!!");
    			uiModel.addAttribute("player", player);
    			uiModel.addAttribute("playerLevels", PlayerLevel.values());
    			return "players/createPlayer";
    		}
    		Contact contact = player.getContact();
    		List<UserRole> userRoles = new ArrayList<UserRole>();
    		userRoles.add(userRole);
    		user.setUserRoles(userRoles);
    		user.setIsEnabled(true);
    		userSvc.updateUser(user);
    		player.setUser(user);
    		if (contact != null) {
    			player.setContact(contact);
    		}
    		
    		playerSvc.updatePlayer(player);
    		String success = "Player details are updated successfuly !!!";
    		
    		return "redirect:/players/listPlayers?success=" + success;
    	}else{
			uiModel.addAttribute("err", "Wrong details are entered !!!");
			uiModel.addAttribute("player", player);
			uiModel.addAttribute("playerLevels", PlayerLevel.values());
			return "players/createPlayer";

    	}
    	
    	
    	
    }

	
}
