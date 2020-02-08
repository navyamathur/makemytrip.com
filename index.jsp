<%@ page import="java.sql.*,java.util.*" session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Quick Trip</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
</head>
<body>
<%
	trip.CommonMethods.createAllTables();
%>
<jsp:useBean id="c1" class="trip.City" ></jsp:useBean>
<!-- Shell -->
<div class="shell">
  <!-- Header -->
  <div id="header">
	<% int menu=1;
	%>
	<%@ include file="header.jsp" %>
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main">
   <div class="cl">&nbsp;</div>
    <!-- Sidebar -->
    <div id="sidebar">
	<%@ include file="left.jsp" %>
    </div>
    <!-- End Sidebar -->
    
    <!-- Content -->
    <div id="content">
      <!-- Content Slider -->
      <div id="slider" class="box">
	<%@ include file="slider.jsp" %>
      </div>
      <!-- End Content Slider -->
      <!-- Products -->
      <div class="products">
<h1>Hotels</h1>
<table border="1">	
	<tr>
<%
	trip.DConnection dc=new trip.DConnection();
	String query="select * from hotel where ";
	String pool=request.getParameter("pool");
	String gym=request.getParameter("gym");
	String bar=request.getParameter("bar");
	String laundary=request.getParameter("laundary");
	String cab=request.getParameter("cab");
	String sight=request.getParameter("sight");
	String restaurant=request.getParameter("restaurant");
	String kidsplay=request.getParameter("kidsplay");
	String selectedcity=request.getParameter("city");
	String selectedhotel=request.getParameter("hotel");
	String rating=request.getParameter("rate");
	if(rating != null && rating.endsWith("*"))
		rating=rating.substring(0,rating.length()-1);
	String checkin=request.getParameter("checkin");		
	String checkout=request.getParameter("checkout");

	if(selectedcity!=null && !selectedcity.equals("select city"))
	{
		trip.City c=new trip.City();
		if(query.endsWith("and ") || query.endsWith("where "))
		{		
			query+=" cityid="+c.cityId(selectedcity)+" and ";
		}
		else
			query+=" and cityid="+c.cityId(selectedcity)+" and ";
	}
	if(selectedhotel!=null && !"".equals(selectedhotel))
	{
		if(query.endsWith("and ") || query.endsWith("where "))
			query+=" name='"+selectedhotel+"' and ";
		else
			query+=" and name='"+selectedhotel+"' and ";
	}
	if(rating !=null && !rating.equalsIgnoreCase("any") && !"".equals(rating))
	{
		if(query.endsWith("and ") || query.endsWith("where "))
			query+=" starrating="+rating+" and ";
		else
			query+=" and starrating="+rating+" and ";
	}
	boolean flag=false;
	if(query.endsWith("and "))
	{
		flag=true;
		query+="(";
	}
	if(pool!=null && !"".equals(pool))
		query+=" facilities like '%pool%' or ";
	if(gym!=null && !"".equals(gym))
		query+=" facilities like '%gym%' or ";
	if(bar!=null && !"".equals(bar))
		query+=" facilities like '%bar%' or ";
	if(laundary!=null && !"".equals(laundary))
		query+=" facilities like '%laundary%' or ";
	if(cab!=null && !"".equals(cab))
		query+=" facilities like '%cab%' or ";
	if(sight!=null && !"".equals(sight))
		query+=" facilities like '%sight%' or ";
	if(restaurant!=null && !"".equals(restaurant))
		query+=" facilities like '%restaurant%' or ";
	if(kidsplay!=null && !"".equals(kidsplay))
		query+=" facilities like '%kidsplay%' or ";		
	if(query.endsWith("or "))
		query=query.substring(0,query.length()-3);
	if(query.endsWith("where "))
		query=query.substring(0,query.length()-6);
	if(flag==true)
		query+=")";
	if(query.endsWith("and ()"))
		query=query.substring(0,query.length()-6);
	//out.println(query);
	Vector<String[]> v2=dc.getData(query);
	for(int i=0;i<v2.size();i++)
	{
		out.print("<td><form action='details.jsp?id="+v2.elementAt(i)[0]+"' method='post'><a href='details.jsp?id="+v2.elementAt(i)[0]+"'><img src='hotelimages/"+v2.elementAt(i)[12]+"' width='175' height='160' /></a><br/><h2>"+v2.elementAt(i)[1]+"</h2>rating "+v2.elementAt(i)[6]+"<h3>Rs."+v2.elementAt(i)[10]+"/-</h3><br/><input type='submit' value='Select Room' /></form></td>");
		
		if(i!=0&&i%3==0)
		{
			out.print("</tr><tr>");
		}
		
	}
	out.print("</tr>");	
%>		
</table>
        <div class="cl">&nbsp;</div>
      </div>
      <!-- End Products -->
    </div>
    <!-- End Content -->
    <div class="cl">&nbsp;</div>
  </div>
  <!-- End Main -->
  <%@ include file="footer.jsp" %>
</div>
<!-- End Shell -->
</body>
</html>
