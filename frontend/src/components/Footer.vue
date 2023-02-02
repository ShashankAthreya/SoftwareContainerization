<template>
  <div id="footer">
    {{ version }}
  </div>
</template>


<script>

const ver = "Version: " + process.env.VUE_APP_VERSION
export default {
  data() {
    return {
      version: ver
    }
  },
}
</script>

<style>
#footer {
  position: fixed;
  bottom: 0;
  width: 100%;
  background: #DFDDDC;
  line-height: 1.5;
  text-align: center;
  color: #042E64;
  font-size: 14px;
  font-family: sans-serif;
  font-weight: bold;
}
</style>