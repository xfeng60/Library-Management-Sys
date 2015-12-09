<%-- 
    Document   : registration.jsp
    Created on : Oct 21, 2015, 2:25:59 PM
    Author     : Xing
--%>

<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");    
    String pwd = request.getParameter("pass1");
    String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    String birthdate = request.getParameter("birthdate");
    String address = request.getParameter("address");
    String penalty ="0";
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test",
            "root", "x");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i1 = st.executeUpdate("insert into user(username, password) values ('" + username + "','" + pwd + "')");

    int i = st.executeUpdate("insert into regularuser(username, password, name, date_of_birth, gender, email,address,penalty) values ('" + username + "','" + pwd + "','" + name + "','" + birthdate + "','" + gender + "','"+email+"','"+address+"','"+ penalty+"')");
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("welcome.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
%>
