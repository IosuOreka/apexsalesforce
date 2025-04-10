import { LightningElement } from 'lwc';

export default class Ejercicio1 extends LightningElement {
    iosuText="Hoy es viernes asique date prisa que la cerveza se acaba";
    iosuText2;
    text=["Hola","Adios","Buenos días","Buenas tardes","Buenas noches"];
    inputText;
    mensaje = "Mensaje desde el componente padre";
    listaCompra = ["Leche","Pan","Huevos","Tomate","Cebolla","Pimiento","Pescado","Carne","Pollo","Cerveza","Vino"];
    resumen = {nombre:"", email:""}
    mostrarResumen = false;

    handleClick() {
        this.iosuText2 = this.text[Math.floor(Math.random() * this.text.length)];
    }

    handleInputChange(event) {
        this.inputText = event.target.value;
    }

    handleInputChange2(event) {
        this.resumen = { ...this.resumen, nombre: event.target.value };
    }

    handleInputChange3(event) {
        this.resumen = { ...this.resumen, email: event.target.value };
    }

    handleClick2(event) {
        event.preventDefault();
        this.mostrarResumen = true;
    }

}