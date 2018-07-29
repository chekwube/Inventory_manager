<%-- 
    Document   : add
    Created on : Apr 10, 2018, 3:49:44 PM
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Invoice</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" /> 
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="container bg-light">
    <%
            Connect con = new Connect();
            Connection conn = con.dbConnect();
            
            String name = request.getParameter("customer_name");
            String amnt = request.getParameter("amount");
            String wth1 = request.getParameter("width");
            String lth1 = request.getParameter("length");
            String start_date = request.getParameter("date1");
            String stop_date = request.getParameter("date2");
            String describe = request.getParameter("describe");
            
            if(name!=null && amnt!=null && wth1!=null && lth1!=null && start_date!=null && stop_date!=null && describe!=null){
            try{
            PreparedStatement stmt2 = conn.prepareStatement("SELECT cost FROM total WHERE ric_code=?");
            stmt2.setString(1, amnt); 
            ResultSet rs = stmt2.executeQuery();
            int cost = 0;
            if(rs.next()){
                cost = rs.getInt(1); 
            }
            
            int wth = Integer.parseInt(wth1);
            int lth = Integer.parseInt(lth1);
            int dep = 0;
            int price = (wth * lth * cost);
                    
            PreparedStatement stmt1 = conn.prepareStatement("INSERT INTO invoice VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");                       
            stmt1.setString(1,name);
            stmt1.setInt(2,price);
            stmt1.setInt(3,wth);
            stmt1.setInt(4,lth);
            stmt1.setInt(5,dep);
            stmt1.setInt(6,price);
            stmt1.setString(7,start_date);
            stmt1.setString(8,stop_date);
            stmt1.setString(9,"NO");
            stmt1.setString(10, describe);

            stmt1.executeUpdate();
            }catch(Exception e){
                System.out.println(e);
            }  
        }
        con.close();
        %>
        <a href="site.jsp"><h2 class="page-header well text-success">RICANA NIGERIA LIMITED</h2></a><br>
        <h3 class="text-warning text-center">Add Customer's Work Details</h3>
        <form method="POST" action="add.jsp" class="add-goods-warehouse">
            <label class="text-success">Customer name</label>
            <input class="form-control" type="text" name="customer_name" placeholder="Enter customer name here" required/>               
            <label class="text-success">RIC Code</label>
            <input class="form-control" type="text" name="amount" placeholder="Enter the RIC Code here" required/>
            <label class="text-success">Description:</label>
            <input class="form-control" type="text" name="describe" placeholder="Enter the description" required/>           
            <label class="text-success">Width</label>
            <input class="form-control" type="number" name="width" placeholder="Enter the width value here" required/>
            <label class="text-success">Length</label>
            <input class="form-control" type="number" name="length" placeholder="Enter the length value here" required/>
            <label class="text-success">Date to Start</label>
            <input class="form-control date" type="date" name="date1" placeholder="Enter the date for work to be ready" required/> 
            <label class="text-success">Date to Deliver</label>
            <input class="form-control date" type="date" name="date2" placeholder="Enter the date for work to be ready" required/>           
            <input class="form-control btn btn-outline-success" type="submit" name="submit" value="Create invoice"/>
            <p><br></p>
        </form>
        <br>
    </body>
</html>
