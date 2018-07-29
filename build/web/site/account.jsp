<%-- 
    Document   : account
    Created on : May 20, 2018, 2:08:13 PM
    Author     : INFOMECTICS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/> 
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="bg-light">
        <div class="container">
            <a href="site.jsp" class="header text-success"> <h2 class="page-header well text-center">RICANA NIGERIA LIMITED </h2></a>
                <span class="pull-right">

                </span>
        <a href="../index.jsp"><button class="btn btn-outline-success pull-right">Logout</button></a><br>                         
            <br>
            <h3 class="text-warning text-center">Payment Details</h3>               
                <table class="table table-bordered table-ho+ver">
                    <thead>
                        <th class="text-warning">Customer's name</th>
                        <th class="text-warning">Phone Number</th>
                        <th class="text-warning">Invoice No</th>
                        <th class="text-warning">Start Date</th>
                        <th class="text-warning">End Date</th>
                        <th class="text-warning">Total</th>
                        <th class="text-warning">Deposit</th>
                        <th class="text-warning">Balance</th>
                        <th class="text-warning">Action</th>
                    </thead>
                    <tbody>
                    <%! int a = 0; int b = 10;%>
                    <%
                        Connect con = new Connect();
                        Connection conn = con.dbConnect();
                        PreparedStatement stmt2 = conn.prepareStatement("INSERT INTO accounting (customer_name, phone, invoice_id, start_date, delivery_date, total, paid, balance) "
                                + "                                     SELECT DISTINCT customer_name, phone, invoice_id, start_date, delivery_date, total, paid, balance FROM invoice2;");
                        stmt2.executeUpdate();

                        PreparedStatement stmt3 = conn.prepareStatement("DELETE t1 from accounting t1 inner join accounting t2 where t1.id <t2.id and t1.invoice_id = t2.invoice_id");
                        stmt3.executeUpdate();

                        if(request.getParameter("previous")!= null && a!=0){
                            if(a!=0){
                            a-=10;
                            b-=10;
                            
                        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM accounting LIMIT ?,?");
                        stmt.setInt(1, a);
                        stmt.setInt(2, b);
                        ResultSet rs1 = stmt.executeQuery();
                        while (rs1.next()) {
                    %>                   
                            <tr>
                                <td class="text-success"><%= rs1.getString(2)%></td>
                                <td class="text-success"><%= rs1.getString(3)%></td>
                                <td class="text-success"><%= rs1.getString(4)%></td>
                                <td class="text-success"><%= rs1.getString(5)%></td>
                                <td class="text-success"><%= rs1.getString(6)%></td>
                                <td class="text-success"><%= rs1.getString(7)%></td>
                                <td class="text-success"><%= rs1.getString(8)%></td>
                                <td class="text-success"><%= rs1.getString(9)%></td> 
                                <td>
                                    <a href="update-account.jsp?iid=<%= rs1.getString(4)%>" class="btn btn-warning" onclick="return(confirm('Update Payment?'))">Pay</a>
                                </td>
                            </tr>
                        <% } }}else if(request.getParameter("next")!= null){
                            a+=10;
                            b+=10;
                            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM accounting LIMIT ?,?");
                            stmt.setInt(1, a);
                            stmt.setInt(2, b);
                            ResultSet rs1 = stmt.executeQuery();
                        while (rs1.next()) {
                    %>                   
                            <tr>
                                <td class="text-success"><%= rs1.getString(2)%></td>
                                <td class="text-success"><%= rs1.getString(3)%></td>
                                <td class="text-success"><%= rs1.getString(4)%></td>
                                <td class="text-success"><%= rs1.getString(5)%></td>
                                <td class="text-success"><%= rs1.getString(6)%></td>
                                <td class="text-success"><%= rs1.getString(7)%></td>
                                <td class="text-success"><%= rs1.getString(8)%></td>
                                <td class="text-success"><%= rs1.getString(9)%></td> 
                                <td>
                                    <a href="update-account.jsp?iid=<%= rs1.getString(4)%>" class="btn btn-warning" onclick="return(confirm('Update Payment?'))">Pay</a>
                                </td>
                            </tr>
                        <% } }else{
                                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM accounting LIMIT 0,10");
                                ResultSet rs1 = stmt.executeQuery();
                                while (rs1.next()) {
                    %>                   
                            <tr>
                                <td class="text-success"><%= rs1.getString(2)%></td>
                                <td class="text-success"><%= rs1.getString(3)%></td>
                                <td class="text-success"><%= rs1.getString(4)%></td>
                                <td class="text-success"><%= rs1.getString(5)%></td>
                                <td class="text-success"><%= rs1.getString(6)%></td>
                                <td class="text-success"><%= rs1.getString(7)%></td>
                                <td class="text-success"><%= rs1.getString(8)%></td>
                                <td class="text-success"><%= rs1.getString(9)%></td> 
                                <td>
                                    <a href="update-account.jsp?iid=<%= rs1.getString(4)%>" class="btn btn-warning" onclick="return(confirm('Update Payment?'))">Pay</a>
                                </td>
                            </tr>
                        <% }
                        }
                            con.close();
                        %>
                    </tbody>                                 
                </table>              
            <br><hr>
            <div>
            <form method='GET' action='account.jsp'>
                <input class="btn btn-outline-danger" id="prev" type="submit" name="previous" value="previous">
                <input class="btn btn-outline-success" type="submit" name="next" value="next">
            </form>
        </div>
        </div>
        
    </body>
</html>