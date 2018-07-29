<%-- 
    Document   : siteadmin
    Created on : Jul 3, 2018, 3:09:45 PM
    Author     : INFOMETICS3
--%>

<%@page import="java.io.*,java.util.*" language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.*,java.security.*"%>
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
        <title>siteadmin</title>
    </head>
    <body class="bg-light">
        
        <div class="container">
        <%
            
            Connect con = new Connect();
            Connection conn = con.dbConnect();
            mdjavahash md = new mdjavahash();
            if(request.getParameter("oldusername")!= null && request.getParameter("oldpassword")!= null && request.getParameter("newusername")!= null && request.getParameter("newpassword")!= null){
                boolean status = false;
                try{
                    String oldusername = request.getParameter("oldusername");
                    String oldpassword = request.getParameter("oldpassword");
                    String newusername = request.getParameter("newusername");
                    String newpassword = request.getParameter("newpassword");
                    String oldpword = md.getHashPass(oldpassword.trim());
                    String olduname = md.getHashPass(oldusername.trim());
                    String newpword = md.getHashPass(newpassword.trim());
                    String newuname = md.getHashPass(newusername.trim());
                        PreparedStatement statement1 = conn.prepareStatement("SELECT * FROM siteadmin WHERE username=? AND password=?");
                        statement1.setString(1, olduname);
                        statement1.setString(2, oldpword);
                        ResultSet rs = statement1.executeQuery();
                        status = rs.next();
                    
                        if(status){
                            PreparedStatement statement2 = conn.prepareStatement("UPDATE  siteadmin SET username=?, password=?");
                            statement2.setString(1, newuname);
                            statement2.setString(2, newpword);
                            statement2.executeUpdate();
                            %><p class="text-success">PASSWORD CHANGED SUCCESSFULLY<p><%
                        }
                                       
                }
                catch(Exception e){
                e.printStackTrace();
                response.sendRedirect("adminlogin.jsp");
                }
                if(conn!= null){
                    conn.close();
                }
            }
        %>
        
        <a href="../index.jsp" class="header text-success"> <h2 style="text-align: center" class="page-header well">RICANA NIGERIA LIMITED </a>
        <h4 class="text-warning text-center">Change Site Admin Password</h4><br>
        <a href="logout.jsp"><button class="btn btn-outline-success pull-right">Logout</button></a>
        
        <form method="POST" action="siteadmin.jsp">
            <div class="form-group login-form-group">
            <label class="text-success">Old Username:</label>
            <input class="form-control" type="text" name="oldusername" placeholder="Enter your old username" required/>
            <label class="text-success">Old Password:</label>
            <input class="form-control" type="password" name="oldpassword" placeholder="Enter your old password" required/>
            <label class="text-success">New Username:</label>
            <input class="form-control" type="text" name="newusername" placeholder="Enter your new username" required/>
            
            <label class="text-success">New Password:</label>
            <input class="form-control" type="password" name="newpassword" placeholder="Enter your new password" required/>
            <input class="btn btn-outline-success" type="submit" value="Submit">                   
            </div> 
        </form>
        </div>
    </body>
</html>
