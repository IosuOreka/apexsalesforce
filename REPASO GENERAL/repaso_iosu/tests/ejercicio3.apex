/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-01-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
//Ojo, % no es válido en APEX.

public class numerosComprobacion{
    public Boolean esPar(Integer a){
        return Math.mod(a, 2) == 0;
    }
}

@isTest
public class numerosTest{
    static void esParTest(){
        numerosComprobacion num = new numerosComprobacion();

        Boolean resultado = num.esPar(8);
        Boolean resultado2 = num.esPar(9);

        System.assertEquals(true, resultado, 'El número 8 es par');
        System.assertEquals(false, resultado2, 'El número 9 no es par');
    }
}