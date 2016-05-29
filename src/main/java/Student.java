/**
 * Created by Siclait on 5/24/2016.
 */
public class Student {

    // Attributes
    private String matricula;
    private String name;
    private String lastName;
    private String telephone;

    // Constructors
    public Student(){

    }

    public Student(String matricula, String name, String lastName, String telephone){
        this.matricula = matricula;
        this.name = name;
        this.lastName = lastName;
        this.telephone = telephone;
    }

    // GETS
    // Student Matricula
    public String getMatricula()
    {
        return matricula;
    }

    // Student Name
    public String getName()
    {
        return name;
    }

    // Student Last Name
    public String getLastName()
    {
        return lastName;
    }

    // Student Telephone
    public String getTelephone()
    {
        return telephone;
    }

}
