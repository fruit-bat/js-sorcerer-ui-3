<template>
  <equipment>
    <div
      class="exidy-screen-container"
      @keyup.stop="keyupHandler"
      @keydown.stop="keydownHandler"
      ref="screen"
      tabindex="0"
      :style="{ width: (scale * 512) + 'px', height: (scale * 480) + 'px', backgroundColor: 'green' }"
    />
    <toggle
      class="ma-0"
      slot="options"
      v-model="govern"
    />
    <v-btn
      slot="actions"
      icon
      @click="running = !running"
    >
      <v-icon>{{ running ? 'pause' : 'play_arrow' }}</v-icon>
    </v-btn>
    <v-btn
      slot="actions"
      icon
      text
      @click="save"
    >
      <v-icon>save_alt</v-icon>
    </v-btn>
    <v-btn
      slot="actions"
      icon
      text
      @click="reset"
    >
      <v-icon>power_settings_new</v-icon>
    </v-btn>
  </equipment>
</template>

<script>

  import emulator from '@/assets/emulator';
  import Equipment from './Equipment';
  import Toggle from './Toggle';
  import { ExidyBrowserKeyboard } from 'js-sorcerer';

  export default {
    props: {
      scale: {
        type: Number,
        default: 1
      }
    },
    mounted() {
      const screenContainer = this.$refs.screen;
      screenContainer.appendChild(emulator.getCanvas());
    },
    data: () => ({
      govern: true,
      running: true
    }),
    methods:{
      keydownHandler(key) {
        emulator.getBrowserKeyboard().browserKeyDown(key.keyCode);
        key.preventDefault();
      },
      keyupHandler(key) {
        emulator.getBrowserKeyboard().browserKeyUp(key.keyCode);
        key.preventDefault();
      },
      reset() {
        emulator.reset();
      },
      save() {
        // TODO
        // For now just get the regions and log them
        emulator.getMemRegions().reverse().forEach(r => {
          console.log(r.text);
        });
      }
    },
    watch: {
      govern() {
        emulator.govern(this.govern);
      },
      running() {
        if (this.running) emulator.run();
        else emulator.stop();
      }
    },
    components: {
      Equipment,
      Toggle
    }
  }
</script>
<style>
  .exidy-screen-container {
    background-color: #000;
    border:5px solid #000;
    border-radius: 5px !important;
    box-sizing: content-box;
  }
  .exidy-screen-container canvas {
    image-rendering: optimizeSpeed;
    image-rendering: -moz-crisp-edges;
    image-rendering: -webkit-optimize-contrast;
    image-rendering: optimize-contrast;
    image-rendering: pixelated;
    -ms-interpolation-mode: nearest-neighbor;
    height: 100%;
    width: 100%;
  }
</style>
