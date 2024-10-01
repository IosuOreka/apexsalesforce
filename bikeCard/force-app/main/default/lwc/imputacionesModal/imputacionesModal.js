import { LightningElement, api } from 'lwc';

export default class ImputacionesModal extends LightningElement {
    userData;  
    imputaciones = [];  
    isLoading = false;  
    isModalVisible = false;  
    accessToken = null;
    username = sessionStorage.getItem('nombre');
    password = sessionStorage.getItem('password');


    @api showModal(userData) {
        this.userData = userData;  
        this.getTokenAndFetchImputaciones(); 
        this.isModalVisible = true;  
    }

    hideModal() {
        this.isModalVisible = false;  
    }

    // Función para obtener el token y luego las imputaciones
    getTokenAndFetchImputaciones() {
        this.loginAndFetchImputaciones();  
    }

    // Función para iniciar sesión y obtener el accessToken
    loginAndFetchImputaciones() {
      
        console.log("username: ", this.username);
        console.log("password: ", this.password);
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
            console.log("Data del loggin: ", data)
            if (data.status === 200) {
                this.accessToken = data.accessToken;  
                this.getImputaciones();  
            } else {
                console.error('Error al iniciar sesión: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error al iniciar sesión: ' + error);
        });
    }

   
    getImputaciones() {
        this.isLoading = true;  

        const url = 'https://192.168.7.32:3000/imputaciones/getAllImputacionesByUserSalesforce';

        // Realiza la solicitud POST con el username
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `${this.accessToken}`  
            },
            body: JSON.stringify({ "username": this.userData.username })  
        })
        .then(response => response.json())  
        .then(data => {
            this.imputaciones = data;  
            this.isLoading = false;    
        })
        .catch(error => {
            console.error('Error fetching imputaciones:', error);
            this.isLoading = false;  
        });
    }
}
