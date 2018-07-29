<%-- 
    Document   : index
    Created on : May 22, 2018, 12:13:17 PM
    Author     : INFOMECTICS
--%>
<html>
    <head>
        <title>Inventory manager</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" crossorigin="anonymous" />               
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="home-bg"> 
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
        
        <div class="container text-center home__item">
            <h1 class="page-header text-success" style="font-weight: bolder; font-size: 5vw">RICANA NIGERIA LIMITED</h1>          
            <h1 class="text-warning text-center"><b>Inventory Management System</b></h1><br><hr>
            <h4>
                <p class="text-success text-center"><b>Click either of the buttons below to select what you want to manage</b></p></h4><br>
                <a href="warehouse/login.jsp" class=""><button class="btn btn-outline-success btn-lg">Warehouse Manager</button></a>
                <a href="site/login.jsp" class=""><button class="btn btn-outline-success btn-lg">Production Site Manager</button></a>
        </div>        
    </body>
</html>
