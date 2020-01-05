<template>
  <v-app>
    <v-navigation-drawer app
      v-model="drawer"
      absolute
      temporary
    >
      <v-list class="pa-1">
        <v-list-item>
          <v-icon>settings</v-icon>
          <v-list-item-content>
            <v-list-item-title class="pl-2">Settings</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-switch v-model="centronicsPrinter" label="Centronics printer" />
        </v-list-item>
        <v-list-item>
          <v-switch v-model="memoryViewer" label="Memory viewer" />
        </v-list-item>
        <v-list-item>
          <v-switch v-model="virtualKeyboard" label="Virtual keyboard" />
        </v-list-item>

        <v-divider />

      </v-list>
    </v-navigation-drawer>
    
    <v-app-bar app>
      <v-app-bar-nav-icon
        @click="drawer=!drawer"
      />
      <v-toolbar-title class="headline">
        <span>Exidy</span>
        <span
          class="pl-2 font-weight-light""
        >Sorcerer Computer</span>
      </v-toolbar-title>
      <v-spacer></v-spacer>
    </v-app-bar>

    <v-content
      style="background-color: darkslategrey;"
    >
      <v-container fluid>
        <HelloWorld
          :centronicsPrinter="centronicsPrinter"
          :memoryViewer="memoryViewer"
          :virtual-keyboard="virtualKeyboard"
        />
      </v-container>
    </v-content>

  
  </v-app>
</template>

<script>
import HelloWorld from './components/HelloWorld'

export default {
  name: 'App',
  components: {
    HelloWorld
  },
  data () {
    return {
      drawer: false,
      centronicsPrinter: false,
      memoryViewer: false,
      virtualKeyboard: true
    }
  }
}
</script>
