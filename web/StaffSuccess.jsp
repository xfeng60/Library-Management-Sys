<%-- 
    Document   : StaffSuccess
    Created on : Dec 9, 2015, 6:05:37 PM
    Author     : Xing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        Welcome, Administrator!  <%=session.getAttribute("username")%>
        <a href='logout.jsp'>Log out</a>
               
        <%
            }
        %>
        <h2>Return Book</h2> 
        <br>
        <form name="form23"  method="post" action="returnBook.jsp" >
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Return Book</th>
                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td>Book ISBN</td>
                        <td><input type="text" name="isbn" value="" /></td>
                    </tr>
                    <tr>
                        <td>Copy Number</td>
                        <td><input type="text" name="copy_num" value="" /></td>
                    </tr>
                    <tr>
                        <td>Is Damaged</td>
                        <td><input type="text" name="is_damaged" value="" /></td>
                    </tr>
                    
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
<!--                    <tr>
                        <td colspan="2">Already registered!! <a href="index.jsp">Login Here</a></td>
                    </tr>-->
                </tbody>
            </table>
       
            </center>
        </form>
         <br>
        <h2>Pay Fees</h2> 
            <center>
                            <form name="form33"  method="post" action="payFees.jsp" >

            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Pay Fees</th>
                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <td>Username</td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td>Amount</td>
                        <td><input type="text" name="amount" value="" /></td>
                    </tr>
                   
                    
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
<!--                    <tr>
                        <td colspan="2">Already registered!! <a href="index.jsp">Login Here</a></td>
                    </tr>-->
                </tbody>
            </table>
       
           
        </form>
         </center>
        <br>
    </body>
</html>
