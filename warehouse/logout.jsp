<%-- 
    Document   : logout
    Created on : Apr 20, 2018, 5:11:44 PM
    Author     : INFOMECTICS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Expires" content="0" />

        
        
        <title>Logout</title>
<!--        <script type="text/javascript">
            function myFunction() {
                location.replace("../index.jsp");
            }
            window.onload = myFunction();
        </script>-->

        <script type="text/javascript">
            function preback() {
                window.history.forward();
            }
            setTimeout("preback",0);
            window.onunload = function(){null;};
        </script>
    </head>
    <body>
        <h1>Logging out</h1>
                
        <%  
            response.setHeader("Pragma", "no-cache"); 
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            
            response.setHeader("Expires", "0");
            
            request.getSession().setAttribute("username", null);

            response.sendRedirect("../index.jsp");
        %>
    </body>
</html>
