<%-- 
    Document   : adminlogin
    Created on : Jul 3, 2018, 2:49:58 PM
    Author     : INFOMETICS3
--%>

<%@page import="java.io.*,java.util.*" language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.*, java.security.*"%>
 <%@ page session = "true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
        <!-- custom stylesheet -->
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <title>login page</title>
    </head>
    <body class="bg-light">
        
        <div class="container">
        <%
            Connect con = new Connect();
            Connection conn = con.dbConnect();
            mdjavahash md = new mdjavahash();
            if(request.getParameter("username")!= null && request.getParameter("password")!= null){
                boolean status = false;
                try{
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    String uname = md.getHashPass(username.trim());
                    String pword = md.getHashPass(password.trim());
                    
                    PreparedStatement statement = conn.prepareStatement("SELECT * FROM superadmin WHERE username=? AND password=?");
                    statement.setString(1, uname);
                    statement.setString(2, pword);
                    ResultSet rs = statement.executeQuery();
                    status = rs.next();
                    
                    if(status){
                        session.setAttribute("username", uname);  
                        response.sendRedirect("admin.jsp");
                    }
                }
                catch(Exception e){
                %> <p class="text-danger">USERNAME or PASSWORD is incorrect<p><%
                response.sendRedirect("adminlogin.jsp");
                }
                if(conn!= null){
                    conn.close();
                }
            }
        %>
        
        <a href="../index.jsp" class="header text-success"> <h2 style="text-align: center" class="page-header well">RICANA NIGERIA LIMITED </a>
        <h4 class="text-warning text-center">Super Administrator Login Page</h4><br>
        
        <form method="POST" action="adminlogin.jsp">
            <div class="form-group login-form-group">
            <label class="text-success">Username:</label>
            <input class="form-control" type="text" name="username" placeholder="Enter your username" required/>
            <label class="text-success">Password:</label>
            <input class="form-control" type="password" name="password" placeholder="Enter your password" required/>
            <input class="btn btn-outline-success" type="submit" value="Login">                   
            </div> 
        </form>
        </div>
    </body>
</html>