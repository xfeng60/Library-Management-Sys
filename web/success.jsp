<%-- 
    Document   : success.jsp
    Created on : Oct 21, 2015, 2:30:16 PM
    Author     : Xing
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link type="text/css" rel="stylesheet" href="stylesheet.css"/>
        <title>Welcome</title>>
    </head>>
    <body>
        <%
            if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
        %>
        You are not logged in<br/>
        <a href="index.jsp">Please Login</a>
        <%} else {
        %>
        Welcome <%=session.getAttribute("username")%>
        <a href='logout.jsp'>Log out</a>
        <%
            }
        %>
    <center>
<!--        <div id="searchBar" >
            <h2> Search Books</h2>
        </div>-->
        <table border="1" width="30%" cellpadding="3">
            <thead>
                <tr>
                    <th colspan="2">Search Books</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Title</td>
                    <td><input type="text" name="username" value="" /></td>
                </tr>
                <tr>
                    <td>ISBN</td>
                    <td><input type="password" name="pass" value="" /></td>
                </tr>
                <tr>
                    <td>Author</td>
                    <td><input type="password" name="pass" value="" /></td>
                </tr>

                <thead>
                <tr>
                    <th colspan="2"><input type="submit" value="Search" /></</th>
                </tr>
            </thead>
            </tbody>
        </table>
    </center>
</body>
</html>