/**
 * Created by Siclait on 5/23/2016.
 */

// Libraries
import java.sql.*;

import static spark.Spark.*;

public class Main {

    public static void main(String[] args) throws Exception{

        // http://localhost:4567/
        get("/", (req, res) -> "Hello World");

        // http://localhost:4567/modify
        get("/modify", (req, res) -> "To modify");

        // http://localhost:4567/new
        get("/new", (req, res) -> "Add student here");

    }
}
