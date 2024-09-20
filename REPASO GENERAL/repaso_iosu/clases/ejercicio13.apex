/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-16-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
// Implementa una clase `DiscountCalculator` con métodos para calcular el precio con descuento basándose en el precio original y la tasa de descuento. Implementa también un método `getFinalPrice` que devuelva el precio
//  final después de aplicar el descuento.

public class DiscountCalculator{
    public Decimal getFinalPrice(Decimal precio, Decimal descuento){
        return precio * (1 - descuento);
    }
}