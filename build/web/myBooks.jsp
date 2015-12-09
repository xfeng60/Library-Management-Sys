<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : myBooks
    Created on : Dec 9, 2015, 5:12:30 PM
    Author     : Xing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        

        <sql:query var="myBooks" dataSource="jdbc/libmanage">
            SELECT book.ISBN,book_copy.copy_num,TITLE,EDITION,PUBLISHER,Date_of_Issues,expected_return_date   
            FROM (book inner join book_copy on book.isbn = book_copy.isbn)inner join issues on issues.isbn=book_copy.isbn and issues.copy_num = book_copy.copy_num
            where issues.username = '${sessionScope.username}'
            group by book_copy.isbn
        </sql:query>
        <center>
            <br>
            <h2> My Books </h2>
        <table border="1">
            <!-- column headers -->
            <tr>
                <c:forEach var="columnName" items="${myBooks.columnNames}">
                    <th><c:out value="${columnName}"/></th>
                    </c:forEach>
            </tr>
            <!-- column data -->
            <c:forEach var="row" items="${myBooks.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
                   <br>
        <a href='success.jsp'>Search</a>
        </center>
      

    </body>
</html>
