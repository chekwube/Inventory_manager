<%-- 
    Document   : offcut
    Created on : Apr 9, 2018, 4:08:59 PM
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Offcut</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" /> 
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="container bg-light">
        <a href="site.jsp" class="header text-success"> <h2 class="page-header well ">RICANA NIGERIA LIMITED </a>
            <span class="pull-right">
                <a href="addcut.jsp"><button class="btn btn-outline-success">Add offcuts</button></a>
                <a href="updatecut.jsp"><button class="btn btn-outline-success">Update offcuts</button></a>
            </span>
        </h2>
                     
            <%  
                Connect con = new Connect();
                Connection conn = con.dbConnect();
                if(request.getParameter("ric_code")!=null){
                    if(request.getParameter("customer")!=null && request.getParameter("ric_code")!=null && request.getParameter("length")!=null && request.getParameter("width")!=null){ 
                        String customer = request.getParameter("customer");
                        String ricCode = request.getParameter("ric_code");
                        String length = request.getParameter("length");
                        String width = request.getParameter("width");
                        int lth = Integer.parseInt(length);
                        int wth = Integer.parseInt(width);
                        
                        try{                           
                            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM offcuts WHERE customer=? AND ric_code=? AND width>=? AND length>=?");
                            stmt.setString(1, customer);
                            stmt.setString(2, ricCode);
                            stmt.setInt(3, wth);
                            stmt.setInt(4, lth);
                            ResultSet rs = stmt.executeQuery();
                            int total = 0;
                            while(rs.next()){
                                rs.getString(1);
                                total++;
                            }
            %>
                <br><h4 class="text-success"> The total number of offcuts with colour <i class="text-warning"><%= ricCode %></i>, length <i class="text-warning"><%= lth %></i> and width<i class="text-warning"><%= wth %></i>  is <i class="text-warning"><%= total %></i></h4><%
                       }catch(Exception e){
                               e.printStackTrace();
                        }
                    }
                }
                con.close();
            %>        
       
        <fieldset>
            <legend class="text-warning text-center">Search for offcuts</legend>
            <form class="offcut-box" method="GET" action="offcut.jsp">
                <label class="text-success">Customer:</label>
                <input class="form-control" type="text" name="customer" placeholder="Enter Customer's name" required/><br>
                <label class="text-success">RIC Code:</label>
                <input class="form-control" type="text" name="ric_code" placeholder="Enter RIC Code here" required/><br>
                <label class="text-success">Width:</label>
                <input class="form-control" type="number" name="width" placeholder="Enter the rolls width" required/><br>  
                <label class="text-success">Length:</label>
                <input class="form-control" type="number" name="length" placeholder="Enter the rolls width" required/>                                             
                <input class="btn btn-outline-success" type="submit" name="submit" value="Search for Offcut"/>                                             
            </form>           
        </fieldset>    
    </body>
</html>
