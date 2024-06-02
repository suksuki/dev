new Vue({
    el: '#vueapp',
    data: {
        search_nm: 'name',
        search_val: '',
        users: [
            { id: 1, name: 'John Doe', user_id: 'johndoe', email: 'john@example.com', phone: '123-456-7890' },
            { id: 2, name: 'Jane Smith', user_id: 'janesmith', email: 'jane@example.com', phone: '098-765-4321' }
            // Add more user data as needed
        ],
        selectedUser: null,
        showModal: false,
        isEdit: false,
        form: {
            id: null,
            name: '',
            user_id: '',
            email: '',
            phone: ''
        }
    },
    computed: {
        filteredUsers() {
            return this.users.filter(user => {
                return user[this.search_nm].toLowerCase().includes(this.search_val.toLowerCase());
            });
        }
    },
    methods: {
        selectUser(user) {
            this.selectedUser = user;
        },
        showAddUserModal() {
            this.resetForm();
            this.isEdit = false;
            this.showModal = true;
        },
        showEditUserModal(user) {
            this.form = Object.assign({}, user);
            this.isEdit = true;
            this.showModal = true;
        },
        closeModal() {
            this.showModal = false;
        },
        resetForm() {
            this.form = {
                id: null,
                name: '',
                user_id: '',
                email: '',
                phone: ''
            };
        },
        addUser() {
            this.form.id = Date.now();
            this.users.push(Object.assign({}, this.form));
            this.closeModal();
        },
        updateUser() {
            const index = this.users.findIndex(user => user.id === this.form.id);
            if (index !== -1) {
                this.users.splice(index, 1, Object.assign({}, this.form));
            }
            this.closeModal();
        },
        deleteUser(id) {
            this.users = this.users.filter(user => user.id !== id);
            if (this.selectedUser && this.selectedUser.id === id) {
                this.selectedUser = null;
            }
        },
        gotoDtl() {
            // Implementation of the method to add a new user
            console.log("Navigating to user details page...");
        },
        excelDn() {
            // Implementation of the method to download the user list in Excel format
            console.log("Downloading user list as Excel...");
        },
        getList(isSearch) {
            // Implementation of the method to get the user list based on search criteria
            console.log("Fetching user list...", this.search_nm, this.search_val);
        },
        sortList(sortTarget) {
            // Implementation of the method to sort the user list based on the selected column
            console.log("Sorting user list by", sortTarget);
            this.users.sort((a, b) => a[sortTarget].localeCompare(b[sortTarget]));
        }
    }
});
