/**
 * Created by Siclait on 5/23/2016.
 */

// Libraries
import java.sql.*;

import static spark.Spark.*;

public class Main {

    public static void main(String[] args) throws Exception{

        System.out.println("Ping 1!");
        //Class.forName("org.h2.Driver");
        //Connection conn = DriverManager.getConnection("jdbc:h2:~/Estudiantes", "sa", "");

        get("/", (req, res) -> "Hello World");
        
        System.out.println("Ping 2!");
        //conn.close();
    }
}
