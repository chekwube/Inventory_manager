<%-- 
    Document   : print
    Created on : May 18, 2018, 11:08:17 AM
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
        <style type="text/css" media="print">
            @page {
                size: auto;   /* auto is the initial value */
                margin: 0;  /* this affects the margin in the printer settings */
            }
        </style>
        <title>Print</title>
    </head>
    <body class="bg-light">
        <div class="container">
            
                <a href="site.jsp" class="header text-success"> <h2 class="page-header well ">RICANA NIGERIA LIMITED </a></h2>
            <%
                Connect con = new Connect();
                Connection conn = con.dbConnect();
                String customerName = (String) session.getAttribute("Name");
                String phone = (String) session.getAttribute("Phone");
                String address = (String) session.getAttribute("Address");
                //String uniqueID = (String) session.getAttribute("UID");
                
                String id = session.getAttribute("ID").toString();
                String total = session.getAttribute("Total").toString();
                String deposit = session.getAttribute("Deposit").toString();
                String balance = session.getAttribute("Balance").toString();
                String delivery_date = (String) session.getAttribute("Delivery");
                
                   try{
                       //update the table with the data
                       PreparedStatement stmt = conn.prepareStatement("UPDATE invoice2 SET  delivery_date=?, total=?, paid=?, balance=? WHERE invoice_id=?");
                        stmt.setString(1, delivery_date);
                        stmt.setString(2, total);
                        stmt.setString(3, deposit);
                        stmt.setString(4, balance);
                        stmt.setString(5, id);
                        stmt.executeUpdate();
                                                
                    }catch(Exception ex){
                        ex.printStackTrace();
                    } 
                
                PreparedStatement stmt10 = conn.prepareStatement("SELECT * FROM invoice2 WHERE invoice_id=?");
                stmt10.setString(1, id);
                ResultSet rs10 = stmt10.executeQuery();
                    if(rs10.next()) {
            %>
                        <h6>Name: <%= rs10.getString(3)%></h6> 
                        <h6>Phone: <%= rs10.getString(4)%></h6> 
                        <h6>Address: <%= rs10.getString(7)%></h6> 
                        <h6>Date:<%= rs10.getString(5) %> </h6>
                        <h6>Invoice No: <%= id%></h6>
                <%} %>
            <hr>
            <h3 class="text-center">Invoice</h3>               
        <table class="table table-bordered table-hover">
            <thead>
                <th>Qty</th>
                <th>RIC Code</th>
                <th>Length</th>
                <th>Width</th>
                <th>Description of Goods</th>
                <th>Price</th>
                <th>Amount(&#x20A6)</th>
            </thead>
            <tbody>
                <%
                    PreparedStatement stmt2 = conn.prepareStatement("SELECT * FROM invoice2 WHERE invoice_id=?");
                    stmt2.setString(1, id);
                    ResultSet rs1 = stmt2.executeQuery();
                                       
                    while(rs1.next()) {
                %>                   
                            <tr>
                                <td><%= rs1.getString(8)%></td>
                                <td><%= rs1.getString(9)%></td>
                                <td><%= rs1.getString(18)%></td>
                                <td><%= rs1.getString(19)%></td>
                                <td><%= rs1.getString(10)%></td>
                                <td><%= rs1.getString(11)%></td>
                                <td><%= rs1.getString(12)%></td>
                            </tr>
                        <%} %>
            </tbody>                                 
        </table>
            
            <div class="row">
                <div class="col-md-3" >
                    <button class="btn btn-outline-success" onclick="print()" id="print">Print this Invoice</button>
           
                </div>
                <div class="col-md-3 offset-md-9">
                    <h6>Total: &#x20A6 <%= total%></h6>
                    <h6>Deposit: &#x20A6 <%=deposit %></h6>
                    <h6>Balance: &#x20A6 <%= balance %></h6>
                    <h6>Delivery Date: <%= delivery_date %></h6>
                </div>
            </div>
            
            
            <br><hr>
    </div>
            
            <script>
                const print = () => {
                    const btn = document.getElementById('print');
                    btn.style.display = 'none';
                    window.print();  
                };
            </script>
    </body>
</html>
