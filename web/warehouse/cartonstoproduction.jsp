<%-- 
    Document   : cartonstoproduction
    Created on : May 7, 2018, 8:00:56 PM
    Author     : INFOMECTICS
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
                if(request.getParameter("submit2")!= null){
                    String warehouse = request.getParameter("warehouse");
                    String description = request.getParameter("description");;
                    String itemNum = request.getParameter("item_no");
                    String net = request.getParameter("net_qty");
                    String date2 = request.getParameter("date2");
                    String number2 = request.getParameter("number2");             

                    if(warehouse != null && description != null && itemNum != null && net != null && date2 != null && number2 != null){                       
            
                        try{
                            int itemNumber = Integer.parseInt(itemNum);
                            int netQuantity = Integer.parseInt(net);
                            int numberToMove = Integer.parseInt(number2);
                                                        
                            /* This statement removes the specified number of roll(s) from the rolls table in the db*/
                            PreparedStatement removeFromCartons = conn.prepareStatement("UPDATE cartons SET "
                                    + "number_value=number_value-? WHERE warehouse=? AND item_no=? AND description=? AND net_qty=? AND date_value=?");                          

                            removeFromCartons.setInt(1,numberToMove); 
                            removeFromCartons.setString(2,warehouse);
                            removeFromCartons.setInt(3, itemNumber);
                            removeFromCartons.setString(4,description);
                            removeFromCartons.setInt(5,netQuantity);
                            removeFromCartons.setString(6,date2);
                            removeFromCartons.executeUpdate();
                            
                            /* This query inserts the removed goods from cartons table into cartonsforproduction table in the db*/
                            PreparedStatement move2Prod = conn.prepareStatement("INSERT INTO cartonsforprod SET warehouse=?, description=?, item_no=?, "
                                    + "net_qty=?, production_date=?, total_cartons=?");
                            move2Prod.setString(1, warehouse);
                            move2Prod.setString(2, description);
                            move2Prod.setInt(3, itemNumber);
                            move2Prod.setInt(4, netQuantity);
                            move2Prod.setString(5, date2);
                            move2Prod.setInt(6, numberToMove);
                            move2Prod.executeUpdate();
                              
                        }catch(Exception e){
                            System.out.println(e);
                        }  
                    }
                }
                
            }catch(Throwable t){
                t.printStackTrace();
            }finally{
                if(conn !=null){
                    try{conn.close();}catch(Exception exp){
                      exp.printStackTrace();
                    }
                }    
            }
            con.close();
        %>
        
        <h2 class="page-header well text-success text-center">RICANA NIGERIA LIMITED </h2>
        <h4 class="text-success text-center">Move goods to Production Site</h4>
               
        <table class="table table-stripede remove-cartons">
            <thead>
                <th class="text-warning">
                    <br>
                    Goods in Cartons
                </th>
            </thead>
            <tbody>
                <form method="GET" action="cartonstoproduction.jsp"> 
                <tr>
                    <td>
                        <label class="text-success">Warehouse:</label>
                        <select class="form-control" name="warehouse" required>                          
                            <option> </option>
                            <option>warehouse1</option>
                            <option>warehouse2</option>
                            <option>warehouse3</option>
                            <option>warehouse4</option>
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
                        <input class="form-control btn btn-outline-success" type="submit" name="submit2" value="Move Cartons to Production"/>                         
                    </td>
                </tr>
                </form>
            </tbody>
            
        </table> 
        <br>
        
        <br>
    </body>
</html>


