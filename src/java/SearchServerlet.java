/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Xing
 */
@WebServlet(urlPatterns = {"/Search"})


public class SearchServerlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        String username = (String) request.getSession().getAttribute("username");
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test",
            "root", "x");
        Statement st = con.createStatement();
        ResultSet rs;
        String title = request.getParameter("title");
        String isbn = request.getParameter("isbn");
        String author = request.getParameter("author");
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("function selectradio()\n" +
"{\n" +
"    var arr=document.getElementsByName(\"radio1\");\n" +
              "var  i=0;" + 
"    for(i=0;i<arr.length;i++)\n" +
"    {\n" +
"        if(arr[i].checked)\n" +
"        {\n" +
"            alert(arr[i].value)\n" +
                "break;" +
"        }\n" +
"    }\n" +
     " var t = document.getElementsByTagName(\"table\");\n" + 
     "var rows = t.getElementsByTagName(\"tr\");\n" +
     "alert(rows[i].cell[2].innerHTML)"+
"}");
        out.println("</script>");
         out.println("<form action=\"borrow.jsp\" onsubmit=\"selectradio()\">");
        out.println("Welcome " + username);
        out.println("<a href='logout.jsp'>Log out</a>");
               //s out.println(isbn+" title: "+ title + "author "+ author);
     
        //rs = st.executeQuery("select book_copy.ISBN, TITLE, count(*) from book inner join book_copy on book.ISBN=book_copy.ISBN where book_copy.ISBN = '" + isbn+ "' group by book_copy.ISBN" );
 
        rs = searchBooks(st,isbn,title,author);
        
           

        out.println("<center>");
       out.println("<h2>Search Rusult</h2>");
              
       out.println("<table  border=\"1\" width=\"30%\" cellpadding=\"3\">");
       
        out.println("         <thead>\n" +
"                <tr>\n" +
"                    <th>Select</th>\n" +
"                    <th>ISBN</th>\n" +
"                    <th>Title</th>\n" +
"                    <th>Edition</th>\n" +
"                    <th># Copies</th>\n" +
"                </tr>\n" +
"            </thead>");
        out.println("<tbody>");
        int i=0;
            while(rs.next()){
                i++;
                out.println("<tr>\n");
                
                out.println("<td>\n");
                out.println("<input type=\"radio\" name=\"radio1\" value = rs.getString(1) > ");
                out.println("</td>\n");
                out.println("<td>\n");
                out.println(rs.getString(1));
                out.println("</td>");
                out.println("<td>\n");
                out.println(rs.getString(2));
                out.println("</td>");
                out.println("<td>\n");
                out.println(rs.getString(3));
                out.println("</td>");
                out.println("<td>\n");
                out.println(rs.getString(4));
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</tbody>");

            out.println("</table>");

            if(i==0){
                out.println("<br> <h2>No result found</h2>");
            }
           out.println("<br><a href='success.jsp'>Back</a>");
           out.println("<br><br><input type=\"submit\" value=\"Borrow\">");
           out.println("</center>");
           out.println("</form>");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    protected ResultSet searchBooks(Statement st, String isbn, String title, String author) throws SQLException{
//        StringBuilder sb = new StringBuilder();
//        if(!isbn.equals("")) sb.append( " book_copy.ISBN = '\" + isbn+ \"'");
//        String str = sb.toString();
//        return st.executeQuery("select book_copy.ISBN, TITLE, count(*) from book inner join book_copy on book.ISBN=book_copy.ISBN where " + str + " group by book_copy.ISBN" );
        ResultSet rs = null;
      
        if(!isbn.equals("")&&!title.equals("")&&!author.equals("")){
           rs = st.executeQuery("select book_copy.ISBN, TITLE, ,EDITION,count(*) from (book inner join book_copy on book.ISBN=book_copy.ISBN) inner join authors on book.ISBN=authors.ISBN where authors = '" + author+ "' and book.isbn= '"+isbn+"' and title='"+title +"' group by book_copy.ISBN" );
        }else if(!isbn.equals("")&&!title.equals("")){
             rs = st.executeQuery("select book_copy.ISBN, TITLE,EDITION, count(*) from book inner join book_copy on book.ISBN=book_copy.ISBN where book_copy.ISBN = '" + isbn+ "' and title = '"+title+"' group by book_copy.ISBN" );
        }else if(!title.equals("")&&!author.equals("")){
            rs = st.executeQuery("select book_copy.ISBN, TITLE, EDITION,count(*) from (book inner join book_copy on book.ISBN=book_copy.ISBN) inner join authors on book.ISBN=authors.ISBN where authors = '" + author+"' and title = '"+title +"' group by book_copy.ISBN" );
        }else if(!isbn.equals("")&&!author.equals("")){
            rs = st.executeQuery("select book_copy.ISBN, TITLE,EDITION, count(*) from (book inner join book_copy on book.ISBN=book_copy.ISBN) inner join authors on book.ISBN=authors.ISBN where authors = '" + author+"' and book.isbn = '"+isbn +"' group by book_copy.ISBN" );
        }else if(!isbn.equals("")){
            rs = st.executeQuery("select book_copy.ISBN, TITLE, EDITION,count(*) from book inner join book_copy on book.ISBN=book_copy.ISBN where book_copy.ISBN = '" + isbn+ "' group by book_copy.ISBN" );
        }else if(!title.equals("")){
            rs = st.executeQuery("select book_copy.ISBN, TITLE, EDITION,count(*) from book inner join book_copy on book.ISBN=book_copy.ISBN where title = '" + title+ "' group by book_copy.ISBN" );
        }else if(!author.equals("")){
            
            rs = st.executeQuery("select book_copy.ISBN, TITLE,EDITION, count(*) from (book inner join book_copy on book.ISBN=book_copy.ISBN) inner join authors on book.ISBN=authors.ISBN where authors = '" + author+ "' group by book_copy.ISBN" );
        }
            
        return rs;
            
    
    }
    @Override
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SearchServerlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SearchServerlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SearchServerlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SearchServerlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }




}
