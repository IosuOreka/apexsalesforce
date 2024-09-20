import { LightningElement, api } from 'lwc';

export default class ImputacionesModal extends LightningElement {
    userData;  // Variable para almacenar los datos del usuario
    imputaciones = [];  // Lista de imputaciones que se mostrarán en el modal
    isLoading = false;  // Indicador de carga de imputaciones
    isModalVisible = false;  // Indicador para mostrar/ocultar el modal

    @api showModal(userData) {
        this.userData = userData;  // Asigna los datos del usuario seleccionado
        this.getImputaciones();    // Llama a la función para obtener las imputaciones del usuario
        this.isModalVisible = true;  // Muestra el modal
    }

    hideModal() {
        this.isModalVisible = false;  // Oculta el modal
    }

    // Función para obtener las imputaciones del usuario seleccionado
    getImputaciones() {
        this.isLoading = true;  // Activa el indicador de carga
        const url = 'https://192.168.7.32:3000/imputaciones/getAllImputacionesByUserSalesfore ';

        // Realiza la solicitud POST con el username
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            // Aquí enviamos el body exactamente como lo necesita el backend: { body: { username: 'valor' } }
            body: JSON.stringify({ username: this.userData.username })
        })
        .then(response => response.json())  // Procesa la respuesta JSON
        .then(data => {
            this.imputaciones = data;  // Almacena las imputaciones en la variable
            this.isLoading = false;    // Desactiva el indicador de carga
        })
        .catch(error => {
            console.error('Error fetching imputaciones:', error);
            this.isLoading = false;  // Desactiva el indicador de carga en caso de error
        });
    }
}
