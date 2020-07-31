<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="pageNumber.*, java.util.*" %>
<%
String acctid = request.getParameter("acctid");
String amnt = request.getParameter("amnt");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "bankapplication";
String userId = "root";
String password = "@899";
Connection con=null;
Statement st=null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	 con = DriverManager.getConnection(connectionUrl+dbName, userId, password);
	 st=con.createStatement();
	st.executeUpdate("insert into acctinfo(acctid, acctbalance) values('"+acctid+"',' "+ amnt+"')");
	response.sendRedirect("response.html");
}
catch(Exception e)
{
	e.printStackTrace();
}
finally{
st.close();
con.close();
}
%>