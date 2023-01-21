import { createApp } from 'vue'
import App from './App.vue'
import TodoList from './components/TodoList'

import axios from 'axios'
axios.defaults.baseURL = 'http://localhost:5000/'


createApp(App).component('TodoList', TodoList).mount('#app')
