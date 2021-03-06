<%-- 
    Document   : cartons
    Created on : Apr 26, 2018, 9:07:05 AM
    Author     : INFOMECTICS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.*" %>
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
            <h2 class="page-header well text-success">RICANA NIGERIA LIMITED </h2>
                <span class="">
                    <a href="cartonstoproduction.jsp"><button class= "btn btn-outline-success pull-left">Take Goods(Cartons) to Production</button></a>
                    <a href="logout.jsp"><button class="btn btn-outline-success pull-right">Logout</button></a>
                </span>
            
            <br><br>
            <h3 class="text-warning text-center">Goods in Cartons</h3>
            
            <table class="table table-bordered table-hover">
                    <thead>
                    <th class="text-warning">Warehouse</th>
                    <th class="text-warning">Item Number</th>
                    <th class="text-warning">Description</th>
                    <th class="text-warning">Net Quantity</th>
                    <th class="text-warning">Date of Production</th> 
                    <th class="text-warning">Number of Cartons</th> 
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
                            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM cartons LIMIT ?,?");
                            stmt.setInt(1, a);
                            stmt.setInt(2, b);
                    ResultSet rs1 = stmt.executeQuery();
                    while(rs1.next()){ 
                    %>                   
                        <tr>
                            <td class="text-success"><%= rs1.getString(1) %></td>
                            <td class="text-success"><%= rs1.getString(3) %></td>
                            <td class="text-success"><%= rs1.getString(2) %></td>
                            <td class="text-success"><%= rs1.getInt(4) %></td>
                            <td class="text-success"><%= rs1.getDate(5) %></td>
                            <td class="text-success"><%= rs1.getInt(6) %></td>
                        </tr>
                        <%
                            }
                            
                        }
                    }else if(request.getParameter("next")!= null){
                            a+=10;
                            b+=10;

                            System.out.println(a);
                            System.out.println(b);

                            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM cartons LIMIT ?,?");
                            stmt.setInt(1, a);
                            stmt.setInt(2, b);
                            ResultSet rs1 = stmt.executeQuery();
                        while(rs1.next()){                       
                    %>                   
                        <tr>
                            <td class="text-success"><%= rs1.getString(1) %></td>
                            <td class="text-success"><%= rs1.getString(2) %></td>
                            <td class="text-success"><%= rs1.getInt(3) %></td>
                            <td class="text-success"><%= rs1.getInt(4) %></td>
                            <td class="text-success"><%= rs1.getDate(5) %></td> 
                            <td class="text-success"><%= rs1.getInt(6) %></td> 
                        </tr>
                        <%
                            }
                        }
                        else{
                            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM cartons LIMIT 1,10");
                            ResultSet rs1 = stmt.executeQuery();
                            while(rs1.next()){                       
                        %>                   
                        <tr>
                            <td class="text-success"><%= rs1.getString(1) %></td>
                            <td class="text-success"><%= rs1.getString(2) %></td>
                            <td class="text-success"><%= rs1.getInt(3) %></td>
                            <td class="text-success"><%= rs1.getInt(4) %></td>
                            <td class="text-success"><%= rs1.getDate(5) %></td> 
                            <td class="text-success"><%= rs1.getInt(6) %></td> 
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
        <div>
            <form method='GET' action='cartons.jsp'>
                <input class="btn btn-outline-danger" id="prev" type="submit" name="previous" value="previous">
                <input class="btn btn-outline-success" type="submit" name="next" value="next">
            </form>
        </div>    
        </div>
        
    </body>
</html>
