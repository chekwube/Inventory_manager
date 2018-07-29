<%-- 
    Document   : listcolourcost
    Created on : Apr 25, 2018, 5:21:52 PM
    Author     : INFOMECTICS
--%>
<%@page import="java.sql.*, general.Connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RIC CODES</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" /> 
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="bg-light">   
        <div class="container">
            <a href="site.jsp" class="header text-success"> <h2 class="page-header well text-center">RICANA NIGERIA LIMITED </h2> </a> 
            <br>
            <a href="../index.jsp"><button class="btn btn-outline-success pull-right">Logout</button></a>
            <a class="btn btn-success" href="addcost.jsp" class="text-warning">Add RIC code and Cost</a>
            
            <h4 class="text-warning text-center">Colour Codes and Cost per square meter</h4>
            <table class="table table-bordered table-hover code-per-cost">
                <thead>
                <th class="text-warning">Color code (RIC Code)</th>
                <th class="text-warning">Cost per square meter(&#x20A6)</th>
                <th class="text-warning">Action</th>
                </thead>
                <tbody>

                    <%
                        Connect con = new Connect();
                        Connection conn = con.dbConnect();                        
                        try {
                            /* Data fetched from the offcutsdetail table are added via addcut.jsp page */
                            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM total");
                            ResultSet rs1 = stmt.executeQuery();

                            while (rs1.next()) {
                    %>                   
                    <tr>
                        <td class="text-success"><%= rs1.getString(1)%></td>
                        <td class="text-success"><%= rs1.getString(2)%></td>
                        <td>
                            <a class="btn btn-danger" href="deleteCost.jsp?d=<%=rs1.getString(1)%>" onclick="return(confirm('Are you sure you want to delete this RIC code?'))">Delete</a>
                        </td>
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
                <br><br>
        </div>
    </body>
</html>
