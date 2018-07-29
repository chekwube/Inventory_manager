<%-- 
    Document   : collected
    Created on : May 14, 2018, 11:26:32 AM
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
        <title>Collected Works</title>
    </head>
    <body class="bg-light">
        <div class="container-fluid">
            
        <a href="site.jsp" class="header text-success"> <h2 class="page-header well text-center">RICANA NIGERIA LIMITED </h2></a>
            <span class="pull-right">
                <a href="logout.jsp"><button class="btn btn-outline-success ">Logout</button></a>
            </span>
        
           <br>
            <h4 class="text-warning text-center">Search Collected Works</h4>            
            <table class="table table-condensed">
                <thead>
                <th class="text-success">Search by Customer's name and Date</th>
                <th class="text-success">Search by Date Range </th>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <form method="GET" action="collected.jsp">
                                <label class="text-success">Customer's name:</label>
                                <input class="form-control" type="text" name="customer_name" placeholder="Enter the Customer's name" required/>
                                <label class="text-success">Start date:</label>
                                <input class="form-control" type="date" name="startDate" required/><br>                       
                                <input class="btn btn-outline-success" type="submit" name="searchByName" value="Search"/>
                            </form>
                        </td>
                        <td>
                            <form method="POST" action="collected.jsp" >
                                <label class="text-success">Start date:</label>
                                <input class="form-control" type="date" name="startDate2" required/>
                                <label class="text-success">End date:</label>
                                <input class="form-control" type="date" name="endDate" required/><br>
                                <input class="btn btn-outline-success" type="submit" name="searchByDate" value="Search"/>
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
            <h3 class="text-warning text-center">Collected Works</h3>               
                <table class="table table-bordered table-hover">
                    <thead>
                        <th class="text-warning">Customer's name</th>
                        <th class="text-warning">Phone Number</th>
                        <th class="text-warning">Qty</th>
                        <th class="text-warning">RIC Code</th>
                        <th class="text-warning">Length</th>
                        <th class="text-warning">Width</th>
                        <th class="text-warning">Description of Goods</th>
                        <th class="text-warning">Price(&#x20A6)</th>
                        <th class="text-warning">Amount(&#x20A6)</th>
                        <th class="text-warning">Start Date</th>
                        <th class="text-warning">End Date</th>
                        <th class="text-warning">Done</th>
                        <th class="text-warning">Collected</th>
                    </thead>
                    <tbody>
                    <%
                            Connect con = new Connect();
                            Connection conn = con.dbConnect();                                
                            String customerName = request.getParameter("customer_name"); 
                            String startDate = request.getParameter("startDate");                         
                            String startDate2 = request.getParameter("startDate2");
                            String endDate = request.getParameter("endDate");
                            String submit1 = request.getParameter("searchByName");
                            String submit2 = request.getParameter("searchByDate");
                                
                                if(submit1 != null){
                                    PreparedStatement statement1 = conn.prepareStatement("SELECT * FROM invoice2 WHERE customer_name=? AND start_date>=? AND collected='Yes'" );                
                                    statement1.setString(1, customerName);
                                    statement1.setString(2, startDate);

                                    ResultSet rs1 = statement1.executeQuery();
                                    while(rs1.next()){                       
                    %>              
                                    <tr>
                                        <td class="text-success"><%= rs1.getString(3)%></td>
                                        <td class="text-success"><%= rs1.getString(4)%></td>
                                        <td class="text-success"><%= rs1.getString(8)%></td>
                                        <td class="text-success"><%= rs1.getString(9)%></td>
                                        <td class="text-success"><%= rs1.getString(18)%></td>
                                        <td class="text-success"><%= rs1.getString(19)%></td>
                                        <td class="text-success"><%= rs1.getString(10)%></td>
                                        <td class="text-success"><%= rs1.getString(11)%></td>
                                        <td class="text-success"><%= rs1.getString(12)%></td>
                                        <td class="text-success"><%= rs1.getString(5)%></td>
                                        <td class="text-success"><%= rs1.getString(6)%></td> 
                                        <td class="text-success"><%= rs1.getString(16)%></td>
                                        <td class="text-success"><%= rs1.getString(17)%></td> 
                                    </tr>
                    <%
                                    }  
                                }
                                else if(submit2 != null) {
                                        PreparedStatement statement2 = conn.prepareStatement("SELECT * FROM invoice2 WHERE start_date>=? AND delivery_date<=? AND collected='Yes'");
                                        statement2.setString(1, startDate2);
                                        statement2.setString(2, endDate);
                                        
                                        ResultSet rs2 = statement2.executeQuery();
                                        while(rs2.next()){
                        %>
                                        <tr>
                                            <td class="text-success"><%= rs2.getString(3)%></td>
                                            <td class="text-success"><%= rs2.getString(4)%></td>
                                            <td class="text-success"><%= rs2.getString(8)%></td>
                                            <td class="text-success"><%= rs2.getString(9)%></td>
                                            <td class="text-success"><%= rs2.getString(18)%></td>
                                            <td class="text-success"><%= rs2.getString(19)%></td>
                                            <td class="text-success"><%= rs2.getString(10)%></td>
                                            <td class="text-success"><%= rs2.getString(11)%></td>
                                            <td class="text-success"><%= rs2.getString(12)%></td>
                                            <td class="text-success"><%= rs2.getString(5)%></td>
                                            <td class="text-success"><%= rs2.getString(6)%></td> 
                                            <td class="text-success"><%= rs2.getString(16)%></td>
                                            <td class="text-success"><%= rs2.getString(17)%></td> 
                                        </tr>
                        <%
                                        }
                                }
                                else{
                                    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM invoice2 WHERE collected=?");
                                    stmt.setString(1, "Yes");
                                    ResultSet rs3 = stmt.executeQuery();
                                    while (rs3.next()) {
                        %>
                                        <tr>
                                            <td class="text-success"><%= rs3.getString(3)%></td>
                                            <td class="text-success"><%= rs3.getString(4)%></td>
                                            <td class="text-success"><%= rs3.getString(8)%></td>
                                            <td class="text-success"><%= rs3.getString(9)%></td>
                                            <td class="text-success"><%= rs3.getString(18)%></td>
                                            <td class="text-success"><%= rs3.getString(19)%></td>
                                            <td class="text-success"><%= rs3.getString(10)%></td>
                                            <td class="text-success"><%= rs3.getString(11)%></td>
                                            <td class="text-success"><%= rs3.getString(12)%></td>
                                            <td class="text-success"><%= rs3.getString(5)%></td>
                                            <td class="text-success"><%= rs3.getString(6)%></td> 
                                            <td class="text-success"><%= rs3.getString(16)%></td>
                                            <td class="text-success"><%= rs3.getString(17)%></td> 
                                        </tr>
                        <%
                                    }
                                }
                                con.close();
                        %>
                    </tbody>                                 
                </table>              
            <br><hr>
        </div>
    </body>
</html>
