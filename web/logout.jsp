<%-- 
    Document   : logout.jsp
    Created on : Oct 21, 2015, 2:30:41 PM
    Author     : Xing
--%>

<%
session.setAttribute("username", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
