<%-- 
    Document   : index
    Created on : Nov 28, 2015, 9:09:38 PM
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
        <!--        <form method="post" action="login.jsp" >-->
    <center>
        <h2> User Login Here</h2>
        <br>
        <!--            <table  border="1" width="30%" cellpadding="3">
                        <thead>
                            <tr>
                                <th colspan="2">User Login Here</th>
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
                                <td colspan="2" align = "center">Yet Not Registered!! <a href="reg.jsp">Register Here</a></td>
                            </tr>
                            <tr>
                                <td colspan="2" align = "center"> Staff Login <a href="staffLogin.jsp"> Stuff Login</a></td>
                            </tr>
                        </tbody>
                    </table>-->

        <form class="form-inline" method="get" action="login.jsp">
            <div class="form-group">
                <label class="sr-only"  >username</label>
                <input type="text" class="form-control" name="username" placeholder="username">
            </div>
            <div class="form-group">
                <label class="sr-only" for="exampleInputPassword3">password</label>
                <input type="password" class="form-control" type="password" name="pass" placeholder="Password">
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox"> Remember me
                </label>
            </div>
            <button type="submit" class="btn btn-default">Log in</button>
        </form>

        <br>
        <h5>Yet Not Registered!! <a href="reg.jsp">Register Here</a></h5>
        <br>
        <h5>Staff Login <a href="staffLogin.jsp"> Stuff Login</a></h5>







    </center>
</form>
</body>
</html>