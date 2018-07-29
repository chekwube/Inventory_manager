package general;
import java.sql.*;

public class Connect {

    public static Connection conn = null;
    public static Connection dbConnect(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/manager","root","");
            return conn;  
        }catch(ClassNotFoundException | SQLException t){
            System.out.println(t);
            return null;
        }
       
    }
    
     public void close() throws SQLException {
        conn.close();
    }
}
