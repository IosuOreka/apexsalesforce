import { LightningElement, api } from 'lwc';

export default class Hijo1 extends LightningElement {
    @api mensaje;
    mensajeOculto = true;
    buttonText= 'Mostrar mensaje';

    handleClick() {
        this.mensajeOculto = !this.mensajeOculto;
        this.buttonText = this.mensajeOculto ? 'Mostrar mensaje' : 'Ocultar mensaje';
    }
}