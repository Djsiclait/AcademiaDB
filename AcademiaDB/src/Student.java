/**
 * Created by Siclait on 5/24/2016.
 */
public class Student {

    // Attributes
    private int matricula;
    private String name;
    private String lastName;
    private String telephone;

    // Constructors
    public Student(){

    }

    public Student(int matricula, String name, String lastName, String telephone){
        this.matricula = matricula;
        this.name = name;
        this.lastName = lastName;
        this.telephone = telephone;
    }

    // Gets
    public int getMatricula()
    {
        return matricula;
    }

    public String getName()
    {
        return name;
    }

    public String getLastName()
    {
        return lastName;
    }

    public String getTelephone()
    {
        return telephone;
    }
}
