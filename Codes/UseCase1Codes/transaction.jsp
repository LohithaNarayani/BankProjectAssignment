
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("acctId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "bankapplication";
String userId = "root";
String password = "@899";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Bank Transactions & acctBalance</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>acctid</b></td>
<td><b>transid</b></td>
<td><b>transaction</b></td>
<td><b>amnt</b></td>
<td><b>date</b></td>
<td><b>time</b></td>
<td><b>acctbalance</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM transinfo";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("acctid") %></td>
<td><%=resultSet.getString("transid") %></td>
<td><%=resultSet.getString("transaction") %></td>
<td><%=resultSet.getString("amnt") %></td>
<td><%=resultSet.getString("date") %></td>
<td><%=resultSet.getString("time") %></td>
<td><%=resultSet.getString("acctbalance") %></td>

</tr>

<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>