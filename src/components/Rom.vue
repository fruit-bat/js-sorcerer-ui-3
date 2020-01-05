<template>
  <div
    :style="{ opacity, cursor: 'pointer', position: 'relative' }"
  >
    <div
      v-if="label"
      class="rom-label"
    >{{label}}</div>
    <img
      src="@/assets/rom-chip.svg"
      height="85px"
      @click="clicked"
    />
  </div>
</template>

<script>

  export default {
    props: {
      disabled: {
        default: false,
        type: Boolean
      },
      label: {
        default: '',
        type: String
      }
    },
    computed: {
      opacity: function() {
        return this.disabled ? 0.15 : 1.0;
      }
    },
    mounted() {

    },
    data: () => ({
    }),
    methods:{
      clicked(evt) {
        this.$emit('click', evt);
      }
    }
  }
</script>
<style>
.rom-label {
  color: black;
  position: absolute;
  top: 28px;
  font-size: 11px;
  left: 10px;
  width: 115px;
  background-color:#cca;
  padding:0px 5px 0px 5px;
  border-radius:3px;
  line-height: 17px;
}
</style>
