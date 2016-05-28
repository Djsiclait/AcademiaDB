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

    // GETS & SETS
    // Student Matricula
    public int getMatricula()
    {
        return matricula;
    }
    
    public void setMatricula(newMatricula)
    {
        // TODO: Create test that checks if matricula is unique
        
        if(newMatricula.toString().length() == 8)
            this.matricula = newMatricula;
    }

    // Student Name
    public String getName()
    {
        return name;
    }
    
    public void setName(newName)
    {
        this.name = newName;
    }
    
    // Student Last Name
    public String getLastName()
    {
        return lastName;
    }
    
    public void setLastName(newLastName)
    {
        this.lastName = newLastName;
    }
    
    // Student Telephone
    public String getTelephone()
    {
        return telephone;
    }
    
    public void setTelephone(newTelephone)
    {
        if(newTelephone.length() == 10)
            this.telephone = newTelephone;
    }
}
