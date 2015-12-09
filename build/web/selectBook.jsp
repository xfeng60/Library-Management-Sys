<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : selectBook
    Created on : Dec 8, 2015, 10:26:07 PM
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
        
            <sql:query var="selectBook" dataSource="jdbc/libmanage">
                SELECT book.ISBN,TITLE,EDITION,PUBLISHER,COST,FLOOR_NUM, AISLE_NUM,BOOK.SHELF_NUM,count(*) AS  "# Copies"
                FROM (book inner join book_copy on book.ISBN= book_copy.ISBN)inner join shelf on book.shelf_num=shelf.shelf_num where book_copy.is_issued = 0 and is_damaged = 0 and book.ISBN = ?<sql:param value="${param.search}"/>
                group by book.ISBN
            </sql:query>
                
             <sql:query var="updateIssue" dataSource="jdbc/libmanage">
     SELECT MIN(COPY_NUM) AS  "copyNumber"
     FROM book inner join book_copy on book.ISBN= book_copy.ISBN where book_copy.is_issued = 0 and is_damaged = 0 and book.ISBN = ?<sql:param value="${param.search}"/>
     group by book.ISBN
</sql:query>   
             
            <center> 
                <h2>Select Book Copy</h2>
                <table name="table_to_issue" border="1">
                    <!-- column headers -->
                    <tr>
                        <c:forEach var="columnName" items="${selectBook.columnNames}">
                            <th><c:out value="${columnName}"/></th>
                            </c:forEach>
                    </tr>
                    <!-- column data -->
                    <c:forEach var="row" items="${selectBook.rowsByIndex}">
                        <tr>
                            <c:forEach var="column" items="${row}">
                                <td><c:out value="${column}"/></td>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                </table>

                <br>
                <!--        
                        <select name="selectCopy">
             
            </select>-->    
           <form name="selectBook" method="post" action ="issueBook.jsp">
           
        <select name="select">
            <c:forEach var="row" items="${selectBook.rowsByIndex}">
                <c:set var="column" value="${row[0]}"/>
                <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>

            </c:forEach>
        </select>
        <select name="minCopy">
            <c:forEach var="row" items="${updateIssue.rowsByIndex}">
                <c:set var="column" value="${row[0]}"/>
                <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>

            </c:forEach>
        </select>
<!--               <input type="text" name="email" value= "$select" />-->
                <input type="submit" value="Issue this book" />
        </form>
        <br>
        <a href='success.jsp'>Back</a>

    </center>

</body>
</html>
