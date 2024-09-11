public class NotificacionIncidencias {
    public void enviarNotificacion() {
        // Crear el objeto Http para hacer la solicitud
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        // Establecer el método (puede ser GET o POST según lo que requiera el servicio)
        request.setMethod('GET'); // o 'GET' según lo que necesites

        // URL de la API
        request.setEndpoint('https://orknetdes.orekait.com/RESTAdapter/NotificacionIncidencias');

        // Agregar las credenciales de autenticación básicas
        String username = 'C4C_CONN';
        String password = 'Inicial01*';
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        request.setHeader('Authorization', authorizationHeader);

        request.setHeader('Content-Type', 'application/json');

        try {
            // Enviar la solicitud
            HttpResponse response = http.send(request);
            System.debug('Entro en el try.')
            // Evaluar el código de respuesta
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
