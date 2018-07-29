<%-- 
    Document   : done
    Created on : Apr 9, 2018, 4:08:30 PM
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Done Works</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/> 
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="bg-light">
        <div class="container-fluid">
            <a href="site.jsp" class="header text-success"> <h2 class="page-header well text-center">RICANA NIGERIA LIMITED </h2></a>
                <span class="pull-right">
                    <a href="../index.jsp"><button class="btn btn-outline-success pull-right">Logout</button></a>
                </span>
                   
            <br>
            <h3 class="text-warning text-center">Done Works</h3>               
                <table class="table table-bordered table-ho+ver">
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
                        <th class="text-warning">Action</th>
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
                    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM invoice2 WHERE done=? LIMIT ?,?");
                    stmt.setString(1, "Yes");
                    stmt.setInt(2, a);
                    stmt.setInt(3, b);
                    ResultSet rs1 = stmt.executeQuery();
                    while (rs1.next()) {
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
                                <td>
                                    <a href="updateDone.jsp?ud=<%= rs1.getString(2)%>" class="btn btn-warning" onclick="return(confirm('Is this work done?'))">Done</a>
                                </td> 
                            </tr>
                        <%}
                    }   
                }else if(request.getParameter("next")!= null){
                    a+=10;
                    b+=10;
                    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM invoice2 WHERE done=? LIMIT ?,?");
                    stmt.setString(1, "Yes");
                    stmt.setInt(2, a);
                    stmt.setInt(3, b);
                    ResultSet rs1 = stmt.executeQuery();
                    while (rs1.next()) {
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
                                <td>
                                    <a href="updateDone.jsp?ud=<%= rs1.getString(2)%>" class="btn btn-warning" onclick="return(confirm('Is this work done?'))">Done</a>
                                </td> 
                            </tr>
                <%
                        }
                    }else{
                    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM invoice2 WHERE done=? LIMIT 0,10");
                    stmt.setString(1, "Yes");
                    ResultSet rs1 = stmt.executeQuery();
                    while (rs1.next()) {
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
                                <td>
                                    <a href="updateDone.jsp?ud=<%= rs1.getString(2)%>" class="btn btn-warning" onclick="return(confirm('Is this work done?'))">Done</a>
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
            <div>
            <form method='GET' action='done.jsp'>
                <input class="btn btn-outline-danger" id="prev" type="submit" name="previous" value="previous">
                <input class="btn btn-outline-success" type="submit" name="next" value="next">
            </form>
        </div>
        </div>
        
    </body>
</html>
