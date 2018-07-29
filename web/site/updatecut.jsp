<%-- 
    Document   : updatecut
    Created on : Apr 10, 2018, 6:33:36 PM
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit offcut</title>
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
            
            int updateWidth;
            int updateLength;
            int originalWidth = 0; 
            int originalLength = 0;
            
            if(customer!=null && ricCode!=null && wth!=null && lth!=null){
                /* convert width and length */
                updateWidth = Integer.parseInt(wth);
                updateLength = Integer.parseInt(lth);
                /* Fetch the width and legth from the work details table and compare with the user input */
                try {
                    PreparedStatement stmt5 = conn.prepareStatement("SELECT * FROM invoice WHERE customer=?");
                    stmt5.setString(1, customer);
                    ResultSet rs5 = stmt5.executeQuery();
                    while(rs5.next()){
                        originalWidth = rs5.getInt(3);
                        originalLength = rs5.getInt(4);
                    }
                    /* We check the validity of the inputs for upadate */
                    if(updateWidth > originalWidth || updateLength > originalLength){
                        System.err.println("Cannot cut-off more than the original size");
                    }
                    else{
                        /* set the user's input as the update */
                        PreparedStatement stmt1 = conn.prepareStatement("UPDATE offcuts SET width=?, length=? WHERE ric_code=? AND customer=?");
                        stmt1.setInt(1, updateWidth);
                        stmt1.setInt(2, updateLength);
                        stmt1.setString(3, ricCode);
                        stmt1.setString(4, customer);

                        stmt1.executeUpdate();
                        
                        int originalSize = originalWidth * originalLength;
                        int offcutSizeUpdate = updateWidth * updateLength;
                        int usedSize = originalSize - offcutSizeUpdate;
                        
                        PreparedStatement st4 = conn.prepareStatement("UPDATE offcutsdetail SET originalsize=?, offcut=?, usedsize=? WHERE customer=? AND ric_code=?");
                        //customer, ric_code, originalsize, offcut, usedsize -- db table
                        st4.setString(4, customer);
                        st4.setString(5, ricCode);
                        st4.setInt(1, originalSize);
                        st4.setInt(2, offcutSizeUpdate);
                        st4.setInt(3, usedSize);

                        st4.executeUpdate();
                    }
                }
                catch(Exception e){
                    System.out.println("Error: "+ e.getMessage());
                }
                        
            }
            con.close();
        %>
        <a href="site.jsp"><h2 class="page-header well text-success">RICANA NIGERIA LIMITED</h2></a><br>
        
        <h4 class="text-warning text-center">Update offcuts here</h4><hr>
        <form class="updatecut-form" method="POST" action="updatecut.jsp">
            <label class="text-success">Customer</label>
            <input class="form-control" type="text" name="customer" placeholder="Enter Customer's name here" required/>                         
            <label class="text-success">RIC code</label>
            <input class="form-control" type="text" name="ric_code" placeholder="Enter the RIC code of the offcut here" required/>                         
            <label class="text-success">Width</label>
            <input class="form-control" type="number" name="width" placeholder="Enter the width off the offcut here" required/>
            <label class="text-success">Length</label>
            <input class="form-control" type="number" name="length" placeholder="Enter the length of the offcut here" required/>
            <input class="form-control btn btn-outline-success" type="submit" name="submit" value="Update offcut"/>
        </form>
    </body>
</html>
