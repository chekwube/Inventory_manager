<%-- 
    Document   : warehouse
    Created on : Apr 7, 2018, 6:19:20 AM
    Author     : mac
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
            
        <%          
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0
            response.setHeader("Expires", "0"); //Proxies
            
            
            Connect con = new Connect();
            Connection conn = con.dbConnect();
            
            PreparedStatement statement5 = conn.prepareStatement("SELECT number_value FROM warehouse1 WHERE kind='rolls'");
            PreparedStatement statement6 = conn.prepareStatement("SELECT number_value FROM warehouse1 WHERE kind='cartons'");
            PreparedStatement statement7 = conn.prepareStatement("SELECT number_value FROM warehouse2 WHERE kind='rolls'");
            PreparedStatement statement8 = conn.prepareStatement("SELECT number_value FROM warehouse2 WHERE kind='cartons'");
            
            ResultSet rs5 = statement5.executeQuery();
            ResultSet rs6 = statement6.executeQuery();
            ResultSet rs7 = statement7.executeQuery();
            ResultSet rs8 = statement8.executeQuery();
            int total5 = 0;
            int total6 = 0;
            int total7 = 0;
            int total8 = 0;
            
            while(rs5.next()){
            total5+=rs5.getInt(1);
            }
            while(rs6.next()){
            total6+=rs6.getInt(1);
            }
            while(rs7.next()){
            total7+=rs7.getInt(1);
            }
            while(rs8.next()){
            total8+=rs8.getInt(1);
            }    
          
            
        %>
        <a href="warehouse.jsp" class="header text-success"> <h2 class="page-header well ">RICANA NIGERIA LIMITED </a>
            <span class="pull-right">
                <a href="create.jsp"><button class="btn btn-outline-success ">Add goods to warehouse</button></a>
                <a href="remove.jsp"><button class= "btn btn-outline-info">Take Goods to Production</button></a>
                <a href="logout.jsp"><button class="btn btn-outline-success ">Logout</button></a>
            </span>
        </h2>
        
        <h4 class="text-warning">Welcome to the warehouse manager</h4><hr>
        
        <table class="table table-hover table-bordered">
            <thead class="table-success">          
                    <th class="text-success">Warehouse</th>
                    <th class="text-success">No of Rolls</th>
                    <th class="text-success">No of Cartons</th> 
            </thead>
            <tbody>
                <tr>
                    <td class="text-success">
                        warehouse1
                    </td>
                    <td class="text-warning">
                        <%= total5 %>
                    </td>
                    <td class="text-warning">
                        <%= total6 %>
                    </td>
                </tr>
                <tr>
                    <td class="text-success">
                        warehouse2
                    </td>
                    <td class="text-warning">
                        <%= total7 %>
                    </td>
                    <td class="text-warning">
                        <%= total8 %>
                    </td>
                </tr>
            </tbody>     
        </table>
                    <br><hr> 
            <h4 class="text-warning">Type in the details you want to search with</h4>            
            <table class="table table-condensed">
                <thead>
                <th class="text-success">Goods in Rolls</th>
                <th class="text-success">Goods in Cartons</th>
                </thead>
                <tbody>
                    <tr>
                        <td>
                    <form method="GET" action="warehouse.jsp">
                        <label class="text-success">Warehouse:</label>
                        <select class="form-control" name="warehouse1" required>
                            <option> </option>                           
                            <option name="warehouse1">
                                warehouse1
                            </option>
                            <option name="warehouse1">
                                warehouse2 
                            </option>
                        </select>
                        <label class="text-success">RIC Code:</label>
                        <input class="form-control" type="text" name="ric_code" placeholder="Enter RIC Code here" required/><br>                      
                        <label class="text-success">Width:</label>
                        <input class="form-control" type="number" name="width" placeholder="Enter the rolls width" required/><br><br>                       
                        
                        <input class="btn btn-outline-success" type="submit" name="submit1" value="Search"/>
                    </form>
                        </td>
                        <td>
                    <form>
                        <label class="text-success">Warehouse:</label>
                        <select class="form-control" name="warehouse2" required>
                            <option> </option>                           
                            <option name="warehouse2">
                                warehouse1
                            </option>
                            <option name="warehouse2">
                                warehouse2 
                            </option>
                        </select>
                        <label class="text-success">Description:</label>
                        <input class="form-control" type="text" name="description" placeholder="Enter the item number here" required/><br><br>
                        <input class="btn btn-outline-success" type="submit" name="submit2" value="Search"/>
                    </form>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <% 
                                
                                int total2 = 0;
                                int total3 = 0;
                                String whouse1 = request.getParameter("warehouse1");
                                String code = request.getParameter("ric_code"); 
                                String whouse2 = request.getParameter("warehouse2");                         
                                String description = request.getParameter("description");
                                String width = request.getParameter("width");
                                if(request.getParameter("submit1")!=null){
                                    
                                    if(code!=null){ 
                                        PreparedStatement statement1 = conn.prepareStatement("SELECT number_value FROM rolls WHERE ric_code=? AND width=? AND warehouse=?");
                                        statement1.setString(1, code);
                                        statement1.setString(2, width);
                                        statement1.setString(3, whouse1);
                                        
                                        ResultSet rs1 = statement1.executeQuery();
                                        while(rs1.next()){
                                            total2+=rs1.getInt(1);
                                        }
                                       
                            %><br><h4 class="text-info"> The total number of rolls with RIC Code <i class="text-error"><%= code %> </i> and width <i class="text-error"><%= width %> </i> is <i class="text-error"><%= total2 %></i></h4><%
                                    }
                                }

                                if(request.getParameter("submit2")!=null){
                                    
                                    if(description!=null){
                                        PreparedStatement statement1 = conn.prepareStatement("SELECT number_values FROM cartons WHERE item_no=? AND warehouse=?");
                                        statement1.setString(1, description);
                                        statement1.setString(2, whouse2);
                                        ResultSet rs1 = statement1.executeQuery();
                                        while(rs1.next()){
                                            total3+=rs1.getInt(1);
                                        }
                                        
                            %><br><h4 class="text-info"> The total number of cartons with description <i class="text-error"><%= description %></i>  is <i class="text-error"><%= total3 %></i></h4><%
                                    }
                                }
                            %> 
                            <c:set var="val" value = "${total2}"/>
                            <c:if test="${val >= 0}" >
                                <p class="text-success"> The total number of rolls with RIC Code <%= code %>  is: <%= total2 %></p>
                            </c:if>
                        </td>
                        <td>                      
                            <c:set var="val" value = "${total3}"/>
                            <c:if test="${val >= 0}" >
                                <h4 class="text-success"> The total number of cartons with item number <%= description %>  is: <%= total3 %></h4>            
                            </c:if>
                        </td>
                    </tr>
                </tbody>
            </table>   
            <br>
            
        
        </div>
       
    </body>
</html>
