/**
 * Created by Siclait on 5/23/2016.
 */

// Libraries
import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static spark.Spark.get;
import freemarker.template.*;
import freemarker.*;
import freemarker.core.*;
import spark.ModelAndView;
import spark.template.freemarker.FreeMarkerEngine;

public class Main {

    private static ArrayList<Student> students = null;

    public static void main(String[] args) throws Exception{

        RunSparkEnvironment();
        //ExecuteQuery(new Student(), "");
        //Writer out = new OutputStreamWriter(System.out);
        //homePage.process(database, out);
    }

    // H2 Database Functions
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

                case "list ": // search query

                    rs = stat.executeQuery("Select * From ESTUDIANTES");

                    students = new ArrayList<>();

                    while(rs.next())
                        students.add(new Student(rs.getString("matricula"), rs.getString("nombre"), rs.getString("apellidos"), rs.getString("telefono")));

                    break;
                default: // specific search query

                    rs = stat.executeQuery("Select * From ESTUDIANTES WHERE MATRICULA=" + query);

                    students = new ArrayList<>();

                    while(rs.next())
                        students.add(new Student(rs.getString("matricula"), rs.getString("nombre"), rs.getString("apellidos"), rs.getString("telefono")));

                    break;
            }

            //System.out.println("\nClosing Database");
            //conx.close();
        }
        catch (ClassNotFoundException exp)// Driver error
        {
            System.out.println("DRIVER ERROR: " + exp.getMessage());
        }
        catch (SQLDataException exp)
        {
            System.out.println("SQL DATA ERROR: " + exp.getMessage());
        }
        catch (SQLException exp)
        {
            System.out.println("SQL ERROR: " + exp.getMessage());
        }
        catch (Exception exp) // General errors
        {
            System.out.println("ERROR! --> " + exp.getMessage());
        }
    }

    // Sparkjava Environment Functions
    public static void RunSparkEnvironment()
    {
        // http://localhost:4567/
        get("/", (req, res) -> {
            res.status(200);
            Map<String, Object> attributes = new HashMap<>();

            ExecuteQuery(new Student(), "list");

            if(!students.isEmpty())
                attributes.put("Registry", students.toArray());
            else
                System.out.println("EMPTY VARIABLE");

            attributes.put("message", "Registered Students");
            attributes.put("url1", "http://localhost:4567/new");
            attributes.put("url2", "http://localhost:4567/modify");

            return new ModelAndView(attributes, "index.ftl");
        }, new FreeMarkerEngine());

        // http://localhost:4567/modify/xxxxXXXX
        // Best to use Matricula as parameter to avoid data corruption "/"
        get("/modify/:matricula", (req, res) -> {
            res.status(200);
            Map<String, Object> attributes = new HashMap<>();

            ExecuteQuery(new Student(), req.params(":matricula"));

            Student stud = students.remove(0);

            attributes.put("message", "Student Modification");
            attributes.put("matricula", req.params(":matricula"));
            attributes.put("oldName", stud.getName());
            attributes.put("oldLastName", stud.getLastName());
            attributes.put("oldTelephone", stud.getTelephone());

            return new ModelAndView(attributes, "modify.ftl");
        }, new FreeMarkerEngine());

        // http://localhost:4567/new
        get("/new", (req, res) -> {
            res.status(200);
            Map<String, Object> attributes = new HashMap<>();

            attributes.put("message", "Student Registration");

            return new ModelAndView(attributes, "register.ftl");
        }, new FreeMarkerEngine());

    }
}
