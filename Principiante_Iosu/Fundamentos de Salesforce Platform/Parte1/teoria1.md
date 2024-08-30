Salesforce es una plataforma de CRM (Customer Relationship Management) basada en la nube que permite a las empresas gestionar sus relaciones con los clientes y sus datos de manera efectiva. Para realizar personalizaciones como agregar un campo personalizado al objeto **Contact**, es importante entender algunos principios teóricos clave:

### 1. **Objetos en Salesforce**
   - **Objetos Estándar**: Salesforce proporciona una serie de objetos estándar, como *Contact*, *Account*, *Opportunity*, etc. Estos objetos son predefinidos y cubren las necesidades comunes de gestión de datos en un CRM.
   - **Objetos Personalizados**: Además de los objetos estándar, Salesforce permite crear objetos personalizados para satisfacer necesidades específicas de negocio que no se cubren con los objetos estándar.

### 2. **Campos en Salesforce**
   - **Campos Estándar**: Cada objeto estándar viene con una serie de campos estándar, como el nombre, la dirección, el teléfono, etc.
   - **Campos Personalizados**: Puedes agregar campos personalizados a cualquier objeto, ya sea estándar o personalizado, para capturar información adicional relevante para tu negocio.

### 3. **Tipos de Datos de Campos**
   - Los campos personalizados pueden tener diferentes tipos de datos, como *Texto*, *Número*, *Fecha*, *Moneda*, entre otros. En este caso, para el campo "Loan Amount", el tipo de dato será **Moneda (Currency)**.

### 4. **Personalización de Salesforce**
   - Salesforce es altamente personalizable a través de su interfaz de configuración, donde se pueden agregar nuevos campos, crear objetos personalizados, configurar flujos de trabajo, automatizar procesos, y mucho más sin necesidad de programación.

### 5. **Interfaces de Usuario**
   - Salesforce proporciona una interfaz intuitiva para crear y administrar objetos, campos y otras configuraciones. Desde la **Setup** (Configuración), puedes acceder a todos estos elementos y realizar las personalizaciones necesarias.

### **Instrucciones para agregar un campo personalizado al objeto Contact:**

1. **Acceder a la Configuración**:
   - Ve a *Setup* (Configuración) en la esquina superior derecha de Salesforce.

2. **Buscar el Objeto Contact**:
   - En el cuadro de búsqueda rápido, escribe "Objects" y selecciona *Object Manager*.
   - En *Object Manager*, busca y selecciona el objeto *Contact*.

3. **Agregar un Campo Personalizado**:
   - Dentro del objeto *Contact*, ve a la sección *Fields & Relationships* (Campos y Relaciones).
   - Haz clic en *New* (Nuevo) para crear un nuevo campo.
   - Selecciona el tipo de dato *Currency* (Moneda) y haz clic en *Next* (Siguiente).

4. **Configurar el Campo**:
   - En la pantalla de configuración del campo, ingresa la siguiente información:
     - **Field Label (Etiqueta del Campo):** Loan Amount
     - **Field Name (Nombre del Campo):** Loan_Amount
   - Configura cualquier otra opción necesaria y haz clic en *Next*.

5. **Establecer la Visibilidad**:
   - Define quién puede ver y editar este campo. Generalmente, se elige la visibilidad predeterminada para todos los perfiles.
   - Haz clic en *Next*.

6. **Agregar a las Páginas de Registro**:
   - Elige en qué páginas de registro debe aparecer este campo.
   - Haz clic en *Save* (Guardar).

Una vez completado, los brokers podrán ver y editar el campo "Loan Amount" en los registros de Contacto, lo que les permitirá conocer cuánto puede pedir prestado un cliente para mostrarles las propiedades adecuadas.