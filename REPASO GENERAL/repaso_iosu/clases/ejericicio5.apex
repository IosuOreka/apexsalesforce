// Crea una clase Apex llamada `InventoryItem` con propiedades para `ItemName`, `Quantity`, y `Price`. 
// Agrega un método `getTotalValue` que devuelva el valor total del inventario para ese artículo (cantidad * precio).

public class InventoryItem{

    public String ItemName{ get; set;}
    public Integer Quantity{ get; set;}
    public Decimal Price{ get; set;}

    public InventoryItem(String name, Integer q, Decimal p){
        this.ItemName = name;
        this.Quantity = q;
        this.Price = p;
    }

    public Decimal getTotalValue(){
        return Quantity * Price;
    }
}

InventoryItem inv = new InventoryItem('Ordenador', 2, 1200);

// Decimal total = inv.getTotalValue();

System.debug('El total de lo comprado es: ' + inv.getTotalValue());