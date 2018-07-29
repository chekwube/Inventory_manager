<%-- 
    Document   : customer
    Created on : May 11, 2018, 8:26:24 PM
    Author     : INFOMECTICS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" /> 
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="container bg-light">
        <a href="site.jsp" class="header text-success"> <h2 class="page-header well text-center">RICANA NIGERIA LIMITED</h2></a>
        <a href="../index.jsp"><button class="btn btn-outline-success pull-right">Logout</button></a><br><br>

            <%  
                Connect con = new Connect();
                Connection conn = con.dbConnect();
                if(request.getParameter("name")!=null && request.getParameter("phoneNumber")!=null){
                    String customerName = request.getParameter("name");
                    String phone = request.getParameter("phoneNumber");
                    String address = request.getParameter("address");
                    String sex = request.getParameter("sex");
                                               
                        PreparedStatement stmt = conn.prepareStatement("INSERT INTO customer SET Name=?, PhoneNo=?, Address=?, Sex=?");
                            stmt.setString(1, customerName);
                            stmt.setString(2, phone);
                            stmt.setString(3, address);
                            stmt.setString(4, sex);
                            int res = stmt.executeUpdate();
                            
                            if(res == 1){
                                //String uniqueID = java.util.UUID.randomUUID().toString();
                                session.setAttribute("Name",customerName);
                                session.setAttribute("Phone", phone);
                                session.setAttribute("Address", address);
                                //session.setAttribute("UID", uniqueID);                                
                                //response.sendRedirect("invoice.jsp");
                            }
                }
            %>        
       
        <fieldset>
            <legend class="text-warning text-center">Create Customer</legend>
            <form class="offcut-box" method="POST" action="customer.jsp">
                <label class="text-success">Customer Name:</label>
                <input class="form-control" type="text" name="name" placeholder="Enter Customer's name" required/><br>
                <label class="text-success">Phone Number:</label>
                <input class="form-control" type="text" pattern="\d*"  maxlength="11" name="phoneNumber" placeholder="Enter Phone Number" required/><br>
                <label class="text-success">Address:</label>
                <input class="form-control" type="text" name="address" placeholder="Address" /><br>  
                <label class="text-success">Sex</label>
                <input class="form-control" type="text" maxlength="6" name="sex" placeholder="Sex" />                                             
                <input class="btn btn-outline-success" type="submit" name="submit" value="Create"/>    
                <input class="btn btn-outline-default" type="reset" name="reset" value="Reset"/>
            </form>           
        </fieldset>
            <br><br>
        <form method="POST" action="customer.jsp">
           <div class="form-row">
                <div class="col">
                   <input type="text" name="name2" class="form-control" placeholder="Name" required>
                </div>
                <div class="col">
                    <input type="number" name="phone2" class="form-control" placeholder="Phone Number">
                </div>

                <div class="col">
                    <input type="submit" name="search2" class="form-control btn-outline-success" value="Search"/>
                </div>
           </div>
        </form>
        <h3 class="text-warning text-center">Captured Customers</h3>               
                <table class="table table-bordered table-hover">
                    <thead>
                        <th class="text-warning">Name</th>
                        <th class="text-warning">Phone Number</th>
                        <th class="text-warning">Address</th>
                        <th class="text-warning">Sex</th>
                        <th class="text-warning text-center">Action</th>
                    </thead>
                    <tbody>
                        <%
                            String name2 = request.getParameter("name2"); 
                            String phone2 = request.getParameter("phone2");                         
                            
                                if( request.getParameter("search2") != null){                                         
                                        PreparedStatement statement2 = conn.prepareStatement("SELECT * FROM customer WHERE PhoneNo=? ORDER BY Name");
                                        statement2.setString(1, phone2);
                                        ResultSet rs2 = statement2.executeQuery();
                                        while(rs2.next()){                       
                        %>                   
                                            <a>   <tr>
                                                    <td class="text-success"><%= rs2.getString(1) %></td>
                                                    <td class="text-success"><%= rs2.getString(2) %></td>
                                                    <td class="text-success"><%= rs2.getString(3) %></td>
                                                    <td class="text-success"><%= rs2.getString(4) %></td>
                                                    <td>
                                                        <a class="btn btn-danger" href="delete-customer.jsp?d=<%=rs2.getString(2)%>" onclick="return(confirm('Are you sure you want to delete this customer?'))">Delete</a>
                                                    </td>
                                                    <td>
                                                        <form action="invoice.jsp" method="post">
                                                            <%
                                                                String uniqueID = java.util.UUID.randomUUID().toString();
                                                                String name = rs2.getString(1);
                                                                String phone = rs2.getString(2);
                                                                String address = rs2.getString(3);
                                                                session.setAttribute("Name", name);
                                                                session.setAttribute("Phone", phone);
                                                                session.setAttribute("Address", address);
                                                                session.setAttribute("UID", uniqueID);
                                                            %>
                                                            <input class="btn btn-outline-info" type="submit" name="create_invoice" value="Create Invoice" />
                                                        </form>
                                                    </td>
                                            <a/>  </tr>
                        <%
                                        }  
                                    //}
                                }
                                else{
                                        PreparedStatement statement1 = conn.prepareStatement("SELECT * FROM customer ORDER BY Name");
                                        ResultSet rs1 = statement1.executeQuery();
                                        while(rs1.next()){
                        %>
                                            <tr>
                                                <td class="text-success"><%= rs1.getString(1) %></td>
                                                <td class="text-success"><%= rs1.getString(2) %></td>
                                                <td class="text-success"><%= rs1.getString(3) %></td>
                                                <td class="text-success"><%= rs1.getString(4) %></td>
                                                <td>
                                                    <a class="btn btn-danger" href="delete-customer.jsp?d=<%=rs1.getString(2)%>" onclick="return(confirm('Are you sure you want to delete this customer?'))">Delete</a>
                                                </td> 
                                            </tr>
                        <%
                                        }
                                    }
                                        con.close();
                        %>        
                    </tbody>                                 
                </table>              
            <br><hr>
    </body>
</html> 
