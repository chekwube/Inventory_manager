<%-- 
    Document   : create-receipt
    Created on : May 14, 2018, 12:07:52 PM
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
        <title>Invoice</title>
    </head>
    <body class="bg-light">
        <div class="container">

            <a href="site.jsp" class="header text-success"> <h2 class="page-header well ">RICANA NIGERIA LIMITED</h2> </a>
            <span class="pull-right">
                <a href="../warehouse/logout.jsp"><button class="btn btn-outline-success ">Logout</button></a>
            </span>
            
                
        <%
            Connect con = new Connect();
            Connection conn = con.dbConnect();

            String customerName = (String) session.getAttribute("Name");
            String phone = (String) session.getAttribute("Phone");
            String address = (String) session.getAttribute("Address");
            String uniqueID = (String) session.getAttribute("UID");
            long millis = System.currentTimeMillis();
            Date date = new Date(millis);
        %>

        <h5 class="text-primary">Name: <%= customerName%></h5> 
        <h5 class="text-primary">Phone: <%= phone%></h5> 
        <h5 class="text-primary">Address: <%= address%></h5> 
        <h5 class="text-primary">Date: <%= date%></h5>
        <h5 class="text-primary">Invoice No: <%= uniqueID%></h5>
        <hr>
        
        <form method="POST" action="invoice.jsp">
            <div class="form-row">
                <div class="col">
                    <input type="number" name="qty" class="form-control" placeholder="Qty" required>
                </div>
                <div class="col">
                    <input type="text" name="ric_code" class="form-control" placeholder="RIC Code" required>
                </div>
                <div class="col">
                    <input type="number" name="width" class="form-control" placeholder="Width" required>
                </div>
                <div class="col">
                    <input type="number" name="length" class="form-control" placeholder="Length" required>
                </div>
                <div class="col-5">
                    <input type="text" name="description" class="form-control" placeholder="Description of Goods">
                </div>
                <div class="col-2">
                    <input type="submit" name="add_item" class="form-control btn-outline-success" value="Add"/>
                </div>
            </div>
        </form>

        <h3 class="text-warning text-center">Invoice</h3>               
        <table class="table table-bordered table-hover">
            <thead>
                <th class="text-warning">Qty</th>
                <th class="text-warning">RIC Code</th>
                <th class="text-warning">Width</th>
                <th class="text-warning">Length</th>
                <th class="text-warning">Square Meter</th>
                <th class="text-warning">Description of Goods</th>
                <th class="text-warning">Price(&#x20A6)</th>
                <th class="text-warning">Amount(&#x20A6)</th>
                <th class="text-warning">Action</th>
            </thead>
            <tbody>
                <%
                    String getID = uniqueID;
                    String qty = request.getParameter("qty");
                    String ric_code = request.getParameter("ric_code");
                    String description = request.getParameter("description");
                    String width = request.getParameter("width");
                    String length = request.getParameter("length");
                   
                    String addItemButton = request.getParameter("add_item"); 
                    
                    double squareMeter = 0.0;
                    
                    //Add to the dtatabase
                    if (addItemButton != null) {
                       //I loook for the ricCode cost of code in the total table
                       //int cost = 0;
                       int price = 0;
                       double amount = 0;
                       //int width2 = Int
                       
                       PreparedStatement costStmt = conn.prepareStatement("SELECT cost from total WHERE ric_code='"+ric_code+"'");
                       ResultSet rs = costStmt.executeQuery();
                       while(rs.next()){
                           price = rs.getInt(1);
                           //if(price )
                       }
                       double widthInMeter = (double)(Integer.parseInt(width)) /1000;
                       double lengthInMeter = (double)(Integer.parseInt(length)) /1000;
                       
                       if(widthInMeter <1 && lengthInMeter < 1){
                           widthInMeter = 1.0;
                           lengthInMeter = 1.0;
                       }
                       else if(widthInMeter < 1 ){
                           widthInMeter = 1.0;
                       }
                       else if(lengthInMeter < 1){
                           lengthInMeter = 1.0;
                       } 
                       squareMeter = Integer.parseInt(qty) * (widthInMeter + lengthInMeter);
                       amount = (double)(Integer.parseInt(qty) * widthInMeter * lengthInMeter * price); 
                       
                       if(amount == 0){ %>
                            <p style="color: red">This RIC code <%=ric_code%> does not exist</p>
                      <% }else{
                   
                        //break;
                        PreparedStatement stmt = conn.prepareStatement("INSERT INTO invoice2 SET invoice_id=?, start_date=?, qty=?, ric_code=?, description=?, customer_name=?, phone=?, address=?, price=?, amount=?, length=?, width=?, squareMeter=?");
                        stmt.setString(1, uniqueID);
                        stmt.setDate(2, date);
                        stmt.setString(3, qty);
                        stmt.setString(4, ric_code);
                        stmt.setString(5, description);
                        stmt.setString(6, customerName);
                        stmt.setString(7, phone);
                        stmt.setString(8, address);
                        stmt.setInt(9, price);
                        stmt.setDouble(10, amount);
                        stmt.setString(11, length);
                        stmt.setString(12, width);
                        stmt.setDouble(13, squareMeter);
                        stmt.executeUpdate();
                    }
                }
                        //Display the Items entered for a particular cusomer-->
                        PreparedStatement stmt2 = conn.prepareStatement("SELECT * FROM invoice2 WHERE invoice_id=?");
                        stmt2.setString(1, getID);
                        ResultSet rs1 = stmt2.executeQuery();
                        while (rs1.next()) {
                %>                   
                            <tr>
                                <td class="text-success"><%= rs1.getString(8)%></td>
                                <td class="text-success"><%= rs1.getString(9)%></td>
                                <td class="text-success"><%= rs1.getString(19)%></td>
                                <td class="text-success"><%= rs1.getString(18)%></td>
                                <td class="text-success"><%= rs1.getString(20) %></td>
                                <td class="text-success"><%= rs1.getString(10)%></td>
                                <td class="text-success"><%= rs1.getString(11)%></td>
                                <td class="text-success"><%= rs1.getString(12)%></td>
                                <td class="text-center">
                                    <a href="delete.jsp?d=<%=rs1.getString("id")%>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this item?');">Delete</a>
                                </td>
                            </tr>
                        <%} %>
            </tbody>                                 
        </table>
            <%
                int total = 0;
                PreparedStatement total_stmt = conn.prepareStatement("SELECT SUM(amount)FROM invoice2 WHERE invoice_id=?");
                total_stmt.setString(1,uniqueID);
                ResultSet total_res = total_stmt.executeQuery();
                while(total_res.next()){
            %>
                    <div class="row">
                        <div class="col-md-5 offset-md-9">
                            <br>
                            <% total = total_res.getInt(1); %>
                            <h5 class="text-primary">Total: &#x20A6 <%= total_res.getString(1)%></h5>
                        </div>
                    </div>
            <%
                }
            %>
            <form method="POST" action="invoice.jsp">
                <div class="form-col offset-md-9">
                    <div class="col">
                        <input type="number" name="pay" class="form-control" placeholder="Amount deposited" required>
                    </div>
                    <div class="col">
                        <input type="date" name="delivery_date" class="form-control" placeholder="Delivery date" required>
                    </div>
                    <div class="col-2">
                       <input type="submit" name="deposit" class="form-control btn-outline-success" value="Deposit"/>
                    </div>
                </div>
            </form>
            <%
                int deposit = 0;
                int balance = 0;
                String delivery_date = "";
                String depositButton = request.getParameter("deposit");
                 if(depositButton != null){
                     String depo = request.getParameter("pay");
                     delivery_date = request.getParameter("delivery_date");
                     
                     deposit = Integer.parseInt(depo); //amount deposited by the customer
                     
                     balance = total - deposit;
            %>
                <div class="row">
                        <div class="col-md-5 offset-md-9">
                            <br>
                            <h5 class="text-primary">Total: &#x20A6 <%= total%></h5> 
                            <h5 class="text-primary">Paid: &#x20A6 <%= deposit%></h5>
                            <h5 class="text-primary">Balance: &#x20A6 <%= balance%></h5>
                            <h5 class="text-primary">Delivery date: <%= delivery_date%></h5>
                        </div>
                 </div>
            <%
                }
                con.close();
            %>
            
            <%
                session.setAttribute("Date", date);
                session.setAttribute("ID", uniqueID);
                session.setAttribute("Total", total);
                session.setAttribute("Deposit", deposit);
                session.setAttribute("Balance", balance );
                session.setAttribute("Delivery", delivery_date);
            %>
            <a class="btn btn-large btn-success" href="print.jsp" onclick="return(confirm('Have you entered the DELIVERY DATE and DEPOSIT?'))">Proceed to Print Invoice</a>
        <br><hr>
    </div>
            
</body>
</html>
