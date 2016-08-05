package chat.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletException;

import chat.ChatRoom;

import java.io.IOException;

public class InitializeChatServlet extends HttpServlet
{
	ChatRoom room = new ChatRoom("Default", "The only default Chatroom for test");
	
	public void init() throws ServletException
	{
		
		getServletContext().setAttribute("chatroom", room);		
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

	}
	

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}

	
}