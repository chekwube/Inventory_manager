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
         <a href="./warehouseManager.jsp" style=""><h2 class="page-header well text-success text-center">RICANA NIGERIA LIMITED </h2></a>
        <h4 class="text-success text-center">Update goods in the warehouse here</h4><br>
        <table class="table pull-center create-rolls">        
        <%
            Connect con = new Connect();
            Connection conn = con.dbConnect();
            
            String roll = request.getParameter("r"); 
            String cart = request.getParameter("c");

            //update code for rolls
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
                            int num3 = Integer.parseInt(num);
                            
                            PreparedStatement stmt1 = conn.prepareStatement("UPDATE rolls SET ric_code=?, width=?, net_qty=?, number_value=? WHERE warehouse=? AND date_value=?");                       
                            stmt1.setString(1, ricCode);
                            stmt1.setInt(2,wth);
                            stmt1.setInt(3,qty1);
                            stmt1.setInt(4,num3);
                            stmt1.setString(5,whouse);
                            stmt1.setString(6,newDate);

                            stmt1.executeUpdate(); 
                            String url = whouse+".jsp";
                            response.sendRedirect(url);
                        }catch(Exception e){
                            System.out.println(e);
                        }  
                    }
                }
                
            //update code for cartons
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
                        int num2 = Integer.parseInt(number);

                        PreparedStatement stmt1 = conn.prepareStatement("UPDATE cartons SET description=?, item_no=?, net_qty=?, number_values=? WHERE warehouse=? AND date_value=?");
                        stmt1.setString(1, desc);         
                        stmt1.setInt(2,itemno);
                        stmt1.setInt(3,qty2);
                        stmt1.setInt(4,num2); 
                        stmt1.setString(5,whouse2);
                        stmt1.setString(6,newDate2);
                        stmt1.executeUpdate();
                        String url = whouse2+".jsp";
                        response.sendRedirect(url);
                    }
                }
            
            if(roll!=null){
            String number1 = request.getParameter("w").replaceAll("[^a-zA-Z0-9 ]", "");;
            String number2 = request.getParameter("d").replaceAll("[^a-zA-Z0-9 ]", "");;
            String number3 = request.getParameter("wi").replaceAll("[^a-zA-Z0-9 ]", "");;
            String number4 = request.getParameter("n").replaceAll("[^a-zA-Z0-9 ]", "");;
            String number5 = request.getParameter("da").replaceAll("[^a-zA-Z0-9-]", "");;
            String number6 = request.getParameter("nu").replaceAll("[^a-zA-Z0-9 ]", "");;    
            
            int num3 = Integer.parseInt(number3);
            int num4 = Integer.parseInt(number4);
        %>
            <thead>
                <th class="text-warning">
                    Goods in Rolls
                </th>              
            </thead>
            <tbody>
                <form method="POST" action="updategoods.jsp">
                <tr>
                    <td>                                              
                        <label class="text-success">Warehouse:</label> 
                        <input class="form-control" type="text" name="warehouse" value="<%= number1 %>" required/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">RIC Code</label>
                        <input class="form-control" type="text" name="ric_code" value="<%= number2 %>" required/>
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Width</label>
                        <input class="form-control" type="number" name="width" value="<%= num3 %>" required/>                       
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Net Quantity (Total Meter)</label>
                        <input class="form-control" type="number" name="net_qty" value="<%= num4 %>" required/>                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Date of Production</label>
                        <input class="form-control" type="Date" name="date" value="<%= number5 %>" required/>                     
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Number of Goods</label>
                        <input class="form-control" type="text" name="number" value="<%= number6 %>" required/><br>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="form-control btn btn-outline-success" type="submit" name="submit1" value="Update" />
                    </td>
                </tr>
                </form>
            </tbody>
        <%}            
            if(cart!=null){
            String number1 = request.getParameter("w").replaceAll("[^a-zA-Z0-9 ]", "");;
            String number2 = request.getParameter("d").replaceAll("[^a-zA-Z0-9 ]", "");;
            String number3 = request.getParameter("wi").replaceAll("[^a-zA-Z0-9 ]", "");;
            String number4 = request.getParameter("n").replaceAll("[^a-zA-Z0-9 ]", "");;
            String number5 = request.getParameter("da").replaceAll("[^a-zA-Z0-9-]", "");;
            String number6 = request.getParameter("nu").replaceAll("[^a-zA-Z0-9 ]", "");;

            int num3 = Integer.parseInt(number3);
            int num4 = Integer.parseInt(number4);
            int num6 = Integer.parseInt(number6);
        %>
            <thead>
                <th class="text-warning">
                    Goods in Cartons
                </th>
            </thead>
            <tbody>
                <form method="POST" action="updategoods.jsp">       
                <tr>
                    <td>
                        <label class="text-success">Warehouse:</label>
                        <input class="form-control" type="text" name="warehouse" value="<%= number1 %>" required/>        
                    </td>
                </tr>
                <tr>
                    <td>
                       <label class="text-success">Description:</label>
                        <input class="form-control" type="text" name="description" value="<%= number2 %>" required/>                                
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Item number</label>
                        <input class="form-control" type="number" name="item_no" value="<%= num3 %>" required/>        
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Gross Quantity:</label>
                        <input class="form-control" type="number" name="net" value="<%= num4 %>" required/>        
                    </td>
                </tr>
                <tr>
                    <td>
                        <label class="text-success">Date of Production:</label>
                        <input class="form-control" type="Date" name="date2" value="<%= number5 %>" required/>        
                    </td>
                </tr>
                <tr>
                    <td>
                       <label class="text-success">Number of Cartons:</label>
                       <input class="form-control" type="number" name="number2" value="<%= num6 %>" required/><br>       
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="form-control btn btn-outline-success" type="submit" name="submit2" value="Update"/>
                    </td>
                </tr>
                </form>
            </tbody>
        
         <%}
            if(conn !=null){
                conn.close();
            }
        %>
        </table>
    </body>
</html>
