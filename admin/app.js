// Define components
const Home = { template: '<div>Home Page</div>' }
const About = { template: '<div>About Page</div>' }
const Contact = { template: '<div>Contact Page</div>' }

// Define routes
const routes = [
  { path: '/', redirect: '/home' },
  { path: '/home', component: Home },
  { path: '/about', component: About },
  { path: '/contact', component: Contact }
]

// Create router instance
const router = new VueRouter({
  routes
})

// Create Vue instance
new Vue({
  router,
  data() {
    return {
      showLoginDialog: true,
      username: '',
      password: '',
      skin: 'default' // Store the current skin, default is 'default'
    }
  },
  methods: {
    login() {
      // Simulate login, output username and password
      console.log('Login with:', this.username, this.password);
      // Clear username and password
      if (this.username === "admin" && this.password === "admin") {
        this.username = '';
        this.password = '';
        // Close the login dialog
        this.showLoginDialog = false;

        return;
      }
      else {
        alert("Incorrect username or password!");
      }
    },
    closeLoginDialog() {
      // Close the login dialog
      this.showLoginDialog = false;
    },
    changeSkin(skin) {
      // Change the skin
      this.skin = skin;
    }
  },
  watch: {
    // Watch for skin changes and dynamically switch styles
    skin(newSkin) {
      const styleTags = document.querySelectorAll('link[rel="stylesheet"]');
      styleTags.forEach(tag => {
        if (tag.href.includes('skin')) {
          tag.disabled = true;
        }
      });
      if (newSkin !== 'default') {
        const selectedStyle = document.getElementById(newSkin);
        selectedStyle.disabled = false;
      }
    }
  }
}).$mount('#app')
