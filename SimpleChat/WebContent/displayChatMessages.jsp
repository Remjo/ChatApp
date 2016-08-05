
<%@ page isErrorPage="false" errorPage="/jsp/error.jsp" import="java.util.Set,java.util.Iterator,java.util.Map,java.util.Date,java.text.DateFormat,chat.*"%>
<%
	String roonName = null;
	String username = (String)session.getAttribute("username");
	
	ChatRoom chatRoom = null;
	Chatter chatter = null;
	Message[] messages = null;

	if (username != null)
	{
		try
		{
			
			chatRoom = (ChatRoom) application.getAttribute("chatroom");
			roonName = chatRoom.getName();
			chatter = chatRoom.getChatter(username);
			
			if (chatRoom != null)
			{
				long enteredAt = chatter.getEnteredInRoomAt();
				if (enteredAt != -1)
				{
					messages = chatRoom.getMessages(enteredAt);					
				}
				else
				{
					messages = chatRoom.getMessages(chatter.getLoginTime());
				}

			}
			
		}
		catch(Exception e)
		{
			System.out.println("Exception: "+ e.getMessage());
			throw new ServletException("Unable to get handle to ServletContext");
		}	
	
%>
<HTML>
<HEAD>

<link rel="stylesheet" type="text/css" href="chat.css">
<%
	int refreshAfter = 10000; // 10 seconds
	
%>
<script language="JavaScript" type="text/javascript">
<!--
function reload()
{
	window.location.reload();
}

setInterval('reload()', <%=refreshAfter%>);

function winopen(path)
{
	chatinfo = window.open(path,"Chat Window","scrollbars=no,resizable=yes, width=400, height=300, location=no, toolbar=no, status=no");
	chatinfo.focus();
}
//-->
</script>
</HEAD>
<BODY onLoad="window.location.hash='#current'" bgcolor="#FFFFFF">

<table width="100%" border="0">
<tr>
<td width="70%" valign="top">

<div align="center">
<center>
<table width="100%" border="0">	
	<tr>
		<td width="100%" class="title">Simple Chat</td>
	</tr>
</table>
</center>
</div>
<br>

<table>
<tr>
<td>
<h3><i><%=(String)session.getAttribute("username")%></i> you are in <b><%=roonName%></b> room </h3>
<%
	
	if(messages != null && messages.length > 0)
	{
		for (int i = 0; i < messages.length; i++)
		{
			Message message = (Message)messages[i];
			String chatterName = message.getChatterName();
			String strmsg = message.getMessage();
			long time = message.getTimeStamp();
			Date date = new Date(time);

			if (chatterName.equalsIgnoreCase((String)session.getAttribute("username")))
			{
				out.write("<font face=\"Arial\" size=\"2\" color=\"blue\"><b>" + chatterName + " ("+ DateFormat.getTimeInstance().format(date)+ ")&gt;</b></font> " + strmsg+"<br>\n");
			}
			else if (chatterName.equalsIgnoreCase("system"))
			{
				out.write("<span class=\"error\">" + strmsg+"</span><br>\n");
			}
			else
			{
				out.write("<font face=\"Arial\" size=\"2\"><b>"+chatterName + " ("+ DateFormat.getTimeInstance().format(date)+ ")&gt;</b></font> " + strmsg + "<br>\n");
			}			
		}
		out.write("<a name=\"current\"></a>");
	}
	else
	{
		out.write("<font color=\"red\" face=\"Arial\" size=\"2\">There are currently no messages in this room</font>");
	}
	out.write("<a name=\"current\"></a>");
	%>
</td>
</tr>
</table>
	</td>
	<td width="30%" valign="top">
	<table width="100%" border="1" cellpadding="2" cellspacing="0">
		<tr>
			<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#2C259C">
		<tr>
			<td>
	<span class="white"><%=chatRoom.getNoOfChatters()%> people in this room</span><br>
	</td>
	</tr>
	</table>
	<%
	Chatter[] chatters = chatRoom.getChattersArray();
	for(int i = 0; i < chatters.length; i++)
	{
		if (chatters[i].getName().equals(session.getAttribute("nickname")))
		{
	%>
	<font face="Arial" size="2" color="blue"><%=chatters[i].getName()  + "<br>"%></font>
	<%
		}
		else
		{
			//out.write("<font face=\"Arial\" size=\"2\"><a href=\"javascript:winopen('/SimpleChat/viewinfo.jsp?username="+chatters[i].getName() + "')\" title=\"View information about "+chatters[i].getName()+"\">"+ chatters[i].getName()+"</a> </font><br>");
			out.write("<font face=\"Arial\" size=\"2\"><a>"+ chatters[i].getName()+"</a> </font><br>");
		}
	}

}
else
{
	response.sendRedirect("login.jsp");
}
%>
		</td>
	</tr>
</table>
</td>
</tr>
</table>




<TABLE width="100%" cellpadding="3" cellspacing="0">
	<TR> 
		<TD width="50%" align="left" valign="top"> 
			<TABLE>
				<TR> 
					<FORM name="msg" action="sendMessage.jsp" method="post">
						<TD width="100%"> 
							<INPUT type="text" name="messagebox" maxlength="300" size="35">
							<INPUT type="hidden" name="username" value="<%=session.getAttribute("username")%>">
							<INPUT name="submit" type="submit" value="Send">
						</TD>
					</FORM>
				</TR>
			</TABLE>
		</TD>

	</TR>
</TABLE>


</BODY>
</HTML>