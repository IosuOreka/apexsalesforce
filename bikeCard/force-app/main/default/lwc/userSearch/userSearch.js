import { LightningElement } from 'lwc';

export default class UserSearch extends LightningElement {
    users = [];  // Ya no es necesario @track
    paginatedUsers = [];  // Ya no es necesario @track
    currentPage = 1;  // Ya no es necesario @track
    pageSize = 10;  // Ya no es necesario @track
    totalPages = 0;  // Ya no es necesario @track
    selectedUser = null;  // Ya no es necesario @track
    error;

    connectedCallback() {
        this.getAllUsers();
    }

    getAllUsers() {
        const url = 'https://192.168.7.32:3000/user/getAllUsers';
        fetch(url, {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
            }
        })
        .then(response => response.json())
        .then(data => {
            this.users = data[0];
            this.totalPages = Math.ceil(this.users.length / this.pageSize);
            this.updatePaginatedUsers();
        })
        .catch(error => {
            this.error = 'Error fetching users: ' + error;
            console.error('Error:', error);
        });
    }

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
