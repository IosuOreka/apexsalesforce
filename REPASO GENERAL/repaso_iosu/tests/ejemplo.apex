/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-01-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class Calculadora {
    public Integer sumar(Integer a, Integer b){
        return a + b;
    }
}

@isTest
public class CalculadoraTest{
    @isTest
    static void testSumar(){

        //Abrir una instancia a la clase que se quiere probar.
        Calculadora calc = new Calculadora();

        //Llamar al método que se quiere testear.
        Integer resultado = calc.sumar(2, 3);

        //Verificación de funcionamiento.
        System.assertEquals(5, resultado, 'La suma de 2 + 3 debe dar 5.');
    }
}