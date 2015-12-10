<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : search
    Created on : Dec 8, 2015, 3:07:28 PM
    Author     : Xing
--%>

<sql:query var="searchBooks" dataSource="jdbc/libmanage">
    SELECT title,book.isbn, edition,count(*) AS  "# Copies"
    FROM book inner join book_copy on book.ISBN=book_copy.ISBN where book_copy.is_issued = 0 and is_damaged = 0 and book_copy.ISBN = ?<sql:param value="${param.isbn}"/> group by book.isbn

</sql:query>

--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="static/css/bootstrap.min.css">
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
    <center>
        <h2> Search Result </h2>
        <table border="1">
           
            <c:forEach var="columnName" items="${searchBooks.columnNames}">
                <th><c:out value="${columnName}"/></th>
                </c:forEach>
            </tr>
            <!-- column data -->
            <c:forEach var="row" items="${searchBooks.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
        
        <br>
     
        <form name="selectBook" method="get" action ="selectBook.jsp">
            <select name="search">
                <c:forEach var="row" items="${searchBooks.rowsByIndex}">
                    <c:set var="column" value="${row[1]}"/>
                    <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>

                </c:forEach>
            </select>
            
            <input type="submit" value="Issue this book" />
            <br>
            <a href='success.jsp'>Back</a>
        </form>

    </center>


</body>
</html>

