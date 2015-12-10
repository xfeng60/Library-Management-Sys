


<%@ page import ="java.sql.*" %>
<%
    
    //int i = st.executeUpdate("insert into regularuser(username, password, name, date_of_birth, gender, email,address,penalty) values ('" + username + "','" + pwd + "','" + name + "','" + birthdate + "','" + gender + "','"+email+"','"+address+"','"+ penalty+"')");
   String username = request.getParameter("username");    

    double amount = Double.parseDouble(request.getParameter("amount"));
    //String penalty ="0";
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test",
            "root", "x");
    Statement st = con.createStatement();
    
    out.print("<br><h2>Pay Successfull!"+"<a href='StaffSuccess.jsp'>Back</a> </h2>");
    
    //int i2 = st.executeUpdate("delete from issues where username ='" + username + "' and isbn = '" + isbn + "' and copy_num = '"+ copy_num+"'");
  //  int i3 = st.executeUpdate("update book_copy set is_issued ='0' where isbn = '" + isbn + "' and copy_num = '"+ copy_num+"'");
    
   
   
        out.print("<br>"+username + " : <br>You've paid $"+ amount + ".");
//        int i4 = st.executeUpdate("update book_copy set is_damaged ='1' where isbn = '" + isbn + "' and copy_num = '"+ copy_num+"'");
        ResultSet rs;
        rs = st.executeQuery("select penalty from regularuser where username='"+username+"'");
        if(rs.next()){
            double cost = (double) rs.getDouble(1) - amount;
            
            st.executeUpdate("update regularuser set penalty ='"+cost+"' where username = '"+username+"'" );
            out.print("<br>You have $" + cost+" left.");
        }
        
        
    
%>
