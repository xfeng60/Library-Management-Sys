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
        <title>Welcome</title>
        <link rel="stylesheet" href="static/css/bootstrap.min.css">
        
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
                <a href='myBooks.jsp'>My Account</a>
        <%
            }
        %>
      

    <center>
        <h2>Search Books</h2>
<!--        <div id="searchBar" >
            <h2> Search Books</h2>
        </div>-->
<!--        <table  border="1" width="30%" cellpadding="3">
            <thead>
                <tr>
                    <th colspan="3">Search Books</th>
                </tr>
            </thead>
                  
            
            
            <tbody>
                 <form name="searchTitle"  method="post" action="searchTitle.jsp">
                <tr>
                    <td>Title</td>
                    <td><input type="text" name="title" value="" /></td>
                    <td><input type="submit" value="Search"  /></</td>
                </tr>
                 </form>
                 <form name="searchISBN"  method="post" action="search.jsp">
                <tr>
                    <td>ISBN</td>
                    <td><input type="text" name="isbn" value="" /></td>
                    <td><input type="submit" value="Search"/></</td>
                </tr>
                 </form>
            <form name="searchAuthor"  method="post" action="searchAuthor.jsp">
                <tr>
                    <td>Author</td>
                    <td><input type="text" name="author" value="" /></td>
                    <td><input type="submit" value="Search" /></</td>
                </tr>
               </form>-->
<form class="form-inline"  name="searchTitle"  method="post" action="searchTitle.jsp">
  <div class="form-group">
    <label class="sr-only" for="exampleInputAmount">Sea()</label>
    <div class="input-group">
      <div class="input-group-addon">*</div>
      <input type="text" class="form-control" name="title" placeholder="title">
  
    </div>
  </div>
  <button type="submit" class="btn btn-primary"> Search </button>
</form> 

<form class="form-inline"  name="searchISBN"  method="post" action="search.jsp">
  <div class="form-group">
    <label class="sr-only" for="exampleInputAmount">Sea2()</label>
    <div class="input-group">
      <div class="input-group-addon">*</div>
      <input type="text" class="form-control" name="isbn" placeholder="isbn">
     
    </div>
  </div>
  <button type="submit" class="btn btn-primary"> Search </button>
</form>
  
<form class="form-inline"  name="searchAuthor"  method="post" action="searchAuthor.jsp">
  <div class="form-group">
    <label class="sr-only" for="exampleInputAmount">Sea3()</label>
    <div class="input-group">
      <div class="input-group-addon">*</div>
      <input type="text" class="form-control" name="author" placeholder="author">
     
    </div>
  </div>
  <button type="submit" class="btn btn-primary"> Search </button>
  
</form>

<!--                <thead>
                <tr>
                    <th colspan="2"><input type="submit" value="Search" /></</th>
                </tr>
            </thead>-->
<!--            </tbody>
        </table>-->
    </center>
    
</body>
</html>