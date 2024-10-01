import { LightningElement, track, wire, api } from 'lwc';
import getAllImputaciones from '@salesforce/apex/ImputacionService.getAllImputaciones';
import deleteImputacion from '@salesforce/apex/ImputacionService.deleteImputacion';
import updateImputacion from '@salesforce/apex/ImputacionService.updateImputacion';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class MyImputaciones extends LightningElement {
    @track imputaciones = [];
    @track filteredImputaciones = [];
    @track currentPageImputaciones = [];
    @track error;
    @track currentPage = 1;
    @track totalPages = 1;
    @track isExportDisabled = true; 
    pageSize = 20; 
    @track isModalOpen = false;
    @api selectedImputacion = {
        username__c: '',
        proyectoId__c: '',
        Name: '',
        horasImputadas__c: 0,
        fechaImputacion__c: ''
    };

    // Términos de búsqueda específicos
    @track usernameSearchTerm = '';
    @track projectIdSearchTerm = '';

    // Obtener todas las imputaciones desde el Apex
    @wire(getAllImputaciones)
    wiredImputaciones({ error, data }) {
        if (data) {
            this.imputaciones = data;
            this.filteredImputaciones = data;
            this.totalPages = Math.ceil(data.length / this.pageSize);
            this.setPageData();
            this.error = undefined;
            this.renderCharts();
        } else if (error) {
            this.error = error;
            this.imputaciones = [];
        }
    }

    // Abre el modal para editar la imputación
    openEditModal(event) {
        const imputacionId = event.target.dataset.id;
        // Encontrar la imputación seleccionada
        this.selectedImputacion = this.imputaciones.find(imputacion => imputacion.Id === imputacionId);
        // Cambiar el estado del modal a true para que se renderice
        this.isModalOpen = true;
        // Utilizar un pequeño retraso para asegurarse de que el modal se renderiza antes de intentar acceder a él
        setTimeout(() => {
            const modal = this.template.querySelector('c-editar-imputacion'); // Asegúrate de que este es el nombre correcto de tu componente modal
            if (modal) {
                console.log(this.openEditModal)
                modal.showModal(this.selectedImputacion); // Método en el modal que inicializa los datos
            } else {
                console.error('Modal not found');
            }
        }, 0); // Esperar el ciclo de renderizado del DOM
    }
    
    // Captura el valor ingresado en el input de búsqueda por Username
    handleUsernameInput(event) {
        this.usernameSearchTerm = event.target.value.toLowerCase();
    }

    // Captura el valor ingresado en el input de búsqueda por Project ID
    handleProjectIdInput(event) {
        this.projectIdSearchTerm = event.target.value;
    }

    // Búsqueda por Username
    searchByUsername() {
        this.filteredImputaciones = this.imputaciones.filter(imputacion => 
            imputacion.username__c.toLowerCase().includes(this.usernameSearchTerm)
        );
        this.totalPages = Math.ceil(this.filteredImputaciones.length / this.pageSize);
        this.currentPage = 1;
        this.setPageData();

        // Habilitar el botón de exportación si hay datos
        this.isExportDisabled = this.filteredImputaciones.length === 0;
    }

    // Búsqueda por Project ID
    searchByProjectId() {
        this.filteredImputaciones = this.imputaciones.filter(imputacion => 
            imputacion.proyectoId__c.toString().includes(this.projectIdSearchTerm)
        );
        this.totalPages = Math.ceil(this.filteredImputaciones.length / this.pageSize);
        this.currentPage = 1;
        this.setPageData();

        // Habilitar el botón de exportación si hay datos
        this.isExportDisabled = this.filteredImputaciones.length === 0;
    }

    // Eliminar una imputación
    deleteImputacion(event) {
        const imputacionId = event.target.dataset.id; 
        if (confirm('¿Está seguro de que desea eliminar esta imputación?')) {
            deleteImputacion({imputacionId}) 
                .then(() => {
                    this.filteredImputaciones = this.filteredImputaciones.filter(imputacion => imputacion.Id !== imputacionId);
                    this.totalPages = Math.ceil(this.filteredImputaciones.length / this.pageSize);
                    this.currentPage = 1; 
                    this.setPageData(); 
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Éxito',
                            message: 'Imputación eliminada con éxito.',
                            variant: 'success',
                        }),
                    );
                })
                .catch(error => {
                    this.error = error;
                    console.error('Error eliminando imputación:', error);
                });
        }
    }

    // Cerrar el modal
    closeModal() {
        this.isModalOpen = false; 
        this.selectedImputacion = this.selectedImputacion = {
            username__c: '',
            proyectoId__c: '',
            Name: '',
            horasImputadas__c: 0,
            fechaImputacion__c: ''
        }; 
    }

    // Guardar imputación actualizada
    saveImputacion() {
        updateImputacion({ imputacion: this.selectedImputacion })
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Éxito',
                        message: 'Imputación actualizada con éxito.',
                        variant: 'success',
                    }),
                );
                this.closeModal();
                // Recargar la lista de imputaciones
                return getAllImputaciones();
            })
            .then(data => {
                this.imputaciones = data;
                this.filteredImputaciones = data; // Resetear los datos filtrados
                this.totalPages = Math.ceil(data.length / this.pageSize);
                this.currentPage = 1;
                this.setPageData();
                this.renderCharts(); // Volver a renderizar los gráficos
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error',
                        message: error.body.message,
                        variant: 'error',
                    }),
                );
            });
    }

    // Establecer los datos de la página actual
    setPageData() {
        const startIdx = (this.currentPage - 1) * this.pageSize;
        const endIdx = this.currentPage * this.pageSize;
        this.currentPageImputaciones = this.filteredImputaciones.slice(startIdx, endIdx);
    }

    // Manejar la siguiente página
    handleNextPage() {
        if (this.currentPage < this.totalPages) {
            this.currentPage += 1;
            this.setPageData();
        }
    }

    // Manejar la página anterior
    handlePreviousPage() {
        if (this.currentPage > 1) {
            this.currentPage -= 1;
            this.setPageData();
        }
    }

    exportToExcel() {
        const rows = this.filteredImputaciones.map(imputacion => {
            return [
                imputacion.username__c,
                imputacion.proyectoId__c,
                imputacion.Name,
                imputacion.horasImputadas__c,
                imputacion.fechaImputacion__c
            ].join(',');
        });
    
        const csvContent = 'data:text/csv;charset=utf-8,'
            + 'Username,Proyecto ID,Nombre,Horas Imputadas,Fecha de Imputación\n' // Encabezados
            + rows.join('\n');
    
        const encodedUri = encodeURI(csvContent);
        const link = document.createElement('a');
        link.setAttribute('href', encodedUri);
        link.setAttribute('download', 'imputaciones.csv');
        document.body.appendChild(link); // Necesario para Firefox
    
        link.click(); // Simula un clic en el enlace para descargar el archivo
    }
    

    // Renderizar gráficos dinámicos
    renderCharts() {
        this.renderProjectHoursChart();
        this.renderUserTaskDistributionChart();
        this.renderMonthlyTrend();
    }

    // Gráfico de Horas Imputadas por Proyecto
    renderProjectHoursChart() {
        const chartContainer = this.template.querySelector('.chart-project-hours');
        chartContainer.innerHTML = '';
    
        const projectData = {};
        this.filteredImputaciones.forEach(imputacion => {
            if (!projectData[imputacion.proyectoId__c]) {
                projectData[imputacion.proyectoId__c] = 0;
            }
            projectData[imputacion.proyectoId__c] += imputacion.horasImputadas__c;
        });
    
        const labels = Object.keys(projectData);
        const data = Object.values(projectData);
    
        const svgWidth = 500;
        const svgHeight = 400;
        const barWidth = svgWidth / labels.length;
    
        const maxDataValue = Math.max(...data);
        const yAxisLabelsCount = 5; // Número de divisiones en el eje Y
    
        // Crear SVG
        let svg = `<svg width="${svgWidth + 50}" height="${svgHeight + 50}">`; // Añadir margen para el eje Y
    
        // Dibujar el eje Y y las divisiones
        for (let i = 0; i <= yAxisLabelsCount; i++) {
            const y = (i / yAxisLabelsCount) * svgHeight;
            const value = Math.round(maxDataValue * (1 - i / yAxisLabelsCount));
    
            // Línea de referencia horizontal
            svg += `<line x1="50" y1="${y}" x2="${svgWidth}" y2="${y}" stroke="lightgray" stroke-width="1"></line>`;
            
            // Etiquetas del eje Y
            svg += `<text x="40" y="${y}" text-anchor="end" alignment-baseline="middle" font-size="12">${value}</text>`;
        }
    
        // Dibujar las barras
        data.forEach((value, index) => {
            const barHeight = (value / maxDataValue) * svgHeight;
            const x = 50 + index * barWidth; // Mover a la derecha por el eje Y
            const y = svgHeight - barHeight;
    
            // Dibujar cada barra
            svg += `<rect x="${x}" y="${y}" width="${barWidth - 1}" height="${barHeight}" fill="steelblue"></rect>`;
    
            // Etiquetas de las barras (categoría)
            svg += `<text x="${x + barWidth / 2}" y="${svgHeight + 20}" fill="black" text-anchor="middle" font-size="12">${labels[index]}</text>`;
        });
    
        svg += '</svg>';
        chartContainer.innerHTML = svg;
    }
    

    // Gráfico de distribución de tareas por usuario
    renderUserTaskDistributionChart() {
        const chartContainer = this.template.querySelector('.chart-user-tasks');
        chartContainer.innerHTML = ''; 
    
        const userData = {};
        this.filteredImputaciones.forEach(imputacion => {
            if (!userData[imputacion.username__c]) {
                userData[imputacion.username__c] = 0;
            }
            userData[imputacion.username__c] += imputacion.horasImputadas__c;
        });
    
        const labels = Object.keys(userData);
        const data = Object.values(userData);
    
        const svgWidth = 500;
        const svgHeight = 400;
        const barWidth = svgWidth / labels.length;
    
        const maxDataValue = Math.max(...data);
        const yAxisLabelsCount = 5;
    
        let svg = `<svg width="${svgWidth + 50}" height="${svgHeight + 50}">`; // Añadir margen para el eje Y
    
        // Dibujar el eje Y
        for (let i = 0; i <= yAxisLabelsCount; i++) {
            const y = (i / yAxisLabelsCount) * svgHeight;
            const value = Math.round(maxDataValue * (1 - i / yAxisLabelsCount));
    
            // Líneas horizontales
            svg += `<line x1="50" y1="${y}" x2="${svgWidth}" y2="${y}" stroke="lightgray" stroke-width="1"></line>`;
            
            // Etiquetas del eje Y
            svg += `<text x="40" y="${y}" text-anchor="end" alignment-baseline="middle" font-size="12">${value}</text>`;
        }
    
        // Dibujar las barras
        data.forEach((value, index) => {
            const barHeight = (value / maxDataValue) * svgHeight;
            const x = 50 + index * barWidth; // Mover a la derecha por el eje Y
            const y = svgHeight - barHeight;
    
            svg += `<rect x="${x}" y="${y}" width="${barWidth - 1}" height="${barHeight}" fill="orange"></rect>`;
    
            // Etiquetas de categorías (usuarios)
            svg += `<text x="${x + barWidth / 2}" y="${svgHeight + 20}" fill="black" text-anchor="middle" font-size="12">${labels[index]}</text>`;
        });
    
        svg += '</svg>';
        chartContainer.innerHTML = svg;
    }
    
    
    renderMonthlyTrend() {
        const chartContainer = this.template.querySelector('.chart-monthly-trend');
        chartContainer.innerHTML = ''; 
    
        // Obtener el año actual y filtrar las imputaciones del último año
        const currentDate = new Date();
        const currentYear = currentDate.getFullYear();
        const lastYearDate = new Date(currentDate.setFullYear(currentYear - 1));
    
        const monthlyData = {
            'enero': 0, 'febrero': 0, 'marzo': 0, 'abril': 0,
            'mayo': 0, 'junio': 0, 'julio': 0, 'agosto': 0,
            'septiembre': 0, 'octubre': 0, 'noviembre': 0, 'diciembre': 0
        };
    
        // Filtrar las imputaciones del último año y sumar las horas por mes
        this.imputaciones.forEach(item => {
            const imputacionDate = new Date(item.fechaImputacion__c);
            
            // Solo procesar imputaciones dentro del último año
            if (imputacionDate >= lastYearDate) {
                const month = imputacionDate.toLocaleString('es-ES', { month: 'long' });
                monthlyData[month] = (monthlyData[month] || 0) + item.horasImputadas__c;
            }
        });
    
        const months = Object.keys(monthlyData);
        const hours = Object.values(monthlyData);
    
        // Calcular el total de horas para determinar el tamaño de cada sector
        const totalHours = hours.reduce((acc, val) => acc + val, 0);
    
        // Definir las dimensiones del gráfico
        const svgWidth = 400; // Reducimos el ancho para dejar espacio a la tabla
        const svgHeight = 400;
        const radius = Math.min(svgWidth, svgHeight) / 2;
    
        let svg = `<svg width="${svgWidth}" height="${svgHeight}" viewBox="0 0 ${svgWidth} ${svgHeight}" xmlns="http://www.w3.org/2000/svg">`;
        const centerX = svgWidth / 2;
        const centerY = svgHeight / 2;
    
        let currentAngle = -Math.PI / 2; // Empezamos desde la parte superior del círculo (270°)
        
        // Función para calcular coordenadas polares a cartesianas
        const polarToCartesian = (cx, cy, r, angleInRadians) => {
            return {
                x: cx + r * Math.cos(angleInRadians),
                y: cy + r * Math.sin(angleInRadians)
            };
        };
    
        // Colores para los sectores (uno por cada mes)
        const colors = ['#FF6384', '#36A2EB', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40', '#F7464A', '#46BFBD', '#FDB45C', '#949FB1', '#4D5360', '#AC64AD'];
    
        // Generar los sectores del gráfico de pastel
        hours.forEach((value, index) => {
            const percentage = value / totalHours;
            const angle = percentage * 2 * Math.PI;
            const nextAngle = currentAngle + angle;
    
            // Coordenadas del sector
            const start = polarToCartesian(centerX, centerY, radius, currentAngle);
            const end = polarToCartesian(centerX, centerY, radius, nextAngle);
            const largeArcFlag = angle > Math.PI ? 1 : 0; // Determina si el arco es mayor a 180 grados
    
            // Crear la parte del gráfico
            const pathData = [
                `M ${centerX} ${centerY}`, // Moverse al centro
                `L ${start.x} ${start.y}`, // Línea al borde del círculo
                `A ${radius} ${radius} 0 ${largeArcFlag} 1 ${end.x} ${end.y}`, // Dibujar el arco
                'Z' // Cerrar el camino
            ].join(' ');
    
            // Añadir el sector al SVG
            svg += `<path d="${pathData}" fill="${colors[index]}" stroke="white" stroke-width="2"></path>`;
    
            // Etiquetas de los meses con porcentaje y valor
            const labelAngle = currentAngle + angle / 2; // Posicionar la etiqueta en el centro del sector
            const labelPosition = polarToCartesian(centerX, centerY, radius * 0.7, labelAngle);
    
            svg += `<text x="${labelPosition.x}" y="${labelPosition.y}" fill="black" text-anchor="middle" font-size="10">${months[index]}: ${value}h</text>`;
    
            // Actualizar el ángulo actual para el siguiente sector
            currentAngle = nextAngle;
        });
    
        svg += '</svg>';
    
        // Generar la tabla de datos
        let table = `<table style="border-collapse: collapse;">`;
        table += `<thead><tr><th style="border: 1px solid #ddd; padding: 8px;">Mes</th><th style="border: 1px solid #ddd; padding: 8px;">Horas Imputadas</th><th style="border: 1px solid #ddd; padding: 8px;">Porcentaje</th></tr></thead><tbody>`;
    
        hours.forEach((value, index) => {
            const percentage = ((value / totalHours) * 100).toFixed(2);
            table += `
                <tr>
                    <td style="border: 1px solid #ddd; padding: 8px;">${months[index]}</td>
                    <td style="border: 1px solid #ddd; padding: 8px;">${value}</td>
                    <td style="border: 1px solid #ddd; padding: 8px;">${percentage}%</td>
                </tr>`;
        });
    
        table += '</tbody></table>';
    
        // Crear el contenedor combinado de gráfico + tabla
        chartContainer.innerHTML = `
            <div style="display: flex; justify-content: space-between;">
                <div>${svg}</div>
                <div>${table}</div>
            </div>`;
    }
    
    
    

}