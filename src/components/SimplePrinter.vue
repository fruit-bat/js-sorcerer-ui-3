<template>
  <equipment>
    <a
      ref='link'
      style="display: none"
    />
    <div class="pa-1">
      <div
        class="pa-1 printer-paper"
        ref="paper"
      />
    </div>

    <v-btn
      slot="options"
      class="ma-0"
      icon
      text
      @click="autoScroll = !autoScroll"
    >
      <v-icon
        :style="{ opacity : autoScroll ? 1.0 : .25 }"
      >
        {{autoScroll ? 'toggle_on' : 'toggle_off'}}
      </v-icon>
    </v-btn>
    <v-btn
      slot="actions"
      class="ma-0"
      icon
      @click="saveText"
    >
      <v-icon>save_alt</v-icon>
    </v-btn>
    <v-btn
      slot="actions"
      class="ma-0"
      icon
      text
      @click="clear"
    >
      <v-icon>eject</v-icon>
    </v-btn>
  </equipment>
</template>
<script>
  import emulator from '@/assets/emulator';
  import { ExidyElementPrinter } from 'js-sorcerer';
  import Equipment from './Equipment';

  export default {
    props: {
    },
    computed: {

    },
    mounted() {
      this._printer = new ExidyElementPrinter(this.$refs.paper);
      emulator.attachPrinter(this._printer);
    },
    beforeDestroy() {
      emulator.attachPrinter(null);
    },
    data: () => ({
      printer: null,
      autoScroll: true
    }),
    watch: {
      autoScroll() {
        console.log(this.autoScroll);
        this._printer.setAutoScroll(this.autoScroll);
      }
    },
    methods:{
      saveText() {
        const text = this._printer.getText();
        console.log(text);
        const blob = new Blob([text], {type: "application/binary"});
        const link = this.$refs.link;
        link.href = window.URL.createObjectURL(blob);
        link.download="p.txt";
        link.click();
      },
      clear() {
        this._printer.clear();
      }
    },
    components: {
      Equipment
    }
  }
</script>
<style>

.printer-paper {
  overflow-y: scroll;
  height: 200px;
  width: 850px;
  font-family: monospace;
  font-size:10px;
  text-align: left;
}
.printer-paper .row {
  height: 11px;
  background-color: #fffffb;
}
.printer-paper .hole {
  display: inline-block;
  width: 6px;
  height: 6px;
  background: #eee;
  border-radius: 3px;
  margin-bottom: 2px;
  margin-left: 2px;
}
.printer-paper pre {
  display: inline-block;
  line-height: 11px;
  height: 11px;
  width: 800px;
  overflow: hidden;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: bottom;
}
.printer-paper .odd {
  background-color: #f0fff0;
}
</style>
