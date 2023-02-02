import { createApp } from 'vue'
import App from './App.vue'
import TodoList from './components/TodoList'

import axios from 'axios'

axios.defaults.baseURL = process.env.VUE_APP_API_URL

createApp(App).component('TodoList', TodoList).mount('#app')
