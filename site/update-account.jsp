<%-- 
    Document   : update-account
    Created on : May 21, 2018, 2:05:45 AM
    Author     : INFOMECTICS
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
            
            PreparedStatement stmt;
            String invoice_id = request.getParameter("iid");
            String data = "Select * from accounting where invoice_id='"+invoice_id+"'";
            stmt = conn.prepareStatement(data);
            ResultSet rs = stmt.executeQuery();
            
            while(rs.next()){
        %>
        <a href="site.jsp"> <h2 class="page-header well well-lg text-success">RICANA NIGERIA LIMITED</h2> </a>
        <h4 class="text-warning text-center">Update Payment</h3><hr>
        <form method="GET" action="update-account.jsp" class="invoice-update">
            <label class="text-success">Customer name</label>
            <input class="form-control" type="text" name="customer_name" placeholder="<%= rs.getString("customer_name") %>" readonly="readonly"/> 
            <label class="text-success">Invoice No</label>
            <input class="form-control" type="text" name="iid" value="<%= rs.getString("invoice_id") %>" readonly="readonly"/> 
            <label class="text-success">Total</label>
            <input class="form-control" type="text" name="total" placeholder="<%= rs.getString("total") %>" readonly="readonly"/> 
            <label class="text-success">Amount Deposited</label>
            <input class="form-control" type="text" name="deposit" value="<%= rs.getString("paid") %>" readonly="readonly"/> 
            <label class="text-success">Balance</label>
            <input class="form-control" type="text" name="balance" value="<%= rs.getString("balance") %>" readonly="readonly"/> 
            <label class="text-success">Pay-up the Balance</label>
            <input class="form-control" type="number" name="pay" value="<%= rs.getString("balance") %>" placeholder="Kindly Pay-up" required/>
           
            <input class="form-control btn btn-outline-success" type="submit" name="submit" value="Update Payment"/>
        </form><br>
        <% } %>
    </body>
</html>
<%
    //subract form balance; add to deposit
    String invoiceID = request.getParameter("iid");
    String depo = request.getParameter("deposit");
    String bal = request.getParameter("balance");
    String pay = request.getParameter("pay");
    String submit = request.getParameter("submit");
    
    int deposit = 0;
    int balance = 0;
    int payUp = 0;
    
    if(submit != null){
        if(depo != null && bal != null && pay != null){
            //convert to integers
            deposit = Integer.parseInt(depo);
            balance = Integer.parseInt(bal);
            payUp = Integer.parseInt(pay);
            
            int updateBalance = balance - payUp;
            int updateDeposit = deposit + payUp;
            
            PreparedStatement updateStmt = conn.prepareStatement("UPDATE invoice2 SET paid=?, balance=? WHERE invoice_id=?");
            updateStmt.setInt(1, updateDeposit);
            updateStmt.setInt(2, updateBalance);
            updateStmt.setString(3, invoiceID);
            updateStmt.executeUpdate();
            
            response.sendRedirect("account.jsp");
        }
        
    }
    con.close();
    
%>
