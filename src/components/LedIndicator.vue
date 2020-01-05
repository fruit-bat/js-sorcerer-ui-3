
<template>
  <v-icon
    small
    :color="color + (!on ? ' darken-4' : ' lighten-3')"
    :style=" { position: 'relative', textShadow: '0 0 ' + (on ? '8' : '0') + 'px ' }"
  >
    lens
  </v-icon>
</template>

<script>

  export default {
    props: {
      on: {
        default: false,
        type: Boolean
      },
      color: {
        default: 'green',
        type: String
      }
    },
    computed: {
      opacity: function() {
        return this.on ? 1.0 : 0.25; 
      }
    },
    mounted() {
    },
    data: () => ({
    }),
    methods:{
    }
  }
</script>
<style>

</style>
