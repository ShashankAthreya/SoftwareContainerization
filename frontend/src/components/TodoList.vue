<template>
  <div>
    <form @submit.prevent="createTodo">
      <input type="text" v-model="newTodo" placeholder="Add a new to-do">
      <button type="submit">Add</button>
    </form>
    <ul>
      <li v-for="todo in todos" :key="todo.id">
        <input type="text" v-model="todo.task" >
        <input type="text" v-model="todo.status" >
        <button @click="updateTodo(todo)">Update</button>
        <button @click="deleteTodo(todo.id)">Delete</button>
      </li>
    </ul>
  </div>
</template>


  
  <script>
  import axios from 'axios'
  
  export default {
    data() {
      return {
        todos: [],
        newTodo: ''
      }
    },
    created() {
      this.fetchTodos()
    },
    methods: {
      fetchTodos() {
        axios.get('/todos').then(
          response => {this.todos = response.data}
        )
      },
      createTodo() {
        axios.post('/todos', { task: this.newTodo, status: 'incomplete' }).then(()=>this.fetchTodos())
        this.newTodo = ''
      },
      updateTodo(todo) {
        axios.put(`/todos/${todo.id}`, { task: todo.task, status: todo.status }).then(()=>this.fetchTodos())
      },
      deleteTodo(id) {
        axios.delete(`/todos/${id}`).then(()=>this.fetchTodos())
      }
    }
  }
  </script>
  