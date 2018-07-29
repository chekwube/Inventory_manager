<%-- 
    Document   : addcost
    Created on : Apr 16, 2018, 11:35:14 AM
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Description</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" />     
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="container bg-light">
        <%
            Connect con = new Connect();
            Connection conn = con.dbConnect();
            String ricCode = request.getParameter("ric_code");
            String cost = request.getParameter("cost");
                               
        if(ricCode!=null && cost!=null){ 
            try{
                int amt = Integer.parseInt(cost);
                PreparedStatement stmt2 = conn.prepareStatement("SELECT * FROM total WHERE ric_code=?");
                stmt2.setString(1, ricCode);
                ResultSet rs1 = stmt2.executeQuery();
                if(rs1.next()){
                    %>
                    <script>alert("This RIC Code already exists in the Database")</script>
                        <b class="text-danger pull-center">THIS RIC CODE ALREADY EXIST!</b>
                    <%
//                       response.sendRedirect("listcolorcost.jsp"); 
                }else{
                
                PreparedStatement stmt1 = conn.prepareStatement("INSERT INTO total VALUES(?, ?)");                       
                stmt1.setString(1, ricCode);
                stmt1.setInt(2, amt);

                stmt1.executeUpdate();}
            }catch(Exception e){
                System.out.println(e);
            }  
        }
        conn.close();
        %>
        <a href="site.jsp" class="header text-success"> <h2 class="page-header well text-center">RICANA NIGERIA LIMITED</h2> </a>
        
        <a href="../index.jsp"><button class="btn btn-outline-success pull-right">Logout</button></a><br>
        <p class="text-warning text-center"><b>Add new description cost per square meter here</b></p>
        <form method="GET" action="addcost.jsp" class="add-cost">
            <label class="text-success">RIC code</label>
            <input class="form-control" type="text" name="ric_code" placeholder="Enter the RIC code" required/>                         
            <label class="text-success">Cost per Square metre</label>
            <input class="form-control" type="number" name="cost" placeholder="Enter the cost per square metre here" required/>
            <input class="form-control btn btn-outline-success" type="submit" name="submit" value="Add Cost"/>
            <a href="listcolorcost.jsp"><input class="btn btn-outline-success pull-center" type="button" value="Back"/></a>           
        </form>
        
    </body>
</html>

