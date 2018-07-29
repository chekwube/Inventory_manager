<%-- 
    Document   : warehouses
    Created on : May 7, 2018, 6:18:50 AM
    Author     : INFOMECTICS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>production site</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" /> 
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="container bg-light">
        <% 
            HttpServletResponse httpResponse = (HttpServletResponse)response;
            httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            httpResponse.setHeader("Pragma", "no-cache"); //HTTP 1.0
            httpResponse.setHeader("Expires", "0"); //Proxies
        %>
        <h2 class="page-header well text-success text-center">RICANA NIGERIA LIMITED</h2><br>      
        <h4 class="text-warning text-center">Warehouses</h4><hr>
        <div class="relative" id="warehouse-manager" style="margin-left: 0%; width: 100% ">
            <span><a href="warehouse1.jsp"><button class="btn btn-outline-success">Warehouse 1</button></a></span>
            <span><a href="warehouse2.jsp"><button class="btn btn-outline-success">Warehouse 2</button></a></span>
            <span><a href="warehouse3.jsp"><button class="btn btn-outline-success">Warehouse 3</button></a></span>
            <span><a href="warehouse4.jsp"><button class="btn btn-outline-success">Warehouse 4</button></a></span>
            <span><a href="warehouse5.jsp"><button class="btn btn-outline-success">Warehouse 5</button></a></span>            
        </div>
    </body>
</html>
