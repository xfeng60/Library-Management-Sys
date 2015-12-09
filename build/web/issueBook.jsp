<%@page import="java.lang.String"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : selectBook
    Created on : Dec 8, 2015, 10:26:07 PM
    Author     : Xing
--%>
<%--<c:set var="book_isbn" value="${selectBook.ISBN}"/>--%>




<%
    String isbn = request.getParameter("select");
    session.setAttribute("isbn", isbn);
    String minCopy = request.getParameter("minCopy");
    session.setAttribute("minCopy", minCopy);
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
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
        <a href='myBooks.jsp'>My Account</a>
        <%
            }
        %>
        <br>
        

        <sql:update var="insertIssues" dataSource="jdbc/libmanage">

            INSERT INTO issues (username,isbn,copy_num,date_of_issues,expected_return_date,return_date)
            VALUES ('${sessionScope.username}','${param.select}', '${param.minCopy}',now(), now() + interval 14 day,null);
        </sql:update>  

        <sql:update var="update_book_copy" dataSource="jdbc/libmanage">
            UPDATE book_copy
            SET  is_issued= "1"
            WHERE copy_num = '${param.minCopy}' and isbn = '${param.select}';
        </sql:update>
      <center>    
       <h2> Successful! Please check out at the front desk. </h2>
       <br>
        <a href='success.jsp'>Back</a>
      </center>
    </body>
</html>