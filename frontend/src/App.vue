<template>
  <div>
    <TodoList/>
    <FooterComponent/>
  </div>
</template>

<script>

import TodoList from './components/TodoList'
import FooterComponent from "./components/FooterComponent";
export default {
  name: 'App',
  components: {
    TodoList,
    FooterComponent
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
