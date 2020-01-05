<template>
  <div
    :style="{ opacity, cursor: 'pointer', position: 'relative' }"
  >
    <div
      class="disk-label"
    >{{label}}</div>
    <img
      src="@/assets/floppy-disk.svg"
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
.disk-label {
    color: black;
    position: absolute;
    top: 6px;
    font-size: 11px;
    left: 5px;
    width: 115px;
    height: 34px;
    background-color: #cca;
    padding: 0px 5px 0px 5px;
    border-radius: 3px;
    text-align: left;
}
</style>
