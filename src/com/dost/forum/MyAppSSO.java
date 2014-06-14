package com.dost.forum;

import net.jforum.context.RequestContext;
import net.jforum.entities.UserSession;
import net.jforum.sso.SSO;

public class MyAppSSO implements SSO {

	public String authenticateUser(RequestContext request) {
		String user = (String)request.getSessionContext().getAttribute("myAppUser");
		return user;
	}

	public boolean isSessionValid(UserSession userSession,
			RequestContext request) {
		if(request.getSessionContext().getAttribute("myAppUser") != null)
		{
			return true;
		}else{
			return false;
		}
	}
}
