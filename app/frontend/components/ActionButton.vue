<script>  
export default {  
  props: {
    actionType: String,
    objectType: String,
  },
  methods: {
    myMethod () {
      console.log(this.actionType, this.objectType);
      /*this.$http.post(
        '/' + objectType, 
        { name: "my item" }
      );*/
    },
  }
}  
</script>  
  
<template>
  <button onclick="myMethod()">{{ actionType }}</button>
</template>  