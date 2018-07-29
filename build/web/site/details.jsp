<%-- 
    Document   : details
    Created on : Apr 9, 2018, 4:07:25 PM
    Author     : mac
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
            <a href="site.jsp" class="header text-success"> <h2 class="page-header well text-center">RICANA NIGERIA LIMITED </a>
            </h2>
        <span class="pull-left">
                    <!--<a href="update.jsp"><button class="btn btn-outline-success">Update details</button></a>-->            
                    <a href="customer.jsp"><button class="btn btn-outline-success">Add new work</button></a>
                </span>        
        <a href="../index.jsp"><button class="btn btn-outline-success pull-right">Logout</button></a><br>             
            <br>
            <h3 class="text-warning text-center">Work details</h3>               
                <table class="table table-bordered table-ho+ver">
                    <thead>
                        <th class="text-warning">Qty</th>
                        <th class="text-warning">RIC Code</th>
                        <th class="text-warning">Length</th>
                        <th class="text-warning">Width</th>
                        <th class="text-warning">Description of Goods</th>
                        <th class="text-warning">Price(&#x20A6)</th>
                        <th class="text-warning">Amount(&#x20A6)</th>
                        <th class="text-warning">Start Date</th>
                        <th class="text-warning">End Date</th>
                        <th class="text-warning">Done?</th>
                        <th class="text-warning">Collected?</th>
                    </thead>
                    <tbody>
                        <%! int a = 0; int b = 10;%>
                    <%
                        Connect con = new Connect();
                        Connection conn = con.dbConnect();

                        if(request.getParameter("previous")!= null && a!=0 ){
                            if(a!=0){
                            a-=10;
                            b-=10;
                            System.out.println(a);
                            System.out.println(b);
                            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM invoice2 LIMIT ?,?");
                            stmt.setInt(1, a);
                            stmt.setInt(2, b);
                            ResultSet rs1 = stmt.executeQuery();
                        while(rs1.next()){   
                        %>                   
                            <tr>
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
                        <%}
                    }
                }else if(request.getParameter("next")!= null){
                            a+=10;
                            b+=10;
                            System.out.println(a);
                            System.out.println(b);
                            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM invoice2 LIMIT ?,?");
                            stmt.setInt(1, a);
                            stmt.setInt(2, b);
                            ResultSet rs1 = stmt.executeQuery();
                        while(rs1.next()){ 
                %>                   
                            <tr>
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
                        <%}
                          }else{
                            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM invoice2 LIMIT 1,10");
                            ResultSet rs1 = stmt.executeQuery();
                            while(rs1.next()){    
                %>                   
                            <tr>
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
                    <%      }
                        } 
                            conn.close();
                    %>
                    </tbody>                                 
                </table>              
     
            <br><hr>
            <div>
            <form method='GET' action='details.jsp'>
                <input class="btn btn-outline-danger" id="prev" type="submit" name="previous" value="previous">
                <input class="btn btn-outline-success" type="submit" name="next" value="next">
            </form>
        </div> 
        </div>
                   
    </body>
</html>
