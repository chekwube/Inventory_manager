<%-- 
    Document   : select
    Created on : Apr 23, 2018, 1:30:19 PM
    Author     : INFOMECTICS
--%>

<%@page import="java.sql.*, general.Connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Offcuts</title>
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous" /> 
        <link href="../css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body class="bg-light">   
        <div class="container">
            <h2 class="page-header well text-success">RICANA NIGERIA LIMITED</h2><br>   
            <h4 class="text-warning text-center">Select Details</h4><hr>

            <%
                Connect con = new Connect();
                Connection conn = con.dbConnect();
                PreparedStatement st2 = conn.prepareStatement("SELECT * FROM offcuts");
                //PreparedStatement st4 = conn.prepareStatement("INSERT INTO offcutsdetail VALUES (?,?,?,?,?)");

                ResultSet rs2 = st2.executeQuery();

                /* Values from offcut table */
                String customer = "", ric_code = "";
                int off_width = 0,
                        off_length = 0,
                        offcut = 0;

                while (rs2.next()) {
                    customer = rs2.getString(1);
                    ric_code = rs2.getString(2);
                    off_width = rs2.getInt(3);
                    off_length = rs2.getInt(4);
                }

                offcut = off_width * off_length;

                PreparedStatement st3 = conn.prepareStatement("SELECT * FROM invoice WHERE customer = ?");
                st3.setString(1, customer);
                ResultSet rs3 = st3.executeQuery();

                /* Values from invoice table */
                int inv_width = 0,
                        inv_length = 0,
                        originalsize = 0;

                while (rs3.next()) {
                    inv_width = rs3.getInt(3);
                    inv_length = rs3.getInt(4);
                }

                originalsize = inv_width * inv_length;
                int usedsize = originalsize - offcut;

//                st4.setString(1, customer);
//                st4.setString(2, ric_code);
//                st4.setInt(3, originalsize);
//                st4.setInt(4, offcut);
//                st4.setInt(5, usedsize);
//
//                st4.executeUpdate();

//                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM offcutsdetail");
//                ResultSet rs1 = stmt.executeQuery();
//                while (rs1.next()) {
            
            con.close();
            %>                   
            <form action="offcutsdetail.jsp" method="POST">
                <input class="btn btn-outline-success" type="submit" value="Offcut Details"/>
            </form>

        </div>
    </body>
</html>
