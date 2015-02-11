package com.dost.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dost.hibernate.DbUser;
import com.dost.service.UserService;

// Adding more comments
@Controller
public class LoginController {

	@Autowired
	private UserService userService;

	@RequestMapping("user/conversations")
	public ModelAndView showMessage() {
		return new ModelAndView("user/conversations");
	}

	/**
	 * This API is for handling login and authentication for backbone UI
	 * I am planning to add a filter which will check if token is present in that HashMap
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/user/authenticate")
	@ResponseBody
	public Map<String, String> authenticateUser(HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		DbUser dbUser = userService.authenticateUser(username, password);

		Map<String, String> response = new HashMap<String, String>();
		response.put("username", username);
		if(dbUser != null) {
			UUID token = UUID.randomUUID();
			
			response.put("userId", dbUser.getUserId()+"");
			response.put("role", dbUser.getDbUserRole().getRole());
			response.put("token", token + "");
			response.put("isLoggedIn", "true");
			
			// Add this token in HashMap and add it in servletContext which can be used later to check if user has passed proper token 
			// and for blocking and logging user out user
			/*ServletContext servletContext = request.getServletContext();
			Object object = servletContext.getAttribute("userMap");
			Map<String, String> userMap;
			if(object != null) {
				userMap = (Map<String, String>)object;
			}
			else {
				userMap = new HashMap<String, String>();
			}
			userMap.put(token+"", dbUser.getUsername());
			servletContext.setAttribute("userMap", userMap);*/
		}
		else {
			response.put("token", "");
			response.put("isLoggedIn", "false");					
		}
		
		
		return response;
	}

	@RequestMapping(value = "/faq/add", method = RequestMethod.POST)
	@ResponseBody
	public void addUser(DbUser user) {
		userService.saveUser(user.getUsername(), user.getPassword(), user
				.getUserRole().toString());
	}

	// @RequestMapping(value="/welcome", method = RequestMethod.GET)
	// public String printWelcome(ModelMap model) {
	//
	// User user =
	// (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	// String name = user.getUsername();
	//
	// model.addAttribute("username", name);
	// model.addAttribute("message",
	// "Spring Security login + database example");
	// return "hello";
	//
	// }
	//
	// @RequestMapping(value="/login", method = RequestMethod.GET)
	// public String login(ModelMap model) {
	//
	// return "login";
	//
	// }
	//
	// @RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	// public String loginerror(ModelMap model) {
	//
	// model.addAttribute("error", "true");
	// return "login";
	//
	// }
	//
	// @RequestMapping(value="/logout", method = RequestMethod.GET)
	// public String logout(ModelMap model) {
	//
	// return "login";
	//
	// }

	@RequestMapping(value = { "/", "/user/welcome**" }, method = RequestMethod.GET)
	public String defaultPage(HttpServletRequest request) {
	System.out.println(request.getUserPrincipal().getName());
	HttpSession session = request.getSession();
	session.setAttribute("myAppUser", request.getUserPrincipal().getName());
	ModelAndView model = new ModelAndView();
	model.addObject("title",
	"Spring Security Login Form - Database Authentication");
	model.addObject("message", "This is default page!");

	if(request.isUserInRole("ROLE_ADMIN")){
			//return "redirect:/forums/show/1.page";
		return "redirect:/conversations";
	}
	else {
//			return "redirect:/forums/show/1.page";
		return "redirect:/conversations";
	}
	}

//	@RequestMapping(value = { "/", "/admin**" }, method = RequestMethod.GET)
//	public ModelAndView adminPage() {
//
//		ModelAndView model = new ModelAndView();
//		model.addObject("title",
//				"Spring Security Login Form - Database Authentication");
//		model.addObject("message", "This page is for ROLE_ADMIN only!");
//		model.setViewName("counselors/conversations");
//
//		return model;
//
//	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("login");

		return model;

	}

	// for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());

		}

		model.setViewName("403");
		return model;

	}

}