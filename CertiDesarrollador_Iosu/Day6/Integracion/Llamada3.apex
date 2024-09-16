//Las llamadas con métodos que van hacia fuera de SF requieren de future methods. Esta es la clase apex que actualmente me funciona y que mira hacia fuera.


public class NotificacionIncidencias {
    @future(callout=true)
    public static void enviarNotificacionFuture() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();

        request.setMethod('POST');
        request.setEndpoint('https://orknetdes.orekait.com/RESTAdapter/NotificacionIncidencias');

        String username = 'C4C_CONN';
        String password = 'Inicial01*';
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        request.setHeader('Authorization', authorizationHeader);

        request.setHeader('Content-Type', 'application/json');
    
        String caseNumber = 'C-12345';
        String caseDescription = 'Problema con el servicio de Internet. El cliente reporta que el servicio no funciona correctamente desde hace 3 días.';

        String body = '{"caseNumber": "' + caseNumber + '", "caseDescription": "' + caseDescription + '"}';
        request.setBody(body);

        try {
            HttpResponse response = http.send(request);
            if (response.getStatusCode() == 202) {
                System.debug('Respuesta con éxito: ' + response.getBody());
            } else {
                System.debug('Respuesta sin éxito. Código de estado: ' + response.getStatusCode());
            }
        } catch (Exception e) {
            System.debug('Error en la solicitud HTTP: ' + e.getMessage());
        }
    }
}