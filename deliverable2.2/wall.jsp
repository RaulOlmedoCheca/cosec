<!-Academic year 2014-2015-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.util.Hashtable" %>

<%!
    String idWall, nameWall;
    java.util.Vector<java.util.Hashtable> comments;
    java.util.Hashtable<String,String> users;
%>

<% try {
            // Step 1.-Load driver
            Class.forName("org.gjt.mm.mysql.Driver");
            String urlDB = "jdbc:mysql://localhost:3306/fakebook";
            // Step 2.- Connection
            Connection con = DriverManager.getConnection(
            urlDB,"root", "root");

            if(request.getParameter("idWall")!=null){
                 idWall = request.getParameter("idWall");

            }else{
                idWall = (String)session.getAttribute("id");
            }
            users = new java.util.Hashtable<String,String>();
            //Step 3.-Obtain names and surnames
            PreparedStatement s1 = con.prepareStatement("SELECT name, surname, id FROM users");
            
	    //Step 4.- Get idWall from the request or the session
            ResultSet result1 = s1.executeQuery();
            while(result1.next()){
                users.put(result1.getString("id"),result1.getString("name")+" "+
                        result1.getString("surname"));
            }

            nameWall = users.get(idWall);

	    if(nameWall == null) {
                idWall = (String)session.getAttribute("id");
		nameWall = users.get(idWall);
	    }

            //Step 5.-Get wall messages
            PreparedStatement s2 = con.prepareStatement("SELECT src_user, content FROM WallMessages WHERE dst_user=?");
            s2.setString(1,idWall);
            ResultSet resultado2 = s2.executeQuery();
            //This vector contains user messages
            comments = new java.util.Vector<java.util.Hashtable>();
            //get only some messages with certain src_user id.
            while(resultado2.next()){
                // each row is a message with the src_user and content.
                java.util.Hashtable<String,String> row = new java.util.Hashtable<String,String>();
                row.put("src_user",resultado2.getString("src_user"));
                row.put("content",resultado2.getString("content"));
                comments.add(row);
            }


  s1.close();
  s2.close();
  con.close();
}
catch (ClassNotFoundException e1) {
  // JDBC driver class not found, print error message to the console
  out.println("ERROR 1: "+e1.toString());
  //end catch
}
catch (SQLException e2) {
  // Exception when executing java.sql related commands, print error message to the console
  out.println("ERROR 2: "+e2.toString());
  //end catch
}
catch (Exception e3) {
  // other unexpected exception, print error message to the console
  out.println("ERROR 3: "+e3.toString());
  //end catch
}
%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" id="facebook" class=" no_js">
<head>

<link type="text/css" rel="stylesheet" href="csswall1.css" />
<link type="text/css" rel="stylesheet" href="csswall2.css" />
<link type="text/css" rel="stylesheet" href="csswall3.css" />
<link type="text/css" rel="stylesheet" href="csswall4.css" />
<link type="text/css" rel="stylesheet" href="csswall5.css" />
<link type="text/css" rel="stylesheet" href="csswall6.css" />
<link type="text/css" rel="stylesheet" href="csswall7.css" />
<link type="text/css" rel="stylesheet" href="csswall8.css" />
<link rel="stylesheet" href="csswall9.css" type="text/css" />
<title>Fakebook | Home</title>
<link rel="shortcut icon" href="fakebook.ico" />
</head>
<body class="home safari4 Locale_en_US chat_body">
<div id="pagelet_presence"></div>
<div id="FB_HiddenContainer" style="position:absolute; top:-10000px; width:0px; height:0px;" ></div>
<div id="menubar_container">
  <div  id="fb_menubar" class=" clearfix">
    <ul id="fb_menubar_core" class="fb_menu_list">
      <li class="fb_menu" id="fb_menubar_logo"><img src="fakebooklogo.jpg" alt="Fakebook logo" /></li>
      <li class="fb_menu" id="fb_menu_home"><span class="fb_menu_link" accesskey="1"><%= nameWall %>'s Wall</span></li>
      <li class="fb_menu" id="fb_menu_friends"><a href="#" class="fb_menu_link" accesskey="3">Friends</a>
        <div class="fb_menu_dropdown clearfix" id="fb_menu_friends_dropdown">
          <table>
            <%
                java.util.Set idsusers = users.keySet();
                java.util.Iterator<String> iteradorIds = idsusers.iterator();
                for(int i=0;i<users.size();i++){
                    String idActual = iteradorIds.next();
                    if(!idActual.equals(idWall)){
                    %>
                        <tr>
                            <td><a href="wall.jsp?idWall=<%= idActual%>"><%=users.get(idActual)%></a></td>

                    </tr>

                    <%
                    }
                }
            %>
        </table>
        </div>
      </li>
    </ul>
    <ul id="fb_menubar_aux" class="fb_menu_list">
      <li class="fb_menu" id="fb_menu_logout"><a href="closesession.jsp" class="fb_menu_link">Close Session</a></li>
      <li class="fb_menu" id="fb_menu_link"><a href="wall.jsp" class="fb_menu_link" accesskey="1">I am <%= (String)session.getAttribute("name") %>: Go to my wall</a></li>
    </ul>
  </div>
</div>
<div id="content" class="fb_content clearfix">
  <div class="UIFullPage_Container">
    <div >
      <div id="pagelet_nuxbanner">
          <form action="commentWall.jsp" method="post" accept-charset="UTF-8">
            You may write something in the wall:<br>
            <textarea name="content" cols="60" rows="5" id="textfield">Write here your comment</textarea>
            <br>
            <input type="hidden" name="dst_user" value="<%= idWall %>">
            <input type="submit" value="Send" name="send"><br>
        </form></div>
      <div id="home_left_column">
        <div id="pagelet_roosters">
            <br><br><br><br>
            <h2>Messages on <%= nameWall %>'s wall</h2>
            <table>
                <hr/>
            <% for(int i=0;i<comments.size();i++){ %>
                    <tr>
                        
                        <td><h3 class="GenericStory_Message GenericStory_Report"><a href="wall.jsp?idWall=
<%= comments.get(i).get("src_user")%>"><%= users.get(comments.get(i).get("src_user")) %></a>:
                        <%= comments.get(i).get("content") %></h3><hr/></td>
                    
                    
                    </tr>
                    <%
                }
            %>

        </table>
        </div>
      </div>
      <div id="pagelet_nux_guide"></div>
      
    </div>
  </div>
</div>
<div><div id="pageFooter">
    <div id="footerContainer">
      <div id="footerLeft"> Computer Security Laboratory </div>
      <div id="footerRight"> COSEC 2014/2015</div>
    </div>
  </div></div>
</body>
</html>
