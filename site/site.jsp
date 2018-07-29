<%-- 
    Document   : site
    Created on : Apr 7, 2018, 6:18:50 AM
    Author     : mac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect" %>
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
        <a href="../index.jsp"><h2 class="page-header well text-success text-center">RICANA NIGERIA LIMITED</h2></a><br>      
        <h4 class="text-warning text-center">Production site</h4><hr>
        <div class="relative text-center">
            <span><a href="fromwarehouse.jsp" class="btn btn-outline-success">Goods from Warehouse</a></span><br><br>
            <span><a href="listcolorcost.jsp" class="btn btn-outline-success">RIC Cost</a></span><br><br>
            <span><a href="customer.jsp" class="btn btn-outline-success">Capture Customer or Create Invoice</a></span><br><br>
            <span><a href="details.jsp" class="btn btn-outline-success">Work details</a></span><br><br>
            <span><a href="undone.jsp" class="btn btn-outline-success">Undone works</a></span><br><br>
            <span><a href="done.jsp" class="btn btn-outline-success">Done works</a></span><br><br>
            <span><a href="account.jsp" class="btn btn-outline-success">Account Status</a></span><br><br>
            <span><a href="collected.jsp" class="btn btn-outline-success">Collected Works</a></span><br><br>
<!--            <span><a href="offcutsdetail.jsp"><button class="btn btn-outline-success">Offcuts Detail</button></a></span>-->                                   
        </div>
    </body>
</html>
