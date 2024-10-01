/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 10-01-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class Palindromo{
    public Boolean esPalindromo(String palabra){
        String palabraPrevia = palabra.ToLowerCase();
        String palabraTransformada = palabra.ToLowerCase().reverse();
        return palabraPrevia == palabraTransformada;
    }
}

@isTest
public class PalindromoTest{
    @isTest
    static void esPalindromoTest(){
        Palindromo pal = new Palindromo();

        Boolean resultado = pal.esPalindromo('reconocer');

        System.assertEquals(true, resultado, 'Reconocer es un palíndromo')
    }
}