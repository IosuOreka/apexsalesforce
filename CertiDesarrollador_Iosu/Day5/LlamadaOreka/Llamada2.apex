public class GetAllUsersRequest {
    public static void getAllUsers() {
        // Crear el objeto Http para hacer la solicitud
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        
        // Establecer el método GET
        request.setMethod('GET');

        // URL del endpoint
        request.setEndpoint('https://brta.oreka.it:3007/user/getAllUsers');

        // Configurar la autenticación básica
        String username = 'oreka';
        String password = '1&SGml])A2a)b9(S';
        Blob headerValue = Blob.valueOf(username + ':' + password);
        String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
        request.setHeader('Authorization', authorizationHeader);

        // Realizar la solicitud
        try {
            HttpResponse response = http.send(request);
            
            // Comprobar el código de estado de la respuesta
            if (response.getStatusCode() == 200) {
                System.debug('Respuesta con éxito: ' + response.getBody());
            } else {
                System.debug('Respuesta sin éxito. Código de estado: ' + response.getStatusCode());
            }
        } catch (Exception e) {
            System.debug('Error en la solicitud HTTP: ' + e.getMessage());
        }
    }
}
