import { LightningElement, track, api } from 'lwc';
import updateImputacion from '@salesforce/apex/ImputacionService.updateImputacion';

export default class Imputaciones extends LightningElement {
        @track isModalOpen = false; // Controla la visibilidad del modal
    @api selectedImputacion = {}; // Contiene la imputación seleccionada

    // Cerrar el modal
    closeModal() {
        this.isModalOpen = false; // Cambia el estado del modal
        this.selectedImputacion = {}; // Opcional: Limpiar la imputación seleccionada
    }

    // Guardar la imputación editada
    handleSave() {
        console.log(this.selectedImputacion); // Muestra la imputación seleccionada en consola
        // Llamada al método de Apex para actualizar la imputación
        updateImputacion({ imputacion: this.selectedImputacion })
            .then(() => {
                this.closeModal(); // Cierra el modal después de la actualización
            })
            .catch((error) => {
                console.error('Error updating imputacion:', error);
            });
    }

    // Manejar cambios en los inputs
    handleInputChange(event) {
        const field = event.target.dataset.id; // Obtiene el campo a modificar
        const value = event.target.value; // Obtiene el nuevo valor

        // Actualiza el campo correspondiente en selectedImputacion
        this.selectedImputacion = {
            ...this.selectedImputacion,
            [field]: value // Usa el campo dinámicamente para actualizar el objeto
        };

        // Para depuración, muestra en la consola el valor actualizado
        console.log('selectedImputacion actualizada:', this.selectedImputacion);
    }
}
