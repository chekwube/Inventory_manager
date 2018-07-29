<%-- 
    Document   : rollstoproduction
    Created on : May 7, 2018, 6:25:25 PM
    Author     : INFOMECTICS
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect"%>
        
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
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
                    String warehouse = request.getParameter("warehouse");
                    String ricCode = request.getParameter("ric_code");
                    String width = request.getParameter("width");
                    String netQuantity = request.getParameter("net_qty");
                    String numberToMove = request.getParameter("numberToMove");
                    String newDate = request.getParameter("date");
            
                    if(warehouse != null && ricCode != null && newDate != null && width != null && netQuantity != null && numberToMove != null){                       
            
                        try{
                            int newWidth = Integer.parseInt(width);
                            int newNetQuantity = Integer.parseInt(netQuantity);
                            int newNumberToMove = Integer.parseInt(numberToMove);
                            
                            PreparedStatement removeFromRolls = conn.prepareStatement("UPDATE rolls SET "
                                    + "number_value=number_value-? WHERE warehouse=? AND ric_code=? AND width=? AND net_qty=? AND date_value=?");                          

                            removeFromRolls.setInt(1,newNumberToMove); 
                            removeFromRolls.setString(2,warehouse);
                            removeFromRolls.setString(3, ricCode);
                            removeFromRolls.setInt(4,newWidth);
                            removeFromRolls.setInt(5,newNetQuantity);
                            removeFromRolls.setString(6,newDate);
                            removeFromRolls.executeUpdate();
                            
                            PreparedStatement move2Prod = conn.prepareStatement("INSERT INTO rollsforprod SET warehouse=?, ric_code=?, width=?, net_qty=?, production_date=?, total_rolls=?");
                            move2Prod.setString(1, warehouse);
                            move2Prod.setString(2, ricCode);
                            move2Prod.setInt(3, newWidth);
                            move2Prod.setInt(4, newNetQuantity);
                            move2Prod.setString(5, newDate);
                            move2Prod.setInt(6, newNumberToMove);
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
                    conn.close();
                    
                }    
            }
        %>
        
        <h2 class="page-header well text-success text-center">RICANA NIGERIA LIMITED </h2>
        <h4 class="text-success text-center">Move goods to Production Site</h4>
               
        <table class="table table-stripede remove-rolls" style="text-align:center">
            <thead>
            <th class="text-warning">
                Goods in Rolls
            </th>            
            </thead>
            <tbody>
                <form method="GET" action="rollstoproduction.jsp">
                <tr>
                    <td>
                        <label class="text-success">Warehouse:</label>
                        <select class="form-control" name="warehouse" required>
                            <option> </option>                           
                            <option name="warehouse">warehouse1</option>
                            <option name="warehouse">warehouse2</option>
                            <option name="warehouse">warehouse3</option>
                            <option name="warehouse">warehouse4</option>
                            <option name="warehouse">warehouse5</option>
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
                        <input class="form-control" type="number" name="numberToMove" placeholder="Enter the total number of the goods to move to production" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="form-control btn btn-outline-success" type="submit" name="submit1" value="Move Rolls to Production" required/>                        
                    </td>
                </tr>
                </form>       
            </tbody>
        </table>
        <br>
        
        <br>
    </body>
</html>

