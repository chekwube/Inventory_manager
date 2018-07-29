<%-- 
    Document   : warehouse2
    Created on : May 7, 2018, 5:55:46 PM
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
            <a h 
               ref="warehouseManager.jsp" class="header text-success"> <h2 class="page-header well text-center">RICANA NIGERIA LIMITED </h2></a>
                <span>
                        <a href="create.jsp"><button class="btn btn-outline-success pull-left">Add goods to warehouse</button></a>
                    <a href="logout.jsp"><button class="btn btn-outline-success pull-right">Logout</button></a>
                </span>
            <br><br><br>
            <h3 class="text-warning text-center">Goods in Warehouse 1</h3> 
           <table class="table table-bordered table-hover">
                    <thead>
                    <th class="text-warning">Ric Code/Item Number</th>
                    <th class="text-warning">Fabric Quantity</th>
                    <th class="text-danger">Quantity in Stock</th>
                    <th class="text-warning">Width/Description</th>
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
                            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM rolls where warehouse='warehouse1' LIMIT ?,?");
                            stmt.setInt(1, a);
                            stmt.setInt(2, b);
                        ResultSet rs1 = stmt.executeQuery();
                        while(rs1.next()){      
                    %>                   
                        <tr>
                            <td class="text-success"><%= rs1.getString(2) %></td>
                            <td class="text-success"><%= rs1.getInt(4) %></td>
                            <td class="text-success"><%= rs1.getInt(6) %></td>
                            <td class="text-success"><%= rs1.getInt(3) %></td>
                            <td class="text-success"><%= rs1.getDate(5) %></td>
                            <td>
                            <a class="btn btn-success" href="updategoods.jsp?w='warehouse1'&d=<%=rs1.getString(2)%>&wi=<%=rs1.getString(3)%>&n=<%=rs1.getString(4)%>&r='rolls'&da='<%= rs1.getDate(5) %>&nu=<%=rs1.getString(6)%>'">Update</a>
                            </td>
                            <td>
                            <a class="btn btn-danger" href="deletegoods.jsp?d=<%=rs1.getString(2)%>&w='warehouse1'&r='rolls'&da='<%= rs1.getDate(5) %>'" onclick="return(confirm('Are you sure you want to delete?'))">Delete</a>
                            </td>
                        </tr>
                        <%
                            }
                        PreparedStatement stmt2 = conn.prepareStatement("SELECT * FROM cartons WHERE warehouse='warehouse1' LIMIT ?,?");
                        stmt2.setInt(1, a);
                        stmt2.setInt(2, b);
                        ResultSet rs2 = stmt2.executeQuery();
                        while(rs2.next()){                       
                    %>
                    <tr>
                            <td class="text-success"><%= rs2.getString(3) %></td>
                            <td class="text-success"><%= rs2.getInt(4) %></td>
                            <td class="text-success"><%= rs2.getInt(6) %></td>
                            <td class="text-success"><%= rs2.getString(2) %></td>
                            <td class="text-success"><%= rs2.getDate(5) %></td>
                            <td>
                            <a class="btn btn-success" href="updategoods.jsp?w='warehouse1'&d=<%=rs2.getString(2)%>&wi=<%=rs2.getString(3)%>&c='cartons'&n=<%=rs2.getString(4)%>&da='<%= rs2.getDate(5) %>&nu=<%=rs2.getString(6)%>'">Update</a>
                            </td>
                            <td>
                            <a class="btn btn-danger" href="deletegoods.jsp?d=<%=rs2.getString(3)%>&w='warehouse1'&c='cartons'&da='<%= rs2.getDate(5) %>'" onclick="return(confirm('Are you sure you want to delete?'))">Delete</a>
                            </td> 
                            
                    </tr>
                        <%
                            }
                }
        }else if(request.getParameter("next")!= null){
                            a+=10;
                            b+=10;

                            System.out.println(a);
                            System.out.println(b);

                            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM rolls WHERE warehouse='warehouse1' LIMIT ?,?");
                            stmt.setInt(1, a);
                            stmt.setInt(2, b);
                            ResultSet rs1 = stmt.executeQuery();
                        while(rs1.next()){                       
                    %>                   
                        <tr>
                            <td class="text-success"><%= rs1.getString(2) %></td>
                            <td class="text-success"><%= rs1.getInt(4) %></td>
                            <td class="text-success"><%= rs1.getInt(6) %></td>
                            <td class="text-success"><%= rs1.getInt(3) %></td>
                            <td class="text-success"><%= rs1.getDate(5) %></td>
                            <td>
                            <a class="btn btn-success" href="updategoods.jsp?w='warehouse1'&d=<%=rs1.getString(2)%>&wi=<%=rs1.getString(3)%>&n=<%=rs1.getString(4)%>&r='rolls'&da='<%= rs1.getDate(5) %>&nu=<%=rs1.getString(6)%>'">Update</a>
                            </td>
                            <td>
                            <a class="btn btn-danger" href="deletegoods.jsp?d=<%=rs1.getString(2)%>&w='warehouse1'&r='rolls'&da='<%= rs1.getDate(5) %>'" onclick="return(confirm('Are you sure you want to delete?'))">Delete</a>
                            </td> 
                            
                        </tr>
                        <%
                            }
                        PreparedStatement stmt2 = conn.prepareStatement("SELECT * FROM cartons WHERE warehouse='warehouse1' LIMIT ?,?");
                        stmt2.setInt(1, a);
                        stmt2.setInt(2, b);
                        ResultSet rs2 = stmt2.executeQuery();
                        while(rs2.next()){                       
                    %>
                    <tr>
                            <td class="text-success"><%= rs2.getString(3) %></td>
                            <td class="text-success"><%= rs2.getInt(4) %></td>
                            <td class="text-success"><%= rs2.getInt(6) %></td>
                            <td class="text-success"><%= rs2.getString(2) %></td>
                            <td class="text-success"><%= rs2.getDate(5) %></td>
                            <td>
                            <a class="btn btn-success" href="updategoods.jsp?w='warehouse1'&d=<%=rs2.getString(2)%>&wi=<%=rs2.getString(3)%>&c='cartons'&n=<%=rs2.getString(4)%>&da='<%= rs2.getDate(5) %>&nu=<%=rs2.getString(6)%>'">Update</a>
                            </td>
                            <td>
                            <a class="btn btn-danger" href="deletegoods.jsp?d=<%=rs2.getString(3)%>& w='warehouse1'&c='cartons'&da='<%= rs2.getDate(5) %>'" onclick="return(confirm('Are you sure you want to delete?'))">Delete</a>
                            </td> 
                            
                        </tr>
                        <%
                            }
                        }
                        else{
                        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM rolls where warehouse='warehouse1' LIMIT 1,10");
                        ResultSet rs1 = stmt.executeQuery();
                        while(rs1.next()){                       
                    %>                   
                        <tr>
                            <td class="text-success"><%= rs1.getString(2) %></td>
                            <td class="text-success"><%= rs1.getInt(4) %></td>
                            <td class="text-success"><%= rs1.getInt(6) %></td>
                            <td class="text-success"><%= rs1.getInt(3) %></td>
                            <td class="text-success"><%= rs1.getDate(5) %></td> 
                            <td>
                            <a class="btn btn-success" href="updategoods.jsp?w='warehouse1'&d=<%=rs1.getString(2)%>&wi=<%=rs1.getString(3)%>&n=<%=rs1.getString(4)%>&r='rolls'&da='<%= rs1.getDate(5) %>&nu=<%=rs1.getString(6)%>'">Update</a>
                            </td>
                            <td>
                            <a class="btn btn-danger" href="deletegoods.jsp?d=<%=rs1.getString(2)%>&w='warehouse1'&r='rolls'&da='<%= rs1.getDate(5) %>'" onclick="return(confirm('Are you sure you want to delete?'))">Delete</a>
                            </td> 
                            
                        </tr>
                        <%}             
                            PreparedStatement stmt2 = conn.prepareStatement("SELECT * FROM cartons WHERE warehouse='warehouse1' LIMIT 1,10");
                            ResultSet rs2= stmt2.executeQuery();
                            while(rs2.next()){                       
                                %>                   
                                <tr>
                            <td class="text-success"><%= rs2.getString(3) %></td>
                            <td class="text-success"><%= rs2.getInt(4) %></td>
                            <td class="text-success"><%= rs2.getInt(6) %></td>
                            <td class="text-success"><%= rs2.getString(2) %></td>
                            <td class="text-success"><%= rs2.getDate(5) %></td>
                            <td>
                            <a class="btn btn-success" href="updategoods.jsp?w='warehouse1'&d=<%=rs2.getString(2)%>&wi=<%=rs2.getString(3)%>&c='cartons'&n=<%=rs2.getString(4)%>&da='<%= rs2.getDate(5) %>&nu=<%=rs2.getString(6)%>'">Update</a>
                            </td>
                            <td>
                            <a class="btn btn-danger" href="deletegoods.jsp?d=<%=rs2.getString(3)%>&w='warehouse1'&c='cartons'&da='<%= rs2.getDate(5) %>'" onclick="return(confirm('Are you sure you want to delete?'))">Delete</a>
                            </td> 
                            
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
            <form method='GET' action='warehouse1.jsp'>
                <input class="btn btn-outline-danger" id="prev" type="submit" name="previous" value="previous">
                <input class="btn btn-outline-success" type="submit" name="next" value="next">
            </form>
        </div>   
        </div>
    </body>
</html>
