// Implementa una clase `CurrencyConverter` con un método `convertToUSD` que acepte una cantidad en una moneda extranjera y un tipo de cambio, 
// y devuelva el equivalente en dólares estadounidenses.

//B - declara propiedades de monedas para que al llegar la petición coja de ellos el tipo de cambio.

public class CurrencyConverter{

    public Decimal tipoLibras{get; set;}
    public Decimal tipoEuros{get; set;}
    public Decimal tipoPesos{get; set;}
    public Decimal Amount{get; set;}

    public CurrencyConverter(Decimal amo, String t){
        this.amount = amo;

        if(t == 'LIB'){
            this.tipoLibras = t;
        }else if( t == 'EUR'){
            this.tipoEuros = t;
        }else{
            this.tipoPesos = t;
        }
    }

    public Decimal convertLibrasToUSD(){
        return amount * tipoLibras;
    }
    public Decimal convertEurosToUSD(){
        return amount * tipoEuros;
    }
    public Decimal convertPesosToUSD(){
        return amount * tipoPesos;
    }
}