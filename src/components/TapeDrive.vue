
<template>
  <equipment>
    <a
      ref='link'
      style="display: none"
    />

    <v-layout
      class="pt-0 pb-0 pl-2 pr-2"
    >
      <div
        class="tape-drive-label"
      >
        Deck {{unit+1}}
     </div>
     <v-spacer />
     <led-indicator
        :on="playing"
        color="green"
      />
      <led-indicator
        :on="recording"
        color="red"
      />
    </v-layout>

    <drop-zone
      @file-for-upload="fileForUpload"
      @url-for-upload="urlForUpload"
    >
      <img
        v-if="tapeNotPresent"
        src="../assets/casette-deck-empty.svg"
        width="160px"
        height="100px"
        draggable="false"
      />
      <img
        v-if="!tapeNotPresent"
        src="../assets/casette-deck-loaded.svg"
        width="160px"
        height="100px"
        draggable="false"
      />
    </drop-zone>

    <v-btn
      slot="actions"
      class="ma-0"
      icon
      text
      @click="newTape"
      :disabled="!tapeNotPresent || playing"
    >
      <v-icon small>create</v-icon>
    </v-btn>
    <upload-file-btn
      slot="actions"
      @input="fileForUpload"
    />
    <v-btn
      slot="actions"
      class="ma-0"
      icon
      text
      @click="downloadTape"
      :disabled="tapeNotPresent || playing"
    >
      <v-icon>save_alt</v-icon>
    </v-btn>
    <v-btn
      slot="actions"
      class="ma-0"
      icon
      text
      @click="eject"
      :disabled="tapeNotPresent || playing"
    >
      <v-icon>eject</v-icon>
    </v-btn>
  </equipment>
</template>

<script>
  import emulator from '@/assets/emulator';
  import Tape from './Tape';
  import DropZone from './DropZone';
  import LedIndicator from './LedIndicator';
  import { ExidyArrayTape } from 'js-sorcerer';
  import Equipment from './Equipment';
  import UploadFileBtn from './UploadFileBtn';

  export default {
    props: {
      unit: {
        default: null,
        type: Number
      }
    },
    computed: {
      tapeNotPresent() {
        return this.tape === null;
      }
    },
    beforeDestroy() {
      this.detach();
    },
    mounted() {
      if (this.unit !== null) this.attach();
    },
    data: () => ({
      tape: null,
      tapeArray: null,
      playing: false,
      recording: false,
      tapeRequiresSave: false
    }),
    watch: {
      unit(unit) {
        if (unit !== null) {
          this.attach();
        }
        else {
          this.detach();
        }
      }
    },
    methods: {
      detach() {
        emulator.getTapeSystem().then(ts => {
          const tapeUnit = ts.getUnit(this.unit);
          tapeUnit.motorListener = null;
          tapeUnit.recordListener = null;
        });
      },
      attach() {
        emulator.getTapeSystem().then(ts => {
          const tapeUnit = ts.getUnit(this.unit);
          tapeUnit.motorListener = playing => { this.playing = playing };
          tapeUnit.recordListener = recording => { this.recording = recording };
        });
      },
      downloadTape() {
        const blob = new Blob([this.tapeArray], {type: "application/binary"});
        const link = this.$refs.link;
        link.href = window.URL.createObjectURL(blob);
        link.download="a.tape";
        link.click();
      },
      newTape() {
        const array = new Uint8Array(47336);
        this.attachTape(array);
      },
      eject() {
        emulator.getTapeSystem().then(ts => {
          ts.getUnit(this.unit).tape = null;
          this.tape = null;
          this.tapeRequiresSave = false;
          this.tapeArray = null;
        });
      },
      attachTape(array) {

        const tape = new ExidyArrayTape(array);
        const unit = this.unit;

        emulator.getTapeSystem().then(ts => {
          ts.getUnit(this.unit).tape = tape;
          this.tape = tape;
          this.tapeRequiresSave = false;
          this.tapeArray = array;
        });
      },
      fileForUpload(file) {
        const reader = new FileReader();
        reader.onloadend = evt => {
          if (evt.target.readyState == FileReader.DONE) {
            const blob = evt.target.result;
            const array = new Uint8Array(blob);
            this.attachTape(array);
          }
        };
        reader.readAsArrayBuffer(file);
      },
      checkResponseStatus(response) {
        if (!response.ok) {
          throw new Error(`HTTP ${response.status} - ${response.statusText}`);
        }
        return response;
      },
      urlForUpload(url) {
        console.log('Load tape from URL ' + url);

        fetch(url)
          .then(response => {
            console.log(response);
            return this.checkResponseStatus(response) && response.arrayBuffer();
          })
          .then(buffer => {
            console.log(buffer);
            const array = new Uint8Array(buffer);
            this.attachTape(array);
          })
          .catch(err => console.error(err)); // Never forget the final catch!

      }
    },
    components: {
      DropZone,
      LedIndicator,
      Tape,
      Equipment,
      UploadFileBtn
    }
  }
</script>
<style>
.tapecard {
  border-radius: 10px;
}
.tape-drive-label {
    width: fit-content;
    margin-top: 6px;
    margin-bottom: 6px;
    background-color: #cca;
    padding: 0px 5px 0px 5px;
    border-radius: 3px;
    line-height: 18px;
}

.tape-drive {
   padding: 5px 11px 0px 10px;
   border-radius: 3px;
   background-color: #444;
   position:relative;
   user-select: none;
}

</style>
