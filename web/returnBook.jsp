<%-- 
    Document   : returnBook
    Created on : Dec 9, 2015, 6:45:17 PM
    Author     : Xing
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String isbn = request.getParameter("isbn");
    String copy_num = request.getParameter("copy_num");
    String is_damaged = request.getParameter("is_damaged");

//    Date return_date = 
    DateFormat format = new SimpleDateFormat("mm-dd-yyyy", Locale.ENGLISH);
    Calendar cal = Calendar.getInstance();
     
    //int year = cal.YEAR, month = cal.MONTH, day = cal.DAY_OF_MONTH;
    Date curdate = cal.getTime();
    //String penalty ="0";
    Class.forName("com.mysql.jdbc.Driver");

    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test",
            "root", "x");
 Statement st = con.createStatement();

//ResultSet rs;
    double cost = 0;
    ResultSet rs2;
    Date expec_date = null;
    rs2 = st.executeQuery("select expected_return_date from issues where username ='" + username + "' and isbn = '" + isbn + "' and copy_num = '" + copy_num + "'");
    long interval = 0;
    if (rs2.next()) {
        expec_date = rs2.getDate(1);
        interval = expec_date.getTime() - curdate.getTime() ;
        
    }

    
       
    int i2 = st.executeUpdate("delete from issues where username ='" + username + "' and isbn = '" + isbn + "' and copy_num = '" + copy_num + "'");
   int i3 = st.executeUpdate("update book_copy set is_issued ='0' where isbn = '" + isbn + "' and copy_num = '" + copy_num + "'");
    if (i2 > 0) {
        //session.setAttribute("userid", user);
        // response.sendRedirect("welcome.jsp");
        out.print("<br><h2>Return Successfull!" + "<a href='StaffSuccess.jsp'>Back</a> </h2>");
        out.print("Return Date : " + curdate + "<br> Expected Return Date: " + expec_date);
//        if (interval < 0) {
//            out.print("<br>"+username + " : <br>You will be charged $20 for returnning late  .");
//        }
    } else {
        out.print("<h2>Unsucessful return! Please check your input!" + "<a href='StaffSuccess.jsp'>Back</a></h2>");

    }
//    if(rs.next()){
//    Date expected = rs.getDate(1);
//  
    if(interval <0){
        out.print("<br>" + username + " : <br>You will be charged fee $20 for returnning late.");
        cost += 20;
    }
    if (is_damaged.equals("yes")) {
        out.print("<br><h3>"+ username + ":</h3> <br>You will be charged fees for damaged book.");
        int i4 = st.executeUpdate("update book_copy set is_damaged ='1' where isbn = '" + isbn + "' and copy_num = '" + copy_num + "'");
        ResultSet rs;
        rs = st.executeQuery("select cost from book where isbn='" + isbn + "'");

        if (rs.next()) {
            cost += (double) rs.getDouble(1) * 0.2;
            out.print("<br>Penalty:  " + cost);

        }

    }
    st.executeUpdate("update regularuser set penalty ='" + cost + "' where username = '" + username + "'");
    //int i = st.executeUpdate("insert into regularuser(username, password, name, date_of_birth, gender, email,address,penalty) values ('" + username + "','" + pwd + "','" + name + "','" + birthdate + "','" + gender + "','"+email+"','"+address+"','"+ penalty+"')");

%>
