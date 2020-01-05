
<template>
  <div>
  <v-layout wrap>
      <a
        href="tapes/eliza.tape"
        style="width:fit-content;height:fit-content"
      >
        <tape
          class="pa-1"
          label="eliza"
        />
      </a>
      <a
        href="tapes/kadath.tape"
        style="width:fit-content;height:fit-content"
      >
        <tape
          class="pa-1"
          label="kadath"
        />
      </a>
  </v-layout>
  </div>
</template>

<script>
  import Tape from './Tape';

  export default {
    props: {
    },
    components: {
      Tape
    }
  }
</script>

<style>
</style>
