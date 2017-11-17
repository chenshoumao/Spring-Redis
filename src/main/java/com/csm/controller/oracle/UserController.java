package com.csm.controller.oracle;

import java.util.List;

 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csm.entity.User;
import com.csm.service.UserServiceImpl;
 
 

@Controller
@RequestMapping("/user/")
public class UserController {
	
	@Autowired
	private UserServiceImpl userService;

	@RequestMapping(value = "findAll", method = RequestMethod.GET)
	@ResponseBody
	public List findAll(Model model) {
		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		return users;
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(User user, Model model) {
		int id = userService.add(user);
		model.addAttribute("id", id);
		return "user";
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(User user, Model model) {
		userService.update(user);
		model.addAttribute("updateFlag", true);
		return "user";
	}
}
