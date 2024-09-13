// Implementa una clase `UnitConverter` con métodos para convertir entre diferentes unidades de medida,
//  como metros a kilómetros, gramos a kilogramos, y litros a mililitros.

public class UnitConverter{

    public Decimal metrosAKilometros(Integer m){
        return m/1000;
    }

    public Decimal kilometrosAMetros(Integer m){
        return m*1000;
    }
}