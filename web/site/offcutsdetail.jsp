<%-- 
    Document   : manageoffcuts
    Created on : Apr 23, 2018, 1:30:19 PM
    Author     : INFOMECTICS
--%>

<%@page import="java.sql.*, general.Connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Offcuts</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" /> 
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="bg-light">   
        <div class="container">
            <a href="site.jsp" class="header text-success"> <h2 class="page-header well ">RICANA NIGERIA LIMITED </a>  
            <h4 class="text-warning text-center">Offcut Details</h4>
            <table class="table table-bordered table-hover">
                <thead>
                <th class="text-warning">Customer name</th>
                <th class="text-warning">RIC Code</th>
                <th class="text-warning">Original size(square meter)</th>
                <th class="text-warning">Offcuts (left over materials) square meter</th>
                <th class="text-warning">Used size(square meter)</th>
                </thead>
                <tbody>

                    <%
                        Connect con = new Connect();
                        Connection conn = con.dbConnect();
                        try {
                            /* Data fetched from the offcutsdetail table are added via addcut.jsp page */
                            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM offcutsdetail");
                            ResultSet rs1 = stmt.executeQuery();

                            while (rs1.next()) {
                    %>                   
                    <tr>
                        <td class="text-success"><%= rs1.getString(1)%></td>
                        <td class="text-success"><%= rs1.getString(2)%></td>
                        <td class="text-success"><%= rs1.getInt(3)%></td>
                        <td class="text-success"><%= rs1.getInt(4)%></td> 
                        <td class="text-success"><%= rs1.getInt(5)%></td> 
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            System.out.println("Error: " + e.getMessage());
                        }
                        finally{
                            conn.close();
                        }
                    %>
                </tbody>                                 
            </table>  

        </div>
    </body>
</html>
