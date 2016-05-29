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

    private static void AddStudent(String matricula, String name, String lastName, String telephone)
    {
        Student stud = new Student(matricula, name, lastName, telephone);
        ExecuteQuery(stud, "insert");
    }

    private static void DeleteStudent(String matricula)
    {
        Student stud = new Student(matricula, "X", "X", "X");
        ExecuteQuery(stud, "delete");
    }

    private static void ModifyStudent(String matricula, String newName, String newLastName, String newTelephone)
    {
        // Them matricula iss the only non modifiable attribute
        // Serves as reference key
        // Once assigned it CANNOT be changed
        Student stud = new Student(matricula, newName, newLastName, newTelephone);
        ExecuteQuery(stud, "modify");
    }

    private static void ExecuteQuery(Student stud, String query)
    {
        try
        {
            System.out.println("Connecting to DataBase...");
            Class.forName("org.h2.Driver");
            // H2 automatically creates new databases is they don't exist
            // ;IFEXIST=TRUE is used to specify the application will only
            // use a pre-existing database
            Connection conx = DriverManager.getConnection("jdbc:h2:tcp://localhost/~/AcademiaDB;IFEXISTS=TRUE", "sa", "");
            System.out.println("\nSuccessfully Connected!");

            // Preparing to execute query
            Statement stat = conx.createStatement();
            ResultSet rs;
            String querycmd;

            switch (query)
            {
                case "insert":

                    querycmd = "INSERT INTO ESTUDIANTES " +
                            "VALUES(" + stud.getMatricula() + ", " + stud.getName() + ", " + stud.getLastName() + ", " + stud.getTelephone() + ")";

                    stat.execute(querycmd);

                    break;

                case "delete":

                    querycmd = "DELETE FROM ESTUDIANTES WHERE MATRICULA=" + stud.getMatricula();

                    stat.execute(querycmd);

                    break;

                case "modify":

                    querycmd = "UPDATE ESTUDIANTES SET NOMBRE=" + stud.getName() + " ,APELLIDOS=" + stud.getLastName() + " ,TELEFONO="  + stud.getTelephone() + " WHERE MATRICULA=" + stud.getMatricula();

                    stat.execute(querycmd);

                    break;

                default: // For test purposes only; NOT ACCESSIBLE to final product

                    rs = stat.executeQuery("Select * From ESTUDIANTES");

                    int count = 0;

                    while(rs.next())
                    {
                        count++;
                        String formatted =  "\tMatricula: " + rs.getString("matricula") + "\n\tNombre: " + rs.getString("nombre") + "\n\tApellidos: " + rs.getString("apellidos") + "\n\tTelefono: " + rs.getString("telefono");
                        System.out.println("\nEstudiante #" + count + ":\n" + formatted);
                    }

                    break;
            }

            System.out.println("\nClosing Database");
            conx.close();
        }
        catch (ClassNotFoundException exp)// Driver error
        {
            System.out.println("DRIVER ERROR: " + exp.toString());
        }
        catch (Exception exp) // General errors
        {
            System.out.println("ERROR! " + exp.toString());
        }
    }
}
