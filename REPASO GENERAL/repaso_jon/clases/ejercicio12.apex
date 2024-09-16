//Enunciado:** Desarrolla una clase `Notification` con propiedades `Recipient` y `Message`. Agrega un método `sendNotification` que simule el envío de una notificación (puede ser un simple `System.debug`).

public class Notification {
    public String Recipient { get; set; }
    public String Message { get; set; }

    public Notification(String Recipient, String Message) {
        this.Recipient = Recipient;
        this.Message = Message;
    }

    public void sendNotification() {
        System.debug('Recipient: ' + Recipient + ' Message: ' + Message);
    }
}