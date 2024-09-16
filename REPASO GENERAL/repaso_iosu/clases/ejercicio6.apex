// Desarrolla una clase `User` con propiedades para `Username` y `Email`. Crea un método `isEmailValid` que verifique si la dirección de correo electrónico tiene un formato válido (puedes usar una expresión regular simple para esto).

public class User{

    public String username{get; set;}
    public String email{get; set;}

    public User(String u, String e){
        this.username = u;
        this.email = e; 
    }

    public Boolean isEmailValid(){
        String emailRegex = '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$';
        if (email != null && email.matches(emailRegex)) {
            return true; 
        } else {
            return false; 
        }
    }
    
}