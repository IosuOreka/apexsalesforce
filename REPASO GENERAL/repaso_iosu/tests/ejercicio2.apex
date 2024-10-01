/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-01-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class Division{
    public Decimal division(Integer a, Integer b){
        if( b == 0 ){
            return 'Infinito. No es posible realizar operación';
        }else{
            return a / b;
        }
    }
}

//Corregido
public class Division {
    public Decimal dividir(Integer a, Integer b) {
        // Validamos si el divisor es cero
        if (b == 0) {
            // Lanzamos una excepción estándar de Apex con un mensaje personalizado
            throw new MathException('Infinito. No es posible realizar la operación');
        } else {
            // Realizamos la división y retornamos el resultado como Decimal
            return Decimal.valueOf(a) / Decimal.valueOf(b);
        }
    }
}




@isTest
public class DivisionTest{
    @isTest
    static void divisiontest(){

        Division div = new Division();
        
        Decimal resultado = div.dividir(10, 5);

        System.assertEquals(2, resultado, 'El resultado debería ser 2');

    }

    //Corregido con chat. 
    @isTest
    static void testDivisionPorCero() {
        // Instanciamos la clase Division
        Division division = new Division();
        
        // Intentamos dividir por 0 y verificamos que se lance una excepción
        try {
            division.dividir(10, 0);
            System.assert(false, 'Se debería haber lanzado una excepción al dividir por cero');
        } catch (MathException e) {
            // Verificamos que el mensaje de la excepción sea el correcto
            System.assertEquals('Infinito. No es posible realizar la operación', e.getMessage(), 'El mensaje de la excepción no es el esperado');
        }
    }
}