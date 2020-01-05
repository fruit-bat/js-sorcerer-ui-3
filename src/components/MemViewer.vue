
<template>
  <equipment>
    <div
      class="memory-view"
    >
      <pre
        v-for="row in rows"
        :class="row & 0x1 === 1 ? 'odd' : 'even'"
      >{{makeRow(row-1)}}</pre>
    </div>
    <v-btn
      slot="actions"
      class="ma-0"
      icon
      text
      @click="getMem"
    >
      <v-icon>refresh</v-icon>
    </v-btn>
  </equipment>
</template>

<script>
  import emulator from '@/assets/emulator';
  import Equipment from './Equipment';

  export default {
    computed: {
      rows() {
        return typeof this.mem === 'undefined' || this.mem === null ? 0 : (this.mem.length + 15) >> 4;
      }
    },
    mounted() {
    },
    data: () => ({
      mem: null,
      start: 0x01d5,
      length: 0x1000
    }),
    methods:{
      getMem() {
        this.mem = emulator.getMem(this.start, this.length);
      },
      hex(num, len) {
        const str = num.toString(16);
        return "0".repeat(len - str.length) + str;
      },
      hexBlk(addr, len) {
        let s = '';
        for(let i = 0; i < len; ++i) {
          const x = addr + i;
          s += x < this.mem.length ? this.hex(this.mem[addr+i], 2) : '  ';
        }
        return s;
      },
      charBlk(addr, len) {
        let s = '';
        for(let i = 0; i < len; ++i) {
          const x = addr + i;
          if (x < this.mem.length) {
            const c = this.mem[addr+i];
            s += c >= 0x20 && c <= 0x7f ? String.fromCharCode(c) : '.';
          }
          else {
            s += ' ';
          }
        }
        return s;
      },
      makeRow(r) {
        const offset = r << 4;
        const address = this.start + offset;

        return this.hex(address, 4) + ': '
          + this.hexBlk(offset + 0x00, 2) + ' '
          + this.hexBlk(offset + 0x02, 2) + ' '
          + this.hexBlk(offset + 0x04, 2) + ' '
          + this.hexBlk(offset + 0x06, 2) + ' '
          + '  '
          + this.hexBlk(offset + 0x08, 2) + ' '
          + this.hexBlk(offset + 0x0a, 2) + ' '
          + this.hexBlk(offset + 0x0c, 2) + ' '
          + this.hexBlk(offset + 0x0e, 2) + ' '
          + ' '
          + this.charBlk(offset, 16);
      }
    },
    components: {
      Equipment
    }
  }
</script>
<style>
.memory-view {
  overflow-y: scroll;
  height: 200px;
  width: 500px;
  font-family: monospace;
  font-size:12px;
  text-align: left;
}

.memory-view .odd {
  background-color: #f0f0ff;
}

.memory-view pre {
  display: inline-block;
  overflow: hidden;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: bottom;
  width: 100%;
}
</style>
