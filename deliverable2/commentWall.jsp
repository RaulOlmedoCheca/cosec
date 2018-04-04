<!-Academic year 2014-2015-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
try {
  // Step 1.- Load the JDBC driver
  Class.forName("org.gjt.mm.mysql.Driver");
  String urlDB = "jdbc:mysql://localhost:3306/fakebook";
  // Step 2.- Create a Connection object
  Connection con = DriverManager.getConnection(
    urlDB,"root", "root");

  // Step 3.- Insert Comment into DDBB
  String insert = "INSERT INTO WallMessages (src_user, dst_user, content) VALUES (?, ?, ?)";
  PreparedStatement ps = con.prepareStatement(insert);

  ps.setLong(1, Long.parseLong((String)session.getAttribute("id")));
  ps.setLong(2, Long.parseLong(request.getParameter("dst_user")));
  ps.setString(3, request.getParameter("content"));
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
<% String valueAux = request.getParameter("dst_user"); %>
<jsp:forward page="wall.jsp">
            <jsp:param name="idWall" value="<%= valueAux %>"/>
</jsp:forward>
