<!-Academic year 2014-2015-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "org.mindrot.jbcrypt.*" %>
<%
try {
  // Step 1.- Load the JDBC driver
  Class.forName("org.gjt.mm.mysql.Driver");
  String urlDB = "jdbc:mysql://localhost:3306/fakebook";
  // Step 2.- Create a Connection object
  Connection con = DriverManager.getConnection(
    urlDB,"root", "root");

  System.out.println("got connection");


  // Step 3. Create new user to be inserted in DDBB
  request.setCharacterEncoding("UTF-8");
  String insert = "INSERT INTO users ( id, name, surname, email, password) VALUES (?, ?, ?, ?, ?)";
  PreparedStatement ps = con.prepareStatement(insert);
  ps.setLong(1, Long.parseLong(request.getParameter("id")));
  ps.setString(2, request.getParameter("name"));
  ps.setString(3, request.getParameter("surname"));
  ps.setString(4, request.getParameter("email"));
  String hashed = BCrypt.hashpw(request.getParameter("password"), BCrypt.gensalt());
  ps.setString(5, hashed);
  ps.executeUpdate();

  ps.close();
  con.close();
}
catch (ClassNotFoundException e1) {
  // JDBC driver class not found, print error message to the console
  out.println(e1.toString());
  //end catch
}
catch (SQLException e2) {
  // Exception when executing java.sql related commands, print error message to the console
  out.println(e2.toString());
  //end catch
}
catch (Exception e3) {
  // other unexpected exception, print error message to the console
  out.println(e3.toString());
  //end catch
}
        %>
<jsp:forward page="index.jsp?mesage=Account created, you may login now! "/>
