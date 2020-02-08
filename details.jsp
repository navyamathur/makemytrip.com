<%@ page import="java.sql.*,java.util.*" session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Quick Trip</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
</head>
<body>
<jsp:useBean id="c1" class="trip.City" ></jsp:useBean>
<jsp:useBean id="cm" class="trip.CommonMethods" ></jsp:useBean>
<!-- Shell -->
<div class="shell">
  <!-- Header -->
  <div id="header">
	<%
		int menu=1;
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
<h1>Hotel Details</h1>
<!--change start from here -->
<jsp:useBean id="r1" class="trip.Room"></jsp:useBean>
<%
	String id=request.getParameter("id");
	trip.DConnection dc=new trip.DConnection();
	Vector<String[]> v3=dc.getData("select * from hotel where hotelid="+id);

%>
	<table border="1">
		<tr>
			<td>Hotel Name</td>
			<td><%=v3.elementAt(0)[1]%></td>
		<%  String hotelname =v3.elementAt(0)[1];
		        int hotelid=0;
				hotelid =r1.hotelId(hotelname);
				
				int categoryno=Integer.parseInt(dc.getData("select count(*) from roomallotment where hotelid="+hotelid).elementAt(0)[0]);
					int categoryid[]=new int[categoryno];
					for( int i=0;i<categoryid.length;i++)
				{ 
			       categoryid[i]=0;
				}
		   
					String categorynames[]=new String[categoryno];
				for( int i=0;i<categoryid.length;i++)
				{ 
			       categoryid[i]=Integer.parseInt(dc.getData("select category from roomallotment where hotelid="+hotelid).elementAt(i)[0]);
	 		       categorynames[i]=r1.categoryN(categoryid[i]);
				}
		   %>
		   
		</tr>
		
		<tr>
			<td>Image</td>
			<td><img src="<%="hotelimages/"+v3.elementAt(0)[12]%>"  width="500px" hight="200px"/></td>
		</tr>
		<tr>
			<td>Address</td>
			<td><%=v3.elementAt(0)[2]%></td>
		</tr>
		<tr>
			<td>City</td>
			<td><%=v3.elementAt(0)[3]%></td>
		</tr>
		<tr>
			<td>Contact</td>
			<td><%=v3.elementAt(0)[4]%></td>
		</tr>
		<tr>
			<td>StarRating</td>
			<td><%=v3.elementAt(0)[6]%></td>
		</tr>
		<tr>
			<td>CheckIn Time</td>
			<td><%=trip.CommonMethods.convertToSDF(v3.elementAt(0)[7])%></td>
		</tr>
		<tr>
			<td>Checkout time</td>
			<td><%=trip.CommonMethods.convertToSDF(v3.elementAt(0)[8])%></td>
		</tr>
		<tr>
			<td>Min Price</td>
			<td><%=v3.elementAt(0)[9]%></td>
		</tr>
		<tr>
			<td>Max Price</td>
			<td><%=v3.elementAt(0)[10]%></td>
		</tr>
		<tr>
			<td>Facilities</td>
			<td><%=v3.elementAt(0)[11]%></td>
		</tr>
		
		<%!  int k =0; %>
		<%
		Vector<String[]> v4= new Vector<>();
		v4=dc.getData("select image  from roomallotment where hotelid="+hotelid); 
		      int j=0;
		while(j<categoryno)
		{ 
			out.print("<tr><td colspan=2><h4>");
			out.print( " Room Category name:"+categorynames[j]);
			  out.print( " &nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Available rooms :"+dc.getData("select noOfroom  from roomallotment where category="+categoryid[j]+" and hotelid="+hotelid).elementAt(0)[0]); 
       	out.print("</h4> ");
		%>       <img src="<%="roomcatimages/"+v4.elementAt(j)[0]%>" width="280px" height="150px"/>
		
		 <%
	   out.print("</td><td>");
	            
			
			    out.print("<form action ='checksession.jsp' method='post'><input type='submit' name='book' value='book'></form> ");
		 	out.print("</td></tr>");
			j++;
		}%>
		
	
	</table><a href="index.jsp">Go Back</a>
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
