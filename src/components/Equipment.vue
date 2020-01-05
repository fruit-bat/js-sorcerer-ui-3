<template>
  <div style="width:fit-content">
    <v-card
      class="pa-1 equipment"
      :color="color"
    >
      <v-card-text
        class="pa-0"
      >
        <slot />
      </v-card-text>
      <v-card-actions
        class="pa-0 pr-1"
      >
        <slot name="options" />
        <v-spacer></v-spacer>
        <slot name="actions" />
      </v-card-actions>
    </v-card>
  </div>
</template>

<script>

  export default {
    props: {
      color: {
        default: '#eee',
        type: String
      }
    }
  }

</script>
<style>

.equipment {
  border-radius: 10px;
  width:fit-content;
}

</style>
