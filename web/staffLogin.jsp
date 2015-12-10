<%-- 
    Document   : staffLogin
    Created on : Dec 9, 2015, 5:43:12 PM
    Author     : Xing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Example</title>
                <link rel="stylesheet" href="static/css/bootstrap.min.css">
    </head>
    <body>
         <center>
        <h2> Staff Login Here</h2>
        <br>
<!--        <form method="post" action="Slogin.jsp" >
            <center>
            <table border="1" width="30%" cellpadding="3">
                <thead>
                    <tr>
                        <th colspan="2">Staff Login Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="username" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Login" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                   
                    <tr>
                        <td colspan="2" align = "center"> Regular User <a href="index.jsp"> User Login Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>-->



         <form class="form-inline" method="get" action="Slogin.jsp">
            <div class="form-group">
                <label class="sr-only"  >username</label>
                <input type="text" class="form-control" name="username" placeholder="username">
            </div>
            <div class="form-group">
                <label class="sr-only" for="exampleInputPassword3">password</label>
                <input type="password" class="form-control" type="password" name="pass" placeholder="Password">
            </div>
<!--            <div class="checkbox">
                <label>
                    <input type="checkbox"> Remember me
                </label>
            </div>-->
            <button type="submit" class="btn btn-default">Log in</button>
        </form>

<!--        <br>
        <h5>Yet Not Registered!! <a href="reg.jsp">Register Here</a></h5>-->
        <br>
        <h5>Refgular User <a href="index.jsp"> User Login</a></h5>






    </body>
</html>