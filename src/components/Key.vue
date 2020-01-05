
<template>
  <div
    class="exidy-key"
    icon
    @mousedown="pressHandler(true, $event)"
    @mouseup="pressHandler(false, $event)"
    @mouseleave="pressHandler(false, $event)"
    :style="{ backgroundColor: active ? 'green' : color}"
  >
    <div
      :style="{ width: 32*width + 'px', color: 'white', height: '32px' }"
    >
      <slot name="content">
        <div
          class="exidy-key-half"
          style="paddingTop:2px"
        >
          <slot name="top">{{top}}</slot>
        </div>
        <div
          class="exidy-key-half"
        >
          <slot name="bottom" >{{bottom}}</slot>
        </div>
      </slot>
    </div>
  </div>
</template>

<script>

  export default {
    props: {
      width: {
        type: Number,
        default: 1.0
      },
      keyId: {
        type: String,
        default: null
      },
      top: {
        type: String,
        default: null
      },
      bottom: {
        type: String,
        default: null
      },
      keystate: {
        type: Object,
        default: () => { return {}; }
      },
      toggle: {
        type: Boolean,
        default: false
      },
      dark: {
        type: Boolean,
        default: null
      }
    },
    computed: {
      active() {
        return this.pressed || this.keystate[this.keyId];
      },
      color() {
        return this.dark ? "#413a41" : '#cdc294';
      }
    },
    mounted() {
    },
    data: () => ({
      pressed: false
    }),
    watch: {
      pressed() {
        this.$emit('pressed', { keyId: this.keyId, pressed: this.pressed });
      },
      group() {
        if (this.toggle && !this.group) {
          this.pressed = false;
        }
      }
    },
    methods:{
      pressHandler(p, event) {
        if (this.toggle || event.ctrlKey) {
          if (p) this.pressed = !this.pressed;
          this.$emit('toggled', this.pressed);
        }
        else {
          this.pressed = p;
        }
      }
    },
    components: {
    }
  }
</script>
<style>
.exidy-key {
  color: white;
  font-weight:500;
  background-color:#cdc294;
  border-style: solid;
  border-radius: 10px;
  text-align:center;
  height:fit-content;
  margin:1px;
  padding:0px;
  border-width:0px;
  user-select: none;
  font-size: 14px;
  line-height:14px;
}
.exidy-key-half {
  padding-top:1px;
  height:14px;
}
</style>
