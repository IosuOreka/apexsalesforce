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

        // Ejemplo de datos adaptados al payload. 
        String specversion = '1.0';
        String type = '/sap.c4c/Ticket.Root.Updated';
        String source = '/XAF/sap.c4c/000000000741207345';
        String id = '9f41b91b-0687-1edf-9c9d-95b36b7f248c';
        String eventType = 'Ticket.Root.Updated';
        String eventTypeVersion = 'v1';
        String eventId = '9f41b91b-0687-1edf-9c9d-95b36b7f248c';
        String eventTime = '2024-09-12T09:52:08Z';
        String eventTechnicalName = 'SERVICE_REQUEST.Root.Updated';
        String rootEntityId = '913A84F13AB01EDF9BE8EA149792F49C';
        
        // Construcción del JSON con los datos que quiero enviar. Los datos están hardcodeados para pruebas sino los traería desde el trigger.
        String body = '{' +
            '"specversion": "' + specversion + '", ' +
            '"type": "' + type + '", ' +
            '"source": "' + source + '", ' +
            '"id": "' + id + '", ' +
            '"event-type": "' + eventType + '", ' +
            '"event-type-version": "' + eventTypeVersion + '", ' +
            '"event-id": "' + eventId + '", ' +
            '"event-time": "' + eventTime + '", ' +
            '"event-technical-name": "' + eventTechnicalName + '", ' +
            '"data": {' +
                '"root-entity-id": "' + rootEntityId + '", ' +
                '"entity-id": "' + rootEntityId + '", ' +
                '"Changes": [' +
                    '{' +
                        '"node": "Ticket", ' +
                        '"nodeID": "' + rootEntityId + '", ' +
                        '"ParentNodeID": "", ' +
                        '"Modification": "Updated", ' +
                        '"ChangedBy": "SAP_SYSTEM", ' +
                        '"ChangedFields": [' +
                            '{' +
                                '"Fieldname": "SystemAdministrativeData/LastChangeDateTime", ' +
                                '"New": "2024-09-12T09:52:08.7245720Z", ' +
                                '"Old": "2024-09-12T09:51:56.1706790Z"' +
                            '},' +
                            '{' +
                                '"Fieldname": "SystemAdministrativeData/LastChangeIdentityUUID/content", ' +
                                '"New": "00163E922B641ED9ABA551F17A37B394", ' +
                                '"Old": "00163ECD70101EDC9A9242A3D574EFAC"' +
                            '},' +
                            '{' +
                                '"Fieldname": "Status/ServiceRequestLifeCycleStatusCode", ' +
                                '"New": "3", ' +
                                '"Old": "2"' +
                            '},' +
                            '{' +
                                '"Fieldname": "Status/RequestAssignmentStatusCode", ' +
                                '"New": "2", ' +
                                '"Old": "1"' +
                            '}' +
                        ']' +
                    '},' +
                ']' +
            '}' +
        '}';

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
