<%-- 
    Document   : returnBook
    Created on : Dec 9, 2015, 6:45:17 PM
    Author     : Xing
--%>

<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");    
    String isbn = request.getParameter("isbn");
    String copy_num = request.getParameter("copy_num");
    String is_damaged = request.getParameter("is_damaged");
    
    //String penalty ="0";
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test",
            "root", "x");
    Statement st = con.createStatement();
    //ResultSet rs;
   
    
    int i2 = st.executeUpdate("delete from issues where username ='" + username + "' and isbn = '" + isbn + "' and copy_num = '"+ copy_num+"'");
    int i3 = st.executeUpdate("update book_copy set is_issued ='0' where isbn = '" + isbn + "' and copy_num = '"+ copy_num+"'");
    
    if(is_damaged.equals("yes")){
        out.print(username + "You will be charged fees for damaged book.");
        int i4 = st.executeUpdate("update book_copy set is_damaged ='1' where isbn = '" + isbn + "' and copy_num = '"+ copy_num+"'");
    }
    //int i = st.executeUpdate("insert into regularuser(username, password, name, date_of_birth, gender, email,address,penalty) values ('" + username + "','" + pwd + "','" + name + "','" + birthdate + "','" + gender + "','"+email+"','"+address+"','"+ penalty+"')");
    if (i2 > 0) {
        //session.setAttribute("userid", user);
       // response.sendRedirect("welcome.jsp");
       out.print("Return Successfull!"+"<a href='StaffSuccess.jsp'>Back</a>");
    } else {
         out.print("Unsucessful return! Please check your input!"+"<a href='StaffSuccess.jsp'>Back</a>");
    }
%>
