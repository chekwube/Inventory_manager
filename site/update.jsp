<%-- 
    Document   : update
    Created on : Apr 10, 2018, 3:51:32 PM
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect" %>
<%@page import="java.util.Date" %>

<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update invoice</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/> 
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" /> 
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="container bg-light">
        <%
            Connect con = new Connect();
            Connection conn = con.dbConnect();
            String submit = request.getParameter("submit");
            Date today = new Date();
            if(submit != null){
                String name = request.getParameter("customer_name");            
                String dep = request.getParameter("paid");
                String complete = request.getParameter("done"); 
                if(name!=null && dep!=null){                       
                    try{
                        if(complete!=null){
                            PreparedStatement stmt1 = conn.prepareStatement("UPDATE invoice SET deposit=deposit+?, balance=balance-?, done='YES' WHERE customer=?");
                            stmt1.setString(1, dep);
                            stmt1.setString(2, dep);
                            stmt1.setString(3, name);
                            stmt1.executeUpdate();
                        }else{
                            PreparedStatement stmt2 = conn.prepareStatement("UPDATE invoice SET deposit=deposit+?, balance=balance-? WHERE customer=?"); 
                            stmt2.setString(1, dep);
                            stmt2.setString(2, dep);
                            stmt2.setString(3, name);
                            stmt2.executeUpdate();
                        }
                    }catch(Exception e){
                        System.out.println(e);
                    }  
                }
            }
            con.close();
        %>
        <a href="site.jsp"> <h2 class="page-header well well-lg text-success">RICANA NIGERIA LIMITED</h2> </a>
        <h4 class="text-warning text-center">Update Invoice</h3><hr>
        <form method="POST" action="update.jsp" class="invoice-update">
            <label class="text-success">Customer name</label>
            <input class="form-control" type="text" name="customer_name" placeholder="Enter customer name here" required/>                         
            <label class="text-success">Amount deposited</label>
            <input class="form-control" type="number" name="paid" placeholder="Enter the amount deposited" required/>
            
            <p class="text-success"><input class="form-control" type="checkbox" name="done"/>Has the work been completed?</p>
            <input class="form-control btn btn-outline-success" type="submit" name="submit" value="Update invoice"/>
        </form><br>
        
    </body>
</html>
