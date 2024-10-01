/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-01-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class Multiplicadora{
    public Integer multiplicar(Integer a, Integer b){
        return a * b;
    }
}


@isTest
public class MultiplicarTest{
    @isTest
    static void multiplicarTest(){

        Multiplicadora multi = new Multiplicadora();

        Integer resultado = multi.multiplicar(3, 4);

        System.assertEquals(12, resultado, '3 x 4 siempre son 12.')

    }
}