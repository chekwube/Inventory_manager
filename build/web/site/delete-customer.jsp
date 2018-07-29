<%-- 
    Document   : delete-customer
    Created on : May 21, 2018, 2:25:20 PM
    Author     : INFOMECTICS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="java.sql.*, general.Connect"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
        <title>Delete Customer</title>
    </head>
    <body class="bg-light">
        <div class="container">
            
        <a href="site.jsp" class="header text-success"> <h2 class="page-header well ">RICANA NIGERIA LIMITED </h2></a>
            <span class="pull-right">
                <a href="logout.jsp"><button class="btn btn-outline-success ">Logout</button></a>
            </span>
        
            <% 
                Connect con = new Connect();
                Connection conn = con.dbConnect();
                String deleteCustomer = request.getParameter("d");
                //int deleteCustomer = Integer.parseInt(d);
                   try{
                       PreparedStatement delItem = conn.prepareStatement("DELETE FROM customer WHERE PhoneNo=?");
                       delItem.setString(1, deleteCustomer);
                       int del = delItem.executeUpdate();
                       response.sendRedirect("customer.jsp");
                                                
                    }catch(Exception ex){
                        ex.printStackTrace();
                    }
                   con.close();
            %>
            <br><hr>
        </div>
    </body>
</html>
