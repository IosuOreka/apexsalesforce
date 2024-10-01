import { LightningElement } from 'lwc';
import insertarProyectos from '@salesforce/apex/ProyectoService.insertarProyectos';
import insertarImputaciones from '@salesforce/apex/ImputacionService.insertarImputaciones';
import borrarProyectos from '@salesforce/apex/ProyectoService.borrarProyectos';
import borrarImputaciones from '@salesforce/apex/ImputacionService.borrarImputaciones';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class UserSearch extends LightningElement {
    users = [];
    paginatedUsers = [];
    currentPage = 1;
    pageSize = 10;
    totalPages = 0;
    selectedUser = null;
    error;
    accessToken = null;
    username = '';  
    password = '';  
    proyectosDTO = []; 
    imputacionesDTO = [];

    // Función para manejar cambios en el campo de username
    handleUsernameChange(event) {
        this.username = event.target.value;
        sessionStorage.setItem("nombre", this.username);
    }

    // Función para manejar cambios en el campo de password
    handlePasswordChange(event) {
        this.password = event.target.value;
        sessionStorage.setItem("password", this.password);
    }

    // Función para iniciar sesión cuando el usuario hace clic en "Obtener usuarios"
    handleLogin() {
        if (this.username && this.password) {
            this.login();
        } else {
            this.error = 'Por favor, introduce el usuario y la contraseña.';
        }
    }

    // Método para borrar proyectos en Salesforce
    borrarProyectosSalesforce() {
        borrarProyectos()
        .then(result => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Éxito',
                    message: result, 
                    variant: 'success',
                })
            );
        })
        .catch(error => {
            this.error = 'Error al borrar proyectos: ' + error.body.message;
            console.error(this.error);
        });
    }

    // Método para borrar proyectos en Salesforce
    borrarImputacionesSalesforce() {
        borrarImputaciones()
        .then(result => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Éxito',
                    message: result, 
                    variant: 'success',
                })
            );
        })
        .catch(error => {
            this.error = 'Error al borrar proyectos: ' + error.body.message;
            console.error(this.error);
        });
    }
    
    // Función para iniciar sesión y obtener el accessToken
    login() {
        const url = 'https://192.168.7.32:3000/user/login';
        const body = JSON.stringify({
            user: this.username,  
            password: this.password  
        });

        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: body
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 200) {
                this.accessToken = data.accessToken;  
                this.error = null;  
                this.getAllUsers(); 
            } else {
                this.error = 'Error al iniciar sesión: ' + data.message;
            }
        })
        .catch(error => {
            this.error = 'Error al iniciar sesión: ' + error;
        });
    }

    // Función para obtener todos los usuarios
    getAllUsers() {
        const url = 'https://192.168.7.32:3000/user/getAllUsers';
        fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `${this.accessToken}` 
            }
        })
        .then(response => response.json())
        .then(data => {
            this.users = data[0];  
            this.totalPages = Math.ceil(this.users.length / this.pageSize);
            this.updatePaginatedUsers();
        })
        .catch(error => {
            this.error = 'Error al obtener los usuarios: ' + error;
        });
    }

    // Función para obtener proyectos y enviarlos a Apex
    getAllProyectos() {
        const url = 'https://192.168.7.32:3000/proyectos/getAllproyectos';
        fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `${this.accessToken}` 
            }
        })
        .then(response => response.json())
        .then(data => {
            if (data.proyectos && data.proyectos.length > 0) {
                this.proyectosDTO = data.proyectos.map(proyecto => {
                    return {
                        id: proyecto.id,  
                        nombre: proyecto.nombre,  
                        fechaApertura: proyecto.fechaApertura ? new Date(proyecto.fechaApertura).toISOString().split('T')[0] : null,  
                        fechaPrevistaCierre: proyecto.fechaPrevistaCierre ? new Date(proyecto.fechaPrevistaCierre).toISOString().split('T')[0] : null,  
                        fechaCierreReal: proyecto.fechaCierreReal ? new Date(proyecto.fechaCierreReal).toISOString().split('T')[0] : null,  
                        totalHoras: proyecto.totalHoras || 0, 
                    };
                });
                
                this.insertarProyectosEnSalesforce(); 
            } else {
                this.error = 'No se encontraron proyectos.'; 
            }
        })
        .catch(error => {
            this.error = 'Error al obtener los proyectos: ' + error; 
        });
    }

    getAllImputaciones() {
        const url = 'https://192.168.7.32:3000/imputaciones/getAllImputaciones';
        fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `${this.accessToken}` 
            }
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json();
        })
        .then(data => {
            if (data && data.length > 0) {
                // Procesar los datos de las imputaciones
                this.imputacionesDTO = data.map(imputacion => {
                    return {
                        id: imputacion.id,
                        username: imputacion.username,
                        proyectoId: imputacion.proyectoId,
                        tareaName: imputacion.tareaName,
                        horasImputadas: imputacion.horasImputadas,
                        fechaImputacion: imputacion.fechaImputacion,
                        nombreProyecto: imputacion.nombreProyecto
                    };
                });
                this.insertarImputacionesEnSalesforce();
            } else {
                this.error = 'No se encontraron imputaciones.'; 
            }
        })
        .catch(error => {
            this.error = 'Error al obtener las imputaciones: ' + error.message; 
            console.error(this.error);
        });
    }
    

    // Función para insertar proyectos en Salesforce a través de Apex
    insertarProyectosEnSalesforce() {
        insertarProyectos({ proyectosDTO: this.proyectosDTO })
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Éxito',
                        message: 'Proyectos insertados correctamente.',
                        variant: 'success',
                    }),
                );
            })
            .catch(error => {
                this.error = 'Error al insertar proyectos: ' + error.body.message;
                console.error(this.error);
            });
    }

    // Función para insertar proyectos en Salesforce a través de Apex
    insertarImputacionesEnSalesforce() {
        insertarImputaciones({ imputacionesDTO: this.imputacionesDTO })
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Éxito',
                        message: 'Imputaciones insertadas correctamente.',
                        variant: 'success',
                    }),
                );
            })
            .catch(error => {
                this.error = 'Error al insertar imputaciones: ' + error.body.message;
                console.error(this.error);
            });
    }

    // Paginación de usuarios
    updatePaginatedUsers() {
        const start = (this.currentPage - 1) * this.pageSize;
        const end = start + this.pageSize;
        this.paginatedUsers = this.users.slice(start, end);
    }

    handleNextPage() {
        if (this.currentPage < this.totalPages) {
            this.currentPage += 1;
            this.updatePaginatedUsers();
        }
    }

    handlePreviousPage() {
        if (this.currentPage > 1) {
            this.currentPage -= 1;
            this.updatePaginatedUsers();
        }
    }

    handleRowAction(event) {
        const selectedUserData = event.detail.row;
        this.selectedUser = selectedUserData;
        const modal = this.template.querySelector('c-imputaciones-modal');
        if (modal) {
            modal.showModal(this.selectedUser);
        } else {
            console.error('Modal not found');
        }
    }

    // Definición de las columnas de la tabla
    columns = [
        { label: 'Nombre', fieldName: 'name' },
        { label: 'Username', fieldName: 'username' },
        { label: 'Email', fieldName: 'email', type: 'email' },
        { label: 'Teléfono', fieldName: 'tlf', type: 'phone' },
        {
            type: 'button',
            typeAttributes: {
                label: 'Imputaciones',
                name: 'imputaciones',
                title: 'Click to view imputaciones',
                variant: 'brand',
                disabled: false,
                value: 'imputaciones',
                iconPosition: 'right'
            },
            cellAttributes: {
                alignment: 'center'
            }
        }
    ];
}
