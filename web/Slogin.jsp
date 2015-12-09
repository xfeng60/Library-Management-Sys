

<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test",
            "root", "x");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from staff where username='" + username + "' and password='" + pwd + "'");
    
    
    
    if (rs.next()) {
        session.setAttribute("username", username);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("StaffSuccess.jsp");
    } else {
        out.println("Invalid password <a href='staffLogin.jsp'>try again</a>");
    }
%>
