<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.util.*" session="false"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Quick Trip</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	<link rel="stylesheet" href="css/style.css" type="text/css" />
	</head>
	<body>
<div class="shell">
  <!-- Header -->
  <div id="header">
  </div>
  <!-- End Header -->
  <!-- Main -->
<%
	
	int id=0;
	String s="";
	String s1= request.getParameter("mail");
	String s2= request.getParameter("query");
	trip.DConnection dc=new trip.DConnection();
	Vector<String[]> data=new Vector<String[]>();
	data=dc.getData("select max(id) from inbox");
	s=data.elementAt(0)[0];
	if(s==null)
			id=0;
		else
			id=Integer.parseInt(s);
		id++;
	int cnt=dc.setData("insert into inbox(mail,query,id) values('"+s1+"','"+s2+"',"+id+")");
	
%>

	<jsp:include page="mail.jsp">
		<jsp:param name="mode" value="query"></jsp:param>
		<jsp:param name="query" value="<%=s2%>"></jsp:param>
		<jsp:param name="email" value="<%=s1%>"></jsp:param>
	</jsp:include>
	<br>
	<br>
	<center><h1>Your query/complaint has been sent to Quicktrip<br /><br />
	Your query/complaint number is <%=id%>.
	<br /><br />
	<a href="index.jsp">Home Page</a></h1></center>
	</body>
</html>