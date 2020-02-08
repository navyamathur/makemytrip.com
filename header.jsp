<%@ page import="java.util.*" session="false"%>
    <h1 id="logo"><a href="#"></a></h1>
   
    <!-- End Cart -->
    <!-- Navigation -->
    <div id="navigation">
      <ul>
<%
	if(menu==1)
	{
%>
        <li><a href="index.jsp" class="active">Home</a></li>
<%
	}
	else
	{
%>
        <li><a href="index.jsp">Home</a></li>
<%
	}
%>
<%
	if(menu==2)
	{
%>
	<li><a href="support.jsp" class="active">Support</a></li>
<%
	}
	else
	{
%>
	<li><a href="support.jsp">Support</a></li>
<%
	}
%>

<%
	if(menu==3)
	{
%>
        <li><a href="myaccount.jsp" class="active">My Account</a></li>
<%
	}
	else
	{
%>
        <li><a href="myaccount.jsp">My Account</a></li>
<%
	}
%>

<%
	if(menu==4)
	{
%>
        <li><a href="contact.jsp" class="active">Contact</a></li>
<%
	}
	else
	{
%>
        <li><a href="contact.jsp">Contact</a></li>
<%
	}
%>
       </ul>
    </div>
    <!-- End Navigation -->
