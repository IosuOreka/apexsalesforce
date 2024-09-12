public class TicketNotificationService {
    @future(callout=true)
    public static void sendTicketDataToExternalSystem(String ticketJson) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://orknetdes.orekait.com:443/RESTAdapter/NotificacionIncidencias');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json');
        
        // Añadir el token de autenticación
        String authToken = 'Bearer YOUR_AUTH_TOKEN'; // Reemplaza 'YOUR_AUTH_TOKEN' con el token real
        request.setHeader('Authorization', authToken);
        
        request.setBody(ticketJson);
        
        try {
            HttpResponse response = http.send(request);
            if (response.getStatusCode() != 200) {
                System.debug('Error: ' + response.getStatus());
            }
        } catch (Exception e) {
            System.debug('Exception: ' + e.getMessage());
        }
    }
}

trigger TicketSFTrigger on Ticket_SF (after update) {
    for (Ticket_SF ticket : Trigger.new) {
        // Convertir el ticket a JSON
        String ticketJson = JSON.serialize(ticket);
        
        // Llamar a la clase de servicio para enviar los datos
        TicketNotificationService.sendTicketDataToExternalSystem(ticketJson);
    }
}