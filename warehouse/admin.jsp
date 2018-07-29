<%-- 
    Document   : admin
    Created on : Jul 3, 2018, 2:49:46 PM
    Author     : INFOMETICS3
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>super admin</title>
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
        <h2 class="page-header well text-success text-center">RICANA NIGERIA LIMITED</h2><br>      
        <h4 class="text-warning text-center">Change Password</h4><hr>
        <a href="logout.jsp"><button class="btn btn-outline-success pull-right">Logout</button></a>
        <div class="relative " id="warehouse-manager">
            <span><a href="siteadmin.jsp"><button class="btn btn-outline-success">Site administrator</button></a></span>
            <br><br>
            <span><a href="warehouseadmin.jsp"><button class="btn btn-outline-success">Warehouse administrator</button></a></span>
            <br><br>
            <span><a href="superadmin.jsp"><button class="btn btn-outline-success">Super administrator</button></a></span>
            <br><br>
            
        </div>
    </body>
</html>
