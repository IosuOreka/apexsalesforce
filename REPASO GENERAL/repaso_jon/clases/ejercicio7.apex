// Implementa una clase `DateHelper` con un método `getDaysBetween` que acepte dos fechas y devuelva el número de días entre ellas.

public class DateHelper{

    public Date d1{get; set;}
    public Date d2{get; set;}

    public DateHelper(Date d1f, Date d2f){
        this.d1 = d1f;
        this.d2 = d2f;
    }

    public Integer getDaysBetween(){
        Integer daysBetween = d1.daysBetween(d2);
        return daysBetween;
    }
}


// Date d1 = Date.newInstance(2024, 9, 1);
// Date d2 = Date.newInstance(2024, 9, 12);

// DateHelper helper = new DateHelper();
// Integer days = helper.getDaysBetween(d1, d2);

// System.debug('Días entre las fechas: ' + days);  