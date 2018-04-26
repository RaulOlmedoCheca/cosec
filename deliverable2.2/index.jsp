<!-Academic year 2014-2015-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" id="facebook" class=" no_js">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to Fakebook</title>
<link type="text/css" rel="stylesheet" href="css1.css" />
<link type="text/css" rel="stylesheet" href="css2.css " />
<link type="text/css" rel="stylesheet" href="css3.css" />
<link type="text/css" rel="stylesheet" href="css4.css" />
<link rel="stylesheet" href="css5.css" type="text/css" />
<link rel="shortcut icon" href="fakebook.ico" />
</head>
<body font-familty="lucida grande,tahoma,verdana,arial,sans-serif" class="WelcomePage UIPage_LoggedOut safari4 Locale_en_US">
<div id="globalContainer">
  <div id="content" class="fb_content clearfix">
    <div >
      <!-- 2365fa3194ecdc0cab15721ce967a9f866397w5s -->
      <div class="WelcomePage_Container">
        <div id="menubar_container">
          <div  id="fb_menubar" class=" fb_menubar_logged_out clearfix">
            <ul id="fb_menubar_core" class="fb_menu_list">
              <li class="fb_menu" id="fb_menubar_logo"> <img src="fakebooklogo.jpg" alt="Facebook logo" /> </li>
            </ul>
            <ul id="fb_menubar_aux" class="fb_menu_list">
              <div class="menu_login_container">
                <form method="POST" action="login.jsp" id="login">
                  <table cellpadding="0" cellspacing="0">
                    
                    <tr>
                      <td><input type="text" class="inputtext" title="Email" placeholder="Email" id="email" name="email" value="Email" /></td>
                      <td><input type="password" class="inputpassword" placeholder="Password" id="password" name="password" value="Password" /></td>
                      <td class="login_form_last_field"><div class="inner"> <span class="UIButton UIButton_Blue UIFormButton">
                          <input value="Login" type="submit" class="UIButton_Text" />
                          </span> </div></td>
                    </tr>
                  </table>
                </form>
              </div>
            </ul>
          </div>
        </div>
        <div class="WelcomePage_MainSell">
          <div class="WelcomePage_MainSellCenter clearfix">
            <div class="WelcomePage_MainSellLeft">
              <div class="WelcomePage_MainMessage">Fakebook helps you develop secure web applications.</div>
              
            </div>
            <div class="WelcomePage_MainSellRight">
              <div class="WelcomePage_SignUpSection">
                <div class="WelcomePage_SignUpMessage">
                      <% if(request.getParameter("message")!=null){%>
                    <div class="WelcomePage_SignUpHeadline">
                    	<c:out value='${param.message}'/>
			<%-- request.getParameter("message") --%>
                        </div>
                        <div class="WelcomePage_SignUpSubheadline"></div> 
                        <% }else{ %>
                        <div class="WelcomePage_SignUpHeadline">
                       Sign up
                            </div>
                    <div class="WelcomePage_SignUpSubheadline">Its free and you'll learn</div>
                  <% }%>
                </div>
                <div class="WelcomePage_SimpleReg" id="registration_container">
                  <div id="simple_registration_container" class="simple_registration_container">
                    <div id="reg_box">
                      <form method="post" action="createaccount.jsp" name="reg" id="reg">
                        
                        <div id="reg_form_box">
                          <table class="editor" border="0" cellspacing="0">
                              <tr>
                              <td class="label">NIA:</td>
                              <td><div class="field_container">
                                  <input type="text" class="inputtext" id="id" name="id" value="" />
                                </div></td>
                              </tr>
                              <tr>
                              <td class="label">Name:</td>
                              <td><div class="field_container">
                                  <input type="text" class="inputtext" id="name" name="name" value="" />
                                </div></td>
                            </tr>
                            <tr>
                              <td class="label">Surname:</td>
                              <td><div class="field_container">
                                  <input type="text" class="inputtext" id="surname" name="surname" value="" />
                                </div></td>
                            </tr>
                            <tr>
                              <td class="label">Your Email:</td>
                              <td><div class="field_container">
                                  <input type="text" class="inputtext" id="email" name="email" value="" />
                                </div></td>
                            </tr>
                            <tr>
                              <td class="label">Your Password:</td>
                              <td><div class="field_container">
                                  <input type="password" class="inputpassword" id="password" name="password" value="" />
                                </div></td>
                            </tr>
                          </table>
                          <div class="reg_btn clearfix"><span class="UIButton UIButton_Green UIFormButton">
                            <input value="Sign Up!" type="submit" class="UIButton_Text" />
                            </span>

                          </div>
                        </div>

                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div id="pageFooter">
    <div id="footerContainer">
      <div id="footerLeft"> Computer Security Laboratory </div>
      <div id="footerRight"> COSEC -2014/2015 </div>
    </div>
  </div>
</div>
</body>
</html>
