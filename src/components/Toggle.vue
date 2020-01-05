<template>
  <v-btn
    icon
    @click="valueVar = !valueVar"
  >
    <v-icon
      :style="{ opacity : valueVar ? 1.0 : .25 }"
    >
      {{valueVar ? 'toggle_on' : 'toggle_off'}}
    </v-icon>
  </v-btn>
</template>

<script>

  export default {
    props: {
      value: {
        default: false,
        type: Boolean
      }
    },
    data: () => ({
      valueVar: false
    }),
    mounted() {
      this.valueVar = this.value;
    },
    watch: {
      value() {
        this.valueVar = this.value;
      },
      valueVar() {
        this.$emit('input', this.valueVar);
      }
    }
  }

</script>
