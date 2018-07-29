<%-- 
    Document   : fromwarehouse
    Created on : May 8, 2018, 10:49:29 AM
    Author     : INFOMECTICS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>details</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/> 
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="bg-light">
        <div class="container">
            <h2 class="page-header well text-success text-center">RICANA NIGERIA LIMITED</h2>       
            <a href="../index.jsp"><button class="btn btn-outline-success pull-right">Logout</button></a><br><br>
            <h3 class="text-warning text-center">Goods for Production</h3>
            
                <table class="table table-bordered table-hover">
                    <thead>
                        <th class="text-warning">From</th>
                        <th class="text-warning">Ric Code/Item Number</th>
                        <th class="text-warning">Net Quantity</th>
                        <th class="text-warning">Quantity in Stock</th>
                        <th class="text-warning">Description/Width</th>
                        <th class="text-warning">Date of Production</th>
                    </thead>
                    <tbody>
                    <%! int a = 0; int b = 10;%>
                    <%
                        Connect con = new Connect();
                        Connection conn = con.dbConnect();
                        
                        if(request.getParameter("previous")!= null && a!=0){
                            if(a!=0){
                            a-=10;
                            b-=10;
                            System.out.println(a);
                            System.out.println(b);
                        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM rollsforprod LIMIT ?,?");
                        stmt.setInt(1, a);
                        stmt.setInt(2, b);
                        ResultSet rs1 = stmt.executeQuery();
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
                        PreparedStatement stmt2 = conn.prepareStatement("SELECT * FROM cartonsforprod LIMIT ?,?");
                        stmt2.setInt(1, a);
                        stmt2.setInt(2, b);
                        ResultSet rs2 = stmt2.executeQuery();
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
                    } else if(request.getParameter("next")!= null){
                        a+=10;
                        b+=10;
                        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM rollsforprod LIMIT ?,?");
                        stmt.setInt(1, a);
                        stmt.setInt(2, b);
                        ResultSet rs1 = stmt.executeQuery();
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
                        
                        PreparedStatement stmt2 = conn.prepareStatement("SELECT * FROM cartonsforprod LIMIT ?,?");
                        stmt2.setInt(1, a);
                        stmt2.setInt(2, b);
                        ResultSet rs2 = stmt2.executeQuery();
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
                        }else{
                            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM rollsforprod LIMIT 1,10");
                            ResultSet rs1 = stmt.executeQuery();
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
                            PreparedStatement stmt2 = conn.prepareStatement("SELECT * FROM cartonsforprod LIMIT 1,10");
                            ResultSet rs2 = stmt2.executeQuery();
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
                            con.close();             
                        %>
                    </tbody>                                 
                </table>                   
            <br><hr> 
            <div>
            <form method='GET' action='fromwarehouse.jsp'>
                <input class="btn btn-outline-danger" id="prev" type="submit" name="previous" value="previous">
                <input class="btn btn-outline-success" type="submit" name="next" value="next">
            </form>
        </div>
        </div>
        
    </body>
</html>


