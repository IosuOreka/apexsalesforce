/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 09-16-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

//  Desarrolla una clase `Notification` con propiedades `Recipient` y `Message`. Agrega un método `sendNotification` 
//  que simule el envío de una notificación (puede ser un simple `System.debug`).


public class Notification{

    public String Recipient {get; set;}
    public String Message {get; set;}

    public Notification(String r, String m){
        this.Recipient = r;
        this.Message = m;
    }

    public void sendNotification(){
        System.debug('Mensaje de : ' + this.Recipient+ '. Contenido: ' + this.Message);
    }
}