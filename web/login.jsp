<%-- 
    Document   : login.jsp
    Created on : Oct 21, 2015, 2:29:55 PM
    Author     : Xing

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/myNewDatabase"
     user="root"  password="x"/>

<sql:query dataSource="${snapshot}" var="result">
SELECT * from members
WHERE members.uname=?<sql:param value="${param.subject_id}"/>
</sql:query>
 <c:set var="count" value="${result.getRowCount()}">
--%>
<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test",
            "root", "x");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from regularuser where username='" + username + "' and password='" + pwd + "'");

    
    
    
    if (rs.next()) {
        session.setAttribute("username", username);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
