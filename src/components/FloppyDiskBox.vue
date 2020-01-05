<template>
  <div>
  <v-layout wrap>
      <a
        href="disks/bootable.dsk"
        style="width:fit-content;height:fit-content"
      >
        <floppy-disk
          class="pa-1"
          label="CP/M boot"
        />
      </a>
      <a
        href="disks/utils.dsk"
        style="width:fit-content;height:fit-content"
      >
        <floppy-disk
          class="pa-1"
          label="CP/M utils"
        />
      </a>
      <a
        href="disks/programs.dsk"
        style="width:fit-content;height:fit-content"
      >
        <floppy-disk
          class="pa-1"
          label="programs"
        />
      </a>
  </v-layout>
  </div>
</template>

<script>
  import FloppyDisk from './FloppyDisk';

  export default {
    props: {
    },
    components: {
      FloppyDisk
    }
  }
</script>

<style>
</style>
