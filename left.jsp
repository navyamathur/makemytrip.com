<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*" session="false"%>
<script>
function ratingValue(val) 
{
	if(val==0)
		document.getElementById('rating').value="Any"; 
	else
		document.getElementById('rating').value=val+" *"; 
}

</script>
<jsp:useBean id="h2" class="trip.Hotel"></jsp:useBean>
<jsp:useBean id="c2" class="trip.City"></jsp:useBean>
<%
	ResultSet rst=null;
	String city=request.getParameter("city");
		if(city==null|| city.equals(""))
			city="";	
		
	String hotel=request.getParameter("hotel");
	if(hotel!=null)
			hotel=hotel.trim();
	
	String facility="";
	String facilities[]=request.getParameterValues("facility");
	if(facilities!=null &&facilities.length!=0)
	{
		facility="(";
		for(int i=0;i<facilities.length;i++)
			facility+=(facilities[i]+",");
		facility=facility.substring(0,facility.length()-1);
		facility+=")";
	}
	
	String star=request.getParameter("rating");
			if(star==null)
				star="1";
%>

      <!-- Search -->
      <div class="box search">
        <h2>Search by <span></span></h2>
        <div class="box-content">
          <form action="index.jsp" method="post">
          		 <div class="inline-field">
            <h3 style="display:inline;"><label>City</label></h3>
            <select name="city"><option value="select city" >select city</option>
<%
		Vector<String[]> v=c2.showAllCities();		
		for(int i=0;i<v.size();i++)
		{
%>
			<option value="<%=v.elementAt(i)[0] %>"><%=v.elementAt(i)[0]%></option>
<%
		}
%>   
            </select>
            </div><br/><br/>
            <h3 style="display:inline;"><label>Hotel</label></h3>
            <input type="text" name="hotel"/><br/><br/>
            
            <h1><label>Facility</label></h1><br/>   
          	<h2><input type="checkbox" name="pool" value="pool">&nbsp;&nbsp;Pool
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="gym" value="gym">&nbsp;&nbsp;Gym</h2><br/>
            	<h2><input type="checkbox" name="bar" value="bar">&nbsp;&nbsp;Bar
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="laundary" value="laundry">&nbsp;&nbsp;Laundry</h2><br/>
            	<h2><input type="checkbox" name="cab" value="cab">&nbsp;&nbsp;Cab
             	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="sight" value="sight">&nbsp;&nbsp;Sight</h2><br/>
              	<h2><input type="checkbox" name="restaurant" value="restaurant">&nbsp;Restaurant
               	&nbsp;<input type="checkbox" name="kidsplay" value="kidsPlay"/> KidsPlay</h2><br/>
               	
            <h3><label>Star Rating</label></h3><br/><input type="range" min="0" max="5" step="1" value="0" name="rating" style="width:100px;color:yellow;" onchange="ratingValue(this.value);"/>
            <input type="text" name="rate" id="rating" size="4" value="Any" style="color:red;"/><br/>
            
            <h3><label>Check In</label></h3><input type="date" name="checkin"/><br/>
             <h3><label>Check Out</label></h3><input type="date" name="checkout"/><br/>
            <input type="submit" class="filter" value="Filter" />
            
          </form>
        </div>
    	<div id="facebookdet">
		<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '1610631505857566',
      xfbml      : true,
      version    : 'v2.4'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

</script>

	</div>

      </div>
      <!-- End Search -->
