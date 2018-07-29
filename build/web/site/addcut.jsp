<%-- 
    Document   : addcut
    Created on : Apr 10, 2018, 6:33:21 PM
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add offcut</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" /> 
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="container bg-light">
        <%  
            Connect con = new Connect();
            Connection conn = con.dbConnect();
            String customer = request.getParameter("customer");
            String ricCode = request.getParameter("ric_code");
            String wth = request.getParameter("width");
            String lth = request.getParameter("length");
            
        if(customer != null && ricCode!=null && wth!=null && lth!=null){                       
            try{
                PreparedStatement stmt1 = conn.prepareStatement("INSERT INTO offcuts VALUES(?, ?, ?, ?)");
                stmt1.setString(1, customer);
                stmt1.setString(2, ricCode);
                stmt1.setString(3, wth);
                stmt1.setString(4, lth);
                stmt1.executeUpdate();

                int offcut_width = Integer.parseInt(wth);
                int offcut_length = Integer.parseInt(lth);
                int offcutSize = offcut_width * offcut_length;
                
                PreparedStatement st3 = conn.prepareStatement("SELECT * FROM invoice WHERE customer = ?");
                st3.setString(1, customer);
                ResultSet rs3 = st3.executeQuery();

                int inv_width = 0, inv_length = 0;
                
                while (rs3.next()){
                    inv_width = rs3.getInt(3);
                    inv_length = rs3.getInt(4);
                }
                
                int originalSize = inv_width * inv_length;
                int usedSize = originalSize - offcutSize;

                PreparedStatement st4 = conn.prepareStatement("INSERT INTO offcutsdetail VALUES (?,?,?,?,?)");
                st4.setString(1, customer);
                st4.setString(2, ricCode);
                st4.setInt(3, originalSize);
                st4.setInt(4, offcutSize);
                st4.setInt(5, usedSize);
                st4.executeUpdate();
                
            }catch(Exception e){
                System.out.println(e);
            }
            finally{
                conn.close();
            }
        }
        %>
        <a href="site.jsp"><h2 class="page-header well text-success">RICANA NIGERIA LIMITED</h2></a>
        <hr>
        <h3 class="text-warning text-center">Add offcuts here</h3>
        <form class="addcut-box" method="POST" action="addcut.jsp">
            <label class="text-success">Customer</label>
            <input class="form-control" type="text" name="customer" placeholder="Enter the Customer's name" required/>  
            <label class="text-success">RIC code</label>
            <input class="form-control" type="text" name="ric_code" placeholder="Enter the RIC code of the offcut here" required/>                         
            <label class="text-success">Width</label>
            <input class="form-control" type="number" name="width" placeholder="Enter the width off the offcut here" required/>
            <label class="text-success">Length</label>
            <input class="form-control" type="number" name="length" placeholder="Enter the length of the offcut here" required/>
            <input class="form-control btn btn-outline-success" type="submit" name="submit" value="Add Offcut"/>
        </form>
    </body>
</html>
