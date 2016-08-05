<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<LINK rel="stylesheet" href="<%=request.getContextPath()%>/chat.css">
<title>Simple Chat</title>
</head>
<body>

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

 <TABLE width="50%" border="0" cellspacing="1" cellpadding="1" align="center">

<tr>

<td>
<FORM name="login" method="post" action="<%=request.getContextPath()%>/chat/login">
            <TABLE width="100%" border="0">
              <TR>
                <TD width="30%" class="white">
                  Username
                </TD>
                <TD width="70%">
                  <INPUT type="text" name="username" size="15">
                </TD>
              </TR>
 
              <TR>
                <TD>
                 &nbsp;  
                </TD>
                <TD>
                  <INPUT type="submit" name="Submit" value="Submit">
                </TD>
              </TR>
            </TABLE>
          </FORM>
</td>

</tr>

</table>

</body>
</html>