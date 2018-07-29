<%-- 
    Document   : login
    Created on : Apr 7, 2018, 6:32:35 AM
    Author     : mac
--%>
<%@page import="java.io.*,java.util.*" language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect"%>
 <%@ page session = "true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" integrity="sha384-+d0P83n9kaQMCwj8F4RJB66tzIwOKmrdb46+porD/OvrJ+37WqIM7UoBtwHO6Nlg" crossorigin="anonymous">
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <title>login page</title>
    </head>
    <body class="bg-light">
        <div class="container">
        <%
//            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
//            response.setHeader("Pragma", "no-cache"); //HTTP 1.0
//            response.setHeader("Expires", "0"); //Proxies
            Connect con = new Connect();
            Connection conn = con.dbConnect();
            if(request.getParameter("username")!=null && request.getParameter("password")!=null){
                boolean status = false;
                try{
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    String uname = username.trim();
                    String pword = password.trim();
                    
                    PreparedStatement statement = conn.prepareStatement("SELECT * FROM admin WHERE username=? AND password=?");
                    statement.setString(1, uname);
                    statement.setString(2, pword);
                    ResultSet rs = statement.executeQuery();
                    status = rs.next();
                    if(status){
                        session.setAttribute("username", uname);  
                        response.sendRedirect("warehouseManager.jsp");
                    }
                                       
                }
                catch(Exception e){
                %> <p class="text-danger">USERNAME or PASSWORD is incorrect<p><%
                response.sendRedirect("login.jsp");
                }
                conn.close();
            }
        %>
        
        <a href="../index.html" class="header text-success"> <h2 style="text-align: center" class="page-header well">RICANA NIGERIA LIMITED </a>
        <h4 class="text-warning text-center">Administrator Login Page</h4><br>
        
        <form method="GET" action="login.jsp">
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