//Enunciado:** Implementa una clase `DiscountCalculator` con métodos para calcular el precio con descuento basándose en el precio original y la tasa de descuento. Implementa también un método `getFinalPrice` que devuelva el precio final después de aplicar el descuento.

public class DiscountCalculator {
    public Decimal OriginalPrice { get; set; }
    public Decimal DiscountRate { get; set; }

    public DiscountCalculator(Decimal OriginalPrice, Decimal DiscountRate) {
        this.OriginalPrice = OriginalPrice;
        this.DiscountRate = DiscountRate;
    }

    public Decimal getFinalPrice() {
        return OriginalPrice - (OriginalPrice * DiscountRate / 100);
    }
}