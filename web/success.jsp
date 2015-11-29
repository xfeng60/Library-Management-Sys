<%-- 
    Document   : success.jsp
    Created on : Oct 21, 2015, 2:30:16 PM
    Author     : Xing
--%>

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
