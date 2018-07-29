<%--
    Document   : create
    Created on : Apr 7, 2018, 11:20:40 AM
    Author     : mac
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add goods</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" /> 
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="container bg-light">
        <%
            Connect con = new Connect();
            Connection conn = con.dbConnect();

            try{           
                if(request.getParameter("submit1")!=null){
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

                            PreparedStatement stmt1 = conn.prepareStatement("INSERT INTO rolls VALUES(?, ?, ?, ?, ?, ?)");                       

                            stmt1.setString(1,whouse);
                            stmt1.setString(2, ricCode);
                            stmt1.setInt(3,wth);
                            stmt1.setInt(4,qty1);
                            stmt1.setString(5,newDate);
                            stmt1.setInt(6,number3);                          

                            stmt1.executeUpdate();   
                            System.out.println("DETAILS SUCCESSFULLY INSERTED");
                        }catch(Exception e){
                            System.out.println(e);
                            System.out.println("NOT SUCCESSFULLY INSERTED");
                        }  
                    }
                }
                
                if(request.getParameter("submit2")!=null){
                    String whouse2 = request.getParameter("whouse");
                    String desc = request.getParameter("description");
                    String item_no = request.getParameter("item_no");
                    String qty = request.getParameter("net");
                    String newDate2 = request.getParameter("date2");
                    String number = request.getParameter("number2");

                    if(whouse2!=null && desc!=null && item_no!=null && qty!=null && newDate2!=null && number!=null){


                        int itemno = Integer.parseInt(item_no);
                        int qty2 = Integer.parseInt(qty);
                        int number2 = Integer.parseInt(number);

                        PreparedStatement stmt1 = conn.prepareStatement("INSERT INTO cartons VALUES (?, ?, ?, ?, ?, ?)");
                        stmt1.setString(1,whouse2);
                        stmt1.setString(2, desc);         
                        stmt1.setInt(3,itemno);
                        stmt1.setInt(4,qty2);
                        stmt1.setString(5,newDate2);
                        stmt1.setInt(6,number2); 

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
            
        %>
        <a href="./warehouseManager.jsp" style=""><h2 class="page-header well text-success text-center">RICANA NIGERIA LIMITED </h2></a>
        <a href="logout.jsp"><button class="btn btn-outline-success pull-right">Logout</button></a> 
        <h4 class="text-success text-center">Add goods to the warehouse here</h4><br>
        <table class="table pull-left create-rolls">
            <thead>
                <th class="text-warning">
                    Goods in Rolls
                </th>              
            </thead>
            <tbody>
                <form method="POST" action="create.jsp">
                <tr>
                    <td>                                              
                        <label class="text-success">Warehouse:</label>
                        <select class="form-control" name="warehouse" required>
                            <option> </option>                           
                            <option type="text" name="whouse">warehouse1</option>
                            <option type="text" name="whouse">warehouse2</option>
                            <option type="text" name="whouse">warehouse3</option>
                            <option type="text" name="whouse">warehouse4</option>
                            <option type="text" name="whouse">warehouse5<option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">RIC Code</label>
                        <input class="form-control" type="text" name="ric_code" placeholder="Enter RIC Code here" required/>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Width</label>
                        <input class="form-control" type="number" name="width" placeholder="Enter the width value here" required/>                       
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Net Quantity (Total Meter)</label>
                        <input class="form-control" type="number" name="net_qty" placeholder="Enter the net quantity value here" required/>                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Date of Production</label>
                        <input class="form-control" type="Date" name="date" placeholder="Enter the production date" required/>                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Number of Goods</label>
                        <input class="form-control" type="text" name="number" placeholder="Enter the total number of the goods to add" required/><br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="form-control btn btn-outline-success" type="submit" name="submit1" value="Add Rolls to Warehouse" />
                    </td>
                </tr>
                </form>
            </tbody>
        </table>
        <br>
        <hr>

        
        <table class="table pull-right create-cartons">       
            <thead>
                <th class="text-warning">
                    Goods in Cartons
                </th>
            </thead>
            <tbody>
                <form method="POST" action="create.jsp">       
                <tr>
                    <td>
                        <label class="text-success">Warehouse:</label>
                        <select class="form-control" type="text" name="whouse" required>                          
                            <option> </option>
                            <option type="text" name="whouse">warehouse1</option>
                            <option type="text" name="whouse">warehouse2</option>
                            <option type="text" name="whouse">warehouse3</option>
                            <option type="text" name="whouse">warehouse4</option>
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
                       <input class="form-control" type="number" name="number2" placeholder="Enter the total number of the cartons to add" required/><br>       
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="form-control btn btn-outline-success" type="submit" name="submit2" value="Add Cartons to Warehouse"/>
                    </td>
                </tr>
                </form>
            </tbody>
        <table>
    </body>
</html>
