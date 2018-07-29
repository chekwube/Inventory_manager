<%-- 
    Document   : deletegoods
    Created on : Jun 28, 2018, 12:01:39 PM
    Author     : INFOMETICS3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, general.Connect" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                Connect con = new Connect();
                Connection conn = con.dbConnect();
                String delete = request.getParameter("d").replaceAll("[^a-zA-Z0-9 ]", "");
                String whouse = request.getParameter("w").replaceAll("[^a-zA-Z0-9]", "");
                String roll = request.getParameter("r");
                String cart = request.getParameter("c");
                String date_v =  request.getParameter("da").replaceAll("[^a-zA-Z0-9-]", "");  
                
//int delete_item = Integer.parseInt(d);
            
                   try{
                       if(roll!=null){
                            PreparedStatement delItem = conn.prepareStatement("DELETE FROM rolls WHERE ric_code=? AND warehouse=? AND date_value=?");
                            delItem.setString(1, delete);
                            delItem.setString(2, whouse);
                            delItem.setString(3, date_v);
                            delItem.executeUpdate();
                            String url = whouse+".jsp";
                            response.sendRedirect(url);
                       }
                       if(cart!=null){
                            PreparedStatement delItem = conn.prepareStatement("DELETE FROM cartons WHERE item_no=? AND warehouse=? AND date_value=?");
                            delItem.setString(1, delete);
                            delItem.setString(2, whouse);
                            delItem.setString(3, date_v);
                            delItem.executeUpdate();
                            String url = whouse+".jsp";
                            response.sendRedirect(url);
                       }
                    }catch(Exception ex){
                        ex.printStackTrace();
                    }
                   con.close();
            %>
    </body>
</html>
