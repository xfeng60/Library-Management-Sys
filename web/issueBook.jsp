<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : selectBook
    Created on : Dec 8, 2015, 10:26:07 PM
    Author     : Xing
--%>
<%--<c:set var="book_isbn" value="${selectBook.ISBN}"/>--%>
<sql:update var="issues" dataSource="jdbc/libmanage">
    UPDATE book
    SET  cost= "1180"
    WHERE ISBN = ?<sql:param value="${param.select}" />;
</sql:update>
<%--<sql:query var="updateIssue" dataSource="jdbc/libmanage">
     SELECT book.ISBN,TITLE,MIN(COPY_NUM) AS  "copy avalable"
     FROM (book inner join book_copy on book.ISBN= book_copy.ISBN)inner join shelf on book.shelf_num=shelf.shelf_num where book_copy.is_issued = 0 and is_damaged = 0 and book.ISBN = ?<sql:param value="${param.select}"/>
     group by book.ISBN
</sql:query>--%>
     <c:set var="username" value="${sessionScope.username}"/>
     <c:set var="isbn2" value = "?<sql:param value=\"${param.select}\"/>"/>
     <%
         String isbn2 = request.getParameter("select");
        session.setAttribute("isbn2",isbn2);
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
        <%
            }
        %>
        <sql:update var="insertIssues" dataSource="jdbc/libmanage">

            INSERT INTO issues (username,isbn,copy_num,date_of_issues,expected_return_date,return_date)
            VALUES ('${sessionScope.username}','${sessionScope.isbn2}', '1',now(), now() + interval 14 day,null);
        </sql:update>
         
    </body>
</html>