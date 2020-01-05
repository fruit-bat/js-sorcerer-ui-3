<template>
  <equipment>
    <a
      ref='link'
      style="display: none"
    />
    <drop-zone
      @file-for-upload="fileForUpload"
      @url-for-upload="urlForUpload"
    >
      <rom
        :disabled="romNotPresent"
        :label="romLabel"
      />
    </drop-zone>
    <upload-file-btn
      slot="actions"
      @input="fileForUpload"
    />
    <v-btn
      slot="actions"
      class="ma-0"
      icon
      text
      @click="downloadRom"
      :disabled="romNotPresent"
    >
      <v-icon>save_alt</v-icon>
    </v-btn>
    <v-btn
      slot="actions"
      class="ma-0"
      icon
      text
      @click="eject"
      :disabled="romNotPresent"
    >
      <v-icon>eject</v-icon>
    </v-btn>
  </equipment>
</template>

<script>
  import emulator from '@/assets/emulator';
  import Rom from './Rom';
  import DropZone from './DropZone';
  import Equipment from './Equipment';
  import UploadFileBtn from './UploadFileBtn';

  export default {
    props: {
    },
    computed: {
      romNotPresent() {
        return this.rom === null;
      }
    },
    mounted() {
    },
    data: () => ({
      rom: null, //TODO probably do not need to hold onto this array,
      romLabel: null
    }),
    methods: {
      downloadRom() {
        const blob = new Blob([this.romArray], {type: "application/binary"});
        const link = this.$refs.link;
        link.href = window.URL.createObjectURL(blob);
        link.download="a.rom";
        link.click();
      },
      uploadRom() {
        if (this.romNotPresent) {
          this.$el.querySelector('input').click();
        }
      },
      romClicked() {
        this.uploadDisk();
      },
      eject() {
        this.rom = null;
        this.romLabel = null;
        emulator.ejectRom();
      },
      insertRom(array, name) {
        if (array.length === 0x2000) {
          this.rom = array;
          this.romLabel = name;
          emulator.insertRom(array);
        }
        else{
          // TODO
          console.log('Rom is wrong length: ' + array.length);
        }
      },
      fileForUpload(file) {
        console.log(file);
        const reader = new FileReader();
        reader.onloadend = evt => {
          if (evt.target.readyState == FileReader.DONE) {
            const blob = evt.target.result;
            const array = new Uint8Array(blob);
            const name = this.urlToName(file.name);
            this.insertRom(array, name);
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
      urlToName(url) {
        console.log(url);
        const lastElement = url.substr(url.lastIndexOf('/') + 1);
        console.log(lastElement);
        const name = lastElement.replace(/\.[^/.]+$/, "")
        console.log(name);
        return name;
      },
      urlForUpload(url) {
        console.log('Load rom from URL ' + url);
        // TODO limit read length
        fetch(url)
          .then(response => {
            console.log(response);
            const url = decodeURI(response.url);
            const name = this.urlToName(url);
            this.checkResponseStatus(response);
            response.arrayBuffer().then(buffer => {
              console.log(buffer);
              const array = new Uint8Array(buffer);
              this.insertRom(array, name);
            });
          })
          .catch(err => console.error(err)); // Never forget the final catch!
      }
    },
    components: {
      Rom,
      DropZone,
      Equipment,
      UploadFileBtn
    }
  }
</script>
<style>
.romcard {
  border-radius: 10px;
}
</style>
