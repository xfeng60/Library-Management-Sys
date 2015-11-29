<%-- 
    Document   : reg.jsp
    Created on : Oct 21, 2015, 2:25:24 PM
    Author     : Xing
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script>
            //验证username是否大于三位
            function isValidate(thisform){
//            with(thisform){
//                if(uname.value.length<3){
//                    alert("username must be more than 3 characters! " );
//                    uname.focus();
//                    return false;
//                }
//                if(uname.value.length == 0){
//                    alert("username can't be empty! " );
//                    uname.focus();
//                    return false;
//                }
                 if(pass1.value !== pass2.value){
                    alert("Passwords must be the same! " );
                    uname.focus();
                    return false;
                }
            }
            }
</script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body>
        <form name="form1"  onsubmit="return isValidate(this)">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Birth Date</td>
                        <td><input type="text" name="birthdate" value="" /></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td><input type="text" name="gender" value="" /></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><input type="text" name="address" value="" /></td>
                    </tr>                    
                    <tr>
                        <td>User Name</td>
                        <td><input type="text" name="uname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass1" value="" /></td>
                    </tr>
                    <tr>
                        <td>Retype Password</td>
                        <td><input type="password" name="pass2" value="" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Submit" /></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Already registered!! <a href="index.jsp">Login Here</a></td>
                    </tr>
                </tbody>
            </table>
            </center>
        </form>
        

    </body>
</html>
