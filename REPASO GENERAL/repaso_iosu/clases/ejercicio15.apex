/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-16-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// Desarrolla una clase `DataProcessor` con métodos para procesar una lista de enteros. 
// Incluye métodos como `getMax`, `getMin`, y `getAverage` 
// que devuelvan el valor máximo, mínimo y el promedio de la lista, respectivamente.

public class DataProcessor{
    
    public List<Integer> ListData {get; set;}

    public DataProcessor(List<Integer> l ){
        this.ListData = l;
    }

    public Integer getMax(){

        if (ListData == null || ListData.isEmpty()) {
            return null;  
        }
        Int num = ListData[0];
        for(Integer data: ListData){
            if(data > num){
                data = num;
            }
        }
        return num;
    }

    public Integer getMin(){
        
        if (ListData == null || ListData.isEmpty()) {
            return null; 
        }

        Integer num = this.ListData[0];
        for(Integer data: this.ListData){
            if(data < num){
                data = num;
            }
        }
        return num;
    }

    public Decimal getAverage(){

        if (ListData == null || ListData.isEmpty()) {
            return null;  
        }

        Integer suma = 0;
        for(Integer data: this.ListData){
            suma += data;
        }
        Decimal resultado = suma / this.ListData.size();
        return resultado;
    }
}

//

@isTest
public class DataProcessorTest {

    @isTest
    static void testDataProcessorWithData() {
      
        List<Integer> testData = new List<Integer>{10, 20, 30, 40, 50};
        DataProcessor dp = new DataProcessor(testData);

        Integer max = dp.getMax();
        System.assertEquals(50, max, 'El valor máximo debería ser 50.');

        Integer min = dp.getMin();
        System.assertEquals(10, min, 'El valor mínimo debería ser 10.');

        Decimal average = dp.getAverage();
        System.assertEquals(30, average, 'El promedio debería ser 30.');
    }
    
    @isTest
    static void testDataProcessorWithEmptyList() {
        DataProcessor dp = new DataProcessor(new List<Integer>());

        Integer max = dp.getMax();
        System.assertEquals(null, max, 'El valor máximo de una lista vacía debería ser null.');

        Integer min = dp.getMin();
        System.assertEquals(null, min, 'El valor mínimo de una lista vacía debería ser null.');
        
        Decimal average = dp.getAverage();
        System.assertEquals(null, average, 'El promedio de una lista vacía debería ser null.');
    }
}
