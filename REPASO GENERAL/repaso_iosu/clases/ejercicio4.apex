//Implementa una clase Rectangle con propiedades length y width. Agrega un método calculateArea que devuelva el área del rectángulos.

public class Rectangulo{

    public Decimal length{ get; set;}
    public Decimal width{ get; set;}

    public Rectangle(Decimal len, Decimal wit){
        this.length = len;
        this.width = wit;
    }

    public Decimal calculateArea(){
        return length * width;
    }
}


// list<Integer> edades = new List<Integer>{20,30,40};

Rectangle rec = new Rectangle(10.0, 20.0);

System.debug('Área del rectángulo: ' + rec.calculateArea());