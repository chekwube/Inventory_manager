<%-- 
    Document   : remove
    Created on : Apr 7, 2018, 4:19:24 PM
    Author     : mac
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove goods</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="container bg-light">
        <%
            Connect con = new Connect();
            Connection conn = con.dbConnect();
            try{            
                if(request.getParameter("submit1")!= null){
                    String whouse = request.getParameter("warehouse");
                    String ricCode = request.getParameter("ric_code");
                    String width = request.getParameter("width");
                    String net_qty = request.getParameter("net_qty");
                    String num = request.getParameter("number");
                    String newDate = request.getParameter("date");
            
                    if(whouse!=null && ricCode!=null && newDate!=null && width!=null && net_qty!=null && num!=null){                       
                        try{
                            int wth = Integer.parseInt(width);
                            int qty1 = Integer.parseInt(net_qty);
                            int number3 = Integer.parseInt(num);
                            
                            PreparedStatement stmt1 = conn.prepareStatement("UPDATE rolls SET number_value=number_value-? WHERE warehouse=? AND ric_code=? AND width=? AND net_qty=? AND date_value=?");                          
                            stmt1.setInt(1,number3); 
                            stmt1.setString(2,whouse);
                            stmt1.setString(3, ricCode);
                            stmt1.setInt(4,wth);
                            stmt1.setInt(5,qty1);
                            stmt1.setString(6,newDate);
                            
                            PreparedStatement stmt10 = conn.prepareStatement("INSERT INTO rollsforprod SET warehouse=?, ric_code=?, width=?, net_qty=?, production_date=?, total_rolls=?");
                            stmt10.setString(1, whouse);
                            stmt10.setString(2, ricCode);
                            stmt10.setInt(3, wth);
                            stmt10.setInt(4, qty1);
                            stmt10.setString(5, newDate);
                            stmt10.setInt(6, number3);
                            stmt10.executeUpdate();
                    
                            if(whouse.equalsIgnoreCase("warehouse1")){
                                PreparedStatement stmt2 = conn.prepareStatement("UPDATE warehouse1 SET number_value=number_value-? WHERE kind='rolls'");           
                                stmt2.setInt(1,number3);
                                stmt2.executeUpdate();
                            } 
                       
                            if(whouse.equalsIgnoreCase("warehouse2")){
                                PreparedStatement stmt3 = conn.prepareStatement("UPDATE warehouse2 SET number_value=number_value-? WHERE kind='rolls'");                       
                                stmt3.setInt(1,number3);
                                stmt3.executeUpdate();
                            }
            
                            stmt1.executeUpdate();            
                        }catch(Exception e){
                            System.out.println(e);
                        }  
                    }
                }
        
        if(request.getParameter("submit2")!=null){            
            String whouse2 = request.getParameter("warehouse");
            String desc = request.getParameter("description");
            String item_no = request.getParameter("item_no");
            String qty = request.getParameter("net");
            String newDate2 = request.getParameter("date2");
            String number = request.getParameter("number2");         
            
        if(whouse2!=null && desc!=null && item_no!=null && qty!=null && newDate2!=null && number!=null){
            int itemno = Integer.parseInt(item_no);
            int qty2 = Integer.parseInt(qty);
            int number2 = Integer.parseInt(number);
                
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/manager","root","");
                PreparedStatement stmt1 = conn.prepareStatement("UPDATE cartons SET number_values=number_values-? WHERE warehouse=? AND description=? AND item_no=? AND net_qty=? AND date_value=?");
                stmt1.setInt(1,number2);
                stmt1.setString(2,whouse2);
                stmt1.setString(3, desc);         
                stmt1.setInt(4,itemno);
                stmt1.setInt(5,qty2);
                stmt1.setString(6,newDate2);
                


                if(whouse2.equalsIgnoreCase("warehouse1")){   
                    PreparedStatement stmt2 = conn.prepareStatement("UPDATE warehouse1 SET number_value=number_value-? WHERE kind='cartons'");
                    stmt2.setInt(1,number2); 
                    stmt2.executeUpdate();

                }
                
                if(whouse2.equalsIgnoreCase("warehouse2")){              
                    PreparedStatement stmt2 = conn.prepareStatement("UPDATE warehouse2 SET number_value=number_value-? WHERE kind='cartons'");
                    stmt2.setInt(1,number2); 
                    stmt2.executeUpdate();
                }               
                stmt1.executeUpdate();
            }
        }
            }catch(Throwable t){
                t.printStackTrace();
            }finally{
                if(conn !=null){
                        conn.close();
                    }
                }    
            }
        %>
        
        <a href="warehouse.jsp" class="header text-success"> <h2 class="page-header well ">RICANA NIGERIA LIMITED </a>
        <h4 class="text-info text-center">Move goods to Production Site</h4>
               
        <table class="table table-stripede remove-rolls pull-left">
            <thead>
            <th class="text-warning">
                Goods in Rolls
            </th>            
            </thead>
            <tbody>
                <form method="GET" action="remove.jsp">
                <tr>
                    <td>
                        <label class="text-success">Warehouse:</label>
                        <select class="form-control" name="warehouse" required>
                            <option> </option>                           
                            <option name="warehouse">
                                warehouse1
                            </option>
                            <option name="warehouse">
                                warehouse2
                            </option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">RIC Code:</label>
                        <input class="form-control" type="text" name="ric_code" placeholder="Enter RIC Code here" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Width:</label>
                        <input class="form-control" type="number" name="width" placeholder="Enter the width value here" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Total Meter:</label>
                        <input class="form-control" type="number" name="net_qty" placeholder="Enter the net quantity value here" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Date of Production:</label>
                        <input class="form-control" type="Date" name="date" placeholder="Enter the production date"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Number of Goods:</label>
                        <input class="form-control" type="number" name="number" placeholder="Enter the total number of the goods to move to production" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="form-control btn btn-outline-info" type="submit" name="submit1" value="Move Rolls to Production" required/>                        
                    </td>
                </tr>
                </form>       
            </tbody>
        </table>
        <br>
        
        <table class="table table-stripede remove-cartons">
            <thead>
                <th class="text-warning">
                    Goods in Cartons
                </th>
            </thead>
            <tbody>
                <form method="GET" action="remove.jsp"> 
                <tr>
                    <td>
                        <label class="text-success">Warehouse:</label>
                        <select class="form-control" name="warehouse" required>                          
                            <option> </option>
                            <option>
                                warehouse1
                            </option>
                            <option>
                                warehouse2
                            </option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Description:</label>
                        <input class="form-control" type="text" name="description" placeholder="Enter the description here" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                       <label class="text-success">Item number</label>
                        <input class="form-control" type="number" name="item_no" placeholder="Enter the item number here" required/> 
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Gross Quantity:</label>
                        <input class="form-control" type="number" name="net" placeholder="Enter the net quantity value here" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Date of Production:</label>
                        <input class="form-control" type="Date" name="date2" placeholder="Enter the production date" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Number of Cartons:</label>
                        <input class="form-control" type="number" name="number2" placeholder="Enter the total number of the cartons to move to production" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="form-control btn btn-outline-info" type="submit" name="submit2" value="Move Cartons to Production"/>                         
                    </td>
                </tr>
                </form>
            </tbody>
            
        </table>    
        <br>
    </body>
</html>
