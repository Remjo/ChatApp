package chat.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chat.ChatRoom;
import chat.Chatter;
import chat.Message;

public class LoginServlet extends HttpServlet {
	
	

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String contextPath = request.getContextPath();
		response.sendRedirect(contextPath + "/login.jsp");		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String contextPath = request.getContextPath();
		String username = request.getParameter("username");
		HttpSession session = request.getSession(true);
		
		//System.out.println("Remjo pos 1 = " + username);
		
		session.setAttribute("username", username);
		
		ChatRoom chatRoom = (ChatRoom) getServletContext().getAttribute("chatroom"); 
		Chatter chatter = new Chatter(username,  new java.util.Date().getTime());
		chatRoom.addChatter(chatter);
		chatRoom.addMessage(new Message("system", username + " has joined.", new java.util.Date().getTime()));
		chatter.setEnteredInRoomAt(new java.util.Date().getTime());
		response.sendRedirect(contextPath + "/displayChatMessages.jsp");
		
	}
	

}
