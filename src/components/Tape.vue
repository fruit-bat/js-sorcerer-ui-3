<template>
  <div
    :style="{ opacity, cursor: 'pointer', position: 'relative', height: '84px' }"
  >
    <div
      class="tape-label"
    >{{label}}</div>
    <img
      src="@/assets/tape.svg"
      width="130px"
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
.tape-label {
    color: black;
    position: absolute;
    top: 13px;
    font-size: 11px;
    left: 15px;
    width: 109px;
    height: 15px;
    background-color: #cca;
    padding: 0px 5px 0px 5px;
    border-radius: 3px;
}
</style>
