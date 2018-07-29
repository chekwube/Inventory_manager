<%-- 
    Document   : updateCollected
    Created on : May 20, 2018, 12:44:39 PM
    Author     : INFOMECTICS
--%>


%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="java.sql.*, general.Connect"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <title>Update Collected</title>
    </head>
    <body class="bg-light">
        <div class="container">
            
        <a href="site.jsp" class="header text-success"> <h2 class="page-header well ">RICANA NIGERIA LIMITED </a>
            <span class="pull-right">
                <a href="logout.jsp"><button class="btn btn-outline-success ">Logout</button></a>
            </span>
        </h2>
            <%
                Connect con = new Connect();
                Connection conn = con.dbConnect();
                String uc = request.getParameter("uc");
                   try{
                       PreparedStatement updateDone = conn.prepareStatement("Update invoice2 SET collected='Yes' WHERE invoice_id=?");
                       updateDone.setString(1, uc);
                       updateDone.executeUpdate();
                       response.sendRedirect("done.jsp");
                    }catch(Exception ex){
                        ex.printStackTrace();
                    }
                   con.close();
            %>
            <br><hr>
        </div>
    </body>
</html>
