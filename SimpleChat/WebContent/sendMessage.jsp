<%@ page isErrorPage="false" errorPage="error.jsp" import="java.util.Set,java.util.Iterator,java.util.Map,chat.*"%>
<% 
	
	String username = (String)session.getAttribute("username");
	
	if (username != null && username.length() > 0)
	{
		
		ChatRoom chatRoom = (ChatRoom)application.getAttribute("chatroom");
		if ( chatRoom != null)
		{
			String msg = request.getParameter("messagebox");
			
			if ( msg != null && msg.length() > 0)
			{
				msg = msg.trim();
				chatRoom.addMessage(new Message(username, msg, new java.util.Date().getTime()));
			}
			
			response.sendRedirect("displayChatMessages.jsp");
	
		}
		else
		{
			out.write("<h2 class=\"error\">Your room couldn't be found. You can't send message</h2>");
		}
	}
	else
	{
		response.sendRedirect("login.jsp");
	}
%>
