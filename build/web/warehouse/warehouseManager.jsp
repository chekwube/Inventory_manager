<%-- 
    Document   : warehouseManager
    Created on : Apr 26, 2018, 8:53:44 AM
    Author     : INFOMECTICS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>warehouse manager</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" /> 
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="container bg-light">
        <script>
            
            (function (global) { 

    if(typeof (global) === "undefined") {
        throw new Error("window is undefined");
    }

    var _hash = "!";
    var noBackPlease = function () {
        global.location.href += "#";

        // making sure we have the fruit available for juice (^__^)
        global.setTimeout(function () {
            global.location.href += "!";
        }, 50);
    };

    global.onhashchange = function () {
        if (global.location.hash !== _hash) {
            global.location.hash = _hash;
        }
    };

    global.onload = function () {            
        noBackPlease();

        // disables backspace on page except on input fields and textarea..
        document.body.onkeydown = function (e) {
            var elm = e.target.nodeName.toLowerCase();
            if (e.which === 8 && (elm !== 'input' && elm  !== 'textarea')) {
                e.preventDefault();
            }
            // stopping event bubbling up the DOM tree..
            e.stopPropagation();
        };          
    }

})(window);
        </script>
        <% 
            HttpServletResponse httpResponse = (HttpServletResponse)response;
            httpResponse.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
            httpResponse.setHeader("Pragma", "no-cache"); //HTTP 1.0
            httpResponse.setHeader("Expires", "0"); //Proxies
        %>
        <h2 class="page-header well text-success text-center">RICANA NIGERIA LIMITED</h2><br>      
        <h4 class="text-warning text-center">Warehouse Management</h4><hr>
        <a href="logout.jsp"><button class="btn btn-outline-success pull-right">Logout</button></a>
        <div class="relative text-center" id="warehouse-manager">
            <span><a href="warehouses.jsp"><button class="btn btn-outline-success">Warehouse</button></a></span>
            <br><br>
            <span><a href="rolls.jsp"><button class="btn btn-outline-success">Goods in Roll</button></a></span>
            <br><br>
            <span><a href="cartons.jsp"><button class="btn btn-outline-success">Goods in Carton</button></a></span>
            <br><br>
            <span><a href="search.jsp"><button class="btn btn-outline-success">Search Warehouse</button></a></span>
            <br><br>
            <span><a href="adminlogin.jsp"><button class="btn btn-outline-success">Admin</button></a></span>            
            <br><br>
        </div>
    </body>
</html>
