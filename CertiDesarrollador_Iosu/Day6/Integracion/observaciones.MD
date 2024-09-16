Estos son los puntos que he encontrado de lo que tiene el ejemplo de payload salesforce con la info qué es cada elemento del payload.

A) ENCABEZADO

{
  "specversion": "1.0",
  "type": "/sap.c4c/Ticket.Root.Updated",
  "source": "/XAF/sap.c4c/000000000741207345",
  "id": "9f41b91b-0687-1edf-9c9d-95b36b7f248c",
  "event-type": "Ticket.Root.Updated",
  "event-type-version": "v1",
  "event-id": "9f41b91b-0687-1edf-9c9d-95b36b7f248c",
  "event-time": "2024-09-12T09:52:08Z",
  "event-technical-name": "SERVICE_REQUEST.Root.Updated"
}

1. SPECVERSION: Versión de la especificación del evento. En este caso, es "1.0", lo que indica el estándar de eventos en uso.
2. TYPE: Tipo del evento. Aquí se especifica como "/sap.c4c/Ticket.Root.Updated", que es un identificador de tipo de evento en SAP C4C. Pregunta: ¿Esta información viene de SAP al hacer la integración?
3. SOURCE: Fuente del evento, que muestra la ruta o el identificador del sistema que generó el evento. En este caso, "/XAF/sap.c4c/000000000741207345".
4. ID: Identificador único del evento. Este es un UUID ("9f41b91b-0687-1edf-9c9d-95b36b7f248c"), que asegura que cada evento sea único. 
5. EVENT-TYPE: Tipo de evento, similar a type. Aquí, es "Ticket.Root.Updated", indicando que el evento está relacionado con una actualización de ticket.
6. EVENT-TYPE-VERSION: Versión del tipo de evento. En este caso, "v1".
7. EVENT-ID: Igual que id, es el identificador único del evento. Esto es lo que viene en el params que nos indicó Arrate y que se repite también en id.
8. EVENT-TIME: event-time: Fecha y hora en la que se produjo el evento en formato UTC ("2024-09-12T09:52:08Z").
9. EVENT-TECHNICAL-NAME: Nombre técnico del evento. Aquí, "SERVICE_REQUEST.Root.Updated".

b) DATOS DEL EVENTO.

"data": {
  "root-entity-id": "913A84F13AB01EDF9BE8EA149792F49C",
  "entity-id": "913A84F13AB01EDF9BE8EA149792F49C",
  "Changes": [...]
}

1. ROOT-ENTITY-ID: root-entity-id: Identificador del objeto raíz del evento. Aquí, "913A84F13AB01EDF9BE8EA149792F49C", que podría ser un ID de un ticket o entidad en SAP C4C.
2. ENTITY-ID: Identificador del objeto que está siendo modificado. En este caso, es el mismo que el root-entity-id, indicando que el evento se refiere a la misma entidad raíz.
3. CHANGES: Array que contiene una lista de cambios realizados. Cada cambio se detalla a continuación.

C) DETALLES DE LOS CAMBIOS.

{
  "node": "Ticket",
  "nodeID": "913A84F13AB01EDF9BE8EA149792F49C",
  "ParentNodeID": "",
  "Modification": "Updated",
  "ChangedBy": "SAP_SYSTEM",
  "ChangedFields": [...]
}


1. NODE: Nombre del nodo o componente que ha sido modificado. En este caso, "Ticket".
2. NODEID: Identificador del nodo modificado. Aquí es "913A84F13AB01EDF9BE8EA149792F49C".
3. PARENTNODEID: Identificador del nodo padre. Si el nodo no tiene un padre (es un nodo raíz), este campo puede estar vacío ("").
4. MODIFICATION: Tipo de modificación realizada. Puede ser "Updated" (actualizado), "Created" (creado), o "Deleted" (eliminado).
5. CHANGEDBY: Quién realizó la modificación. Aquí se indica como "SAP_SYSTEM", lo que sugiere que la modificación fue realizada automáticamente por el sistema SAP.
6. CHANGELABELFIELDS: Lista de campos que fueron modificados en este nodo. Cada campo tiene detalles como:

{
  "Fieldname": "Status/ServiceRequestLifeCycleStatusCode",
  "New": "3",
  "Old": "2"
}

1. FIELDNAME: Nombre del campo modificado.
2. NEW: Nuevo valor del campo.
3. OLD: Valor antiguo del campo.