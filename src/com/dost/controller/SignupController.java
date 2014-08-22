package com.dost.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dost.hibernate.DbMessage;
import com.dost.hibernate.DbMessageRecipient;
import com.dost.hibernate.DbUser;
import com.dost.hibernate.DbUserRole;
import com.dost.model.Message;
import com.dost.model.User;
import com.dost.service.MessageService;
import com.dost.service.SignupService;
import com.dost.service.UserService;

@Controller
@RequestMapping("api")
public class SignupController {

	@Autowired
	SignupService signupService;
	
	@Autowired
	UserService userService;
	
	// This is for creating welcome message for new user
	@Autowired
	MessageService messageService;
	
	@Autowired @Qualifier("authMgr") 
	private AuthenticationManager authMgr;
	
	@RequestMapping(value="/su/{id}", method=RequestMethod.GET)  
	@ResponseBody
	public void signup1(@PathVariable Long id) {
		System.out.println("test id : " + id);

	}
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)  
	public String signup(HttpServletRequest request) {
		
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(request.getParameter("password"));
		user.setAvatarId(request.getParameter("avatarinput"));
		Map<String, Boolean> output = new HashMap<String, Boolean>();
		if(user.getUsername() == null) {
			output.put("status", false);
			return "signupNow"; 
		}
		DbUser existingUser = userService.getUserByUsername(user.getUsername());
		// User does not exists
		if(existingUser == null) {
			DbUser newUser = populateDbUser(user);	
			signupService.signupUser(newUser);
			output.put("status", true);
			Message welcomeMessage = createWelcomeMessage(newUser.getUserId()+"");
			messageService.sendMessage(populateDbMessage(welcomeMessage));
			//return new ModelAndView("index");
			
			UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword());
			token.setDetails(new WebAuthenticationDetails(request));
			//authMgr.authenticate(auth);
			Authentication authentication = authMgr.authenticate(token);
		      // redirect into secured main page if authentication successful
		  if(authentication.isAuthenticated()) {
		    SecurityContextHolder.getContext().setAuthentication(authentication);
		    return "redirect:/conversations";
		  }
		}
		// User already exists with same username
		else {
			output.put("status", false);
			return "signupNow"; 
		}
		return "redirect:/conversations";
	}

	private DbUser populateDbUser(User user) {
		DbUser dbUser = new DbUser();
		dbUser.setUsername(user.getUsername());
		dbUser.setPassword(user.getPassword());
		dbUser.setDeleted("0");
		dbUser.setEnabled(1);
		dbUser.setAvatar(user.getAvatarId());
		
		DbUserRole userRole = new DbUserRole();
		userRole.setUsername(user.getUsername());
		userRole.setRole("ROLE_USER");
		userRole.setDbUser(dbUser);
		
		dbUser.setDbUserRole(userRole);
		return dbUser;
	}
	
	/**
	 * All this and below is for welcome message
	 * @param recipient
	 * @return
	 */
	private Message createWelcomeMessage(String recipient) {
		Message welcomeMessage = new Message();
		welcomeMessage.setContent("Welcome to your Dost.");
		welcomeMessage.setImportant(0l);
		welcomeMessage.setRecipients(recipient);
		// Trigger populates sent date
		// welcomeMessage.setSentDate(new Date());
		//welcomeMessage.setSenderId(Long.parseLong(Utils.getDostConfig("dostadmin.userid")));
		welcomeMessage.setSubject("Welcome to your Dost.");
		return welcomeMessage;
	}
	
	private DbMessage populateDbMessage(Message message) {
		
		DbMessage dbMessage = new DbMessage();
		dbMessage.setContent(message.getContent());
		dbMessage.setSubject(message.getSubject());
		dbMessage.setImportant(message.getImportant() != null ? 0l : 1l);
		// Hibernate will set this
		//dbMessage.setMessageId(messageId)
		if(message.getMsgId() != null) {
			dbMessage.setMsgId(message.getMsgId());
		}
		// If msgId is null then create new..Using bad way of doing it for now
		else {
			Long maxMsgId = messageService.getMaxMsgId();
			dbMessage.setMsgId(maxMsgId + 1);
		}
		dbMessage.setRecipients(createRecipientList(message, dbMessage));
		if(message.getSenderId() == null) {
			message.setSenderId(102l);
		}
		dbMessage.setSender(userService.getUser(message.getSenderId()));
		dbMessage.setSentDateDb(new Date());
		return dbMessage;
	}
	
	private List<DbMessageRecipient> createRecipientList(Message message, DbMessage dbMessage) {
		List<DbMessageRecipient> lists = new ArrayList<DbMessageRecipient>();
		String recipientIds = message.getRecipients();
		String[] recipientArray = null;
		if(!recipientIds.equals("all")){
			recipientArray = recipientIds.split(",");	
		}
		// If UI didnt send the recipient id then get list of available couselors
		else {
			List<DbUser> counselors = userService.getAllCounselors();
			recipientArray = new String[counselors.size()];
			for(int i = 0; i < counselors.size(); i++) {
				recipientArray[i] = ""+counselors.get(i).getUserId();
			}
		}
		for(String userId : recipientArray) {
			DbMessageRecipient dbMessageRecipient = new DbMessageRecipient();
			// Hibernate will put this
			//dbMessageRecipient.setMessageRecipientId(messageRecipientId);
			dbMessageRecipient.setDeleted("0");
			dbMessageRecipient.setMessage(dbMessage);
			DbUser recipient = userService.getUser(Long.parseLong(userId));
			dbMessageRecipient.setRecipient(recipient);
			dbMessageRecipient.setViewed(0l);
			lists.add(dbMessageRecipient);
		}
		return lists;
	}
}
