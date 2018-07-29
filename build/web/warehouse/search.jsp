<%-- 
    Document   : search
    Created on : May 10, 2018, 4:24:26 PM
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
        <title>warehouse</title>
    </head>
    <body class="bg-light">
        <div class="container">      
        <a href="warehouseManager.jsp" class="header text-success"> <h2 class="page-header well text-center">RICANA NIGERIA LIMITED </h2></a>
            <span class="pull-right">
                <a href="logout.jsp"><button class="btn btn-outline-success ">Logout</button></a>
            </span>
           <br>
            <h4 class="text-warning text-center">Type in the details you want to search with</h4>            
            <table class="table table-condensed">
                <thead>
                <th class="text-success">Search Goods in Rolls</th>
                <th class="text-success">Search Goods in Cartons</th>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <form method="GET" action="search.jsp">
                                <label class="text-success">Warehouse:</label>
                                <select class="form-control" name="warehouse1" required>
                                    <option> </option>                           
                                    <option name="warehouse1">warehouse1</option>
                                    <option name="warehouse1">warehouse2</option>
                                    <option name="warehouse1">warehouse3</option>
                                    <option name="warehouse1">warehouse4</option>
                                    <option name="warehouse1">warehouse5</option>                                    
                                </select>
                                <label class="text-success">Quantity to search for:</label>
                                <input class="form-control" type="number" name="quantity" placeholder="Enter the quantity you want to search for" required/><br><br>                       
                                <input class="btn btn-outline-success" type="submit" name="submit1" value="Search"/>
                            </form>
                        </td>
                        <td>
                            <form method="GET" action="search.jsp" >
                                <label class="text-success">Warehouse:</label>
                                <select class="form-control" name="warehouse2" required>
                                    <option> </option>                           
                                    <option name="warehouse2">warehouse1</option>
                                    <option name="warehouse2">warehouse2</option>
                                    <option name="warehouse2">warehouse3</option>
                                    <option name="warehouse2">warehouse4</option>
                                    <option name="warehouse2">warehouse5</option>                                    
                                </select>
                                <label class="text-success">Quantity to search for:</label>
                                <input class="form-control" type="number" name="qty" placeholder="Enter the quantity of you want to search for" required/><br><br>
                                <input class="btn btn-outline-success" type="submit" name="submit2" value="Search"/>
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>
                                   
            <h3 class="text-warning text-center">Search Result</h3>               
                <table class="table table-bordered table-hover">
                    <thead>
                        <th class="text-warning">Warehouse</th>
                        <th class="text-warning">Ric Code/Item Number</th>
                        <th class="text-warning">Fabric Quantity</th>
                        <th class="text-danger">Quantity in Stock</th>
                        <th class="text-warning">Width/Description</th>
                        <th class="text-warning">Date of Production</th>
                    </thead>
                    <tbody>
                        <%  
                            Connect con = new Connect();
                            Connection conn = con.dbConnect();
                            String whouse1 = request.getParameter("warehouse1"); 
                            String whouse2 = request.getParameter("warehouse2");                         
                            String quantity = request.getParameter("quantity");
                            String quantity2 = request.getParameter("qty");
                            String submit1 = request.getParameter("submit1");
                            String submit2 = request.getParameter("submit2");

                            if(request.getParameter("submit1") != null){   
                                if(quantity != null){ 
                                    PreparedStatement statement1 = conn.prepareStatement("SELECT * FROM rolls WHERE number_value<=? AND warehouse=? ORDER BY number_value");
                                    statement1.setString(1, quantity);
                                    statement1.setString(2, whouse1);
                                    ResultSet rs1 = statement1.executeQuery();
                                    while(rs1.next()){                       
                        %>                   
                                        <tr>
                                            <td class="text-success"><%= rs1.getString(1) %></td>
                                            <td class="text-success"><%= rs1.getString(2) %></td>
                                            <td class="text-success"><%= rs1.getInt(4) %></td>
                                            <td class="text-success"><%= rs1.getInt(6) %></td>
                                            <td class="text-success"><%= rs1.getInt(3) %></td>
                                            <td class="text-success"><%= rs1.getDate(5) %></td>                            
                                        </tr>
                        <%
                                    }  
                                }
                            }
                            else{
                                PreparedStatement statement2 = conn.prepareStatement("SELECT * FROM cartons WHERE number_values<=? AND warehouse=? ORDER BY number_values");
                                statement2.setString(1, quantity2);
                                statement2.setString(2, whouse2);
                                ResultSet rs2 = statement2.executeQuery();
                                while(rs2.next()){
                        %>
                                    <tr>
                                        <td class="text-success"><%= rs2.getString(1) %></td>
                                        <td class="text-success"><%= rs2.getString(3) %></td>
                                        <td class="text-success"><%= rs2.getInt(4) %></td>
                                        <td class="text-success"><%= rs2.getInt(6) %></td>
                                        <td class="text-success"><%= rs2.getString(2) %></td>
                                        <td class="text-success"><%= rs2.getDate(5) %></td>                            
                                    </tr>
                        <%
                                }
                            }
                            if(conn != null){
                                con.close();
                            }
                        %>        
                    </tbody>                                 
                </table>              
            <br><hr>
        </div>
    </body>
</html>

