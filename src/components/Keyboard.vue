
<template>
  <equipment>
    <div
      style="fit-content"
      @keyup.stop="keyupHandler"
      @keydown.stop="keydownHandler"
      tabindex="0"
    >
    <v-layout
      class="pa-2"
      style="background-color:#d0cfba"
    >
      <v-layout column>
        <v-layout style="margin-left:16px">
          <v-layout class="exidy-key-row">
            <Key key-id="ESC" @pressed="keypress" :keystate="keystate">
              <div slot="content" style="font-size:9px;line-height:10px;padding-top:6px;">
                ESC
              </div>
              <div slot="content" style="font-size:9px;line-height:10px;">
                (DEL)
              </div>
            </key>
            <Key key-id="1" top="!" bottom="1" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="2" top='"' bottom="2" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="3" top='#' bottom="3" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="4" top='$' bottom="4" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="5" top='%' bottom="5" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="6" top='&' bottom="6" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="7" top="'" bottom="7" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="8" top='(' bottom="8" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="9" top=')' bottom="9" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="0" top=''  bottom="0" @pressed="keypress" :keystate="keystate"/>
            <Key key-id=":" top='*' bottom=":" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="-" top='=' bottom="-" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="^" top='~' bottom="^" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="RESET" :keystate="keystate" dark toggle>
              <div slot="content" style="padding-top:10px;font-size:9px;line-height:11px;" >
                RESET
              </div>
            </key>
            <Key key-id="RESET" :keystate="keystate" dark toggle>
              <div slot="content" style="padding-top:10px;font-size:9px;line-height:11px;" >
                RESET
              </div>
            </key>
          </v-layout>
        </v-layout>
        <v-layout style="margin-left:16px;">
          <v-layout class="exidy-key-row">
            <Key key-id="Tab" @pressed="keypress" :keystate="keystate" :width="1.5">
              <div slot="content" style="padding-top:6px;font-size:11px;">
                TAB
              </div>
              <div slot="content" style="font-size:9px;line-height:10px;">
                SKIP
              </div>
            </key>
            <Key key-id="Q" top="" bottom="Q" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="W" top="" bottom="W" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="E" top="" bottom="E" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="R" top="" bottom="R" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="T" top="" bottom="T" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="Y" top="" bottom="Y" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="U" top="" bottom="U" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="I" top="" bottom="I" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="O" top="" bottom="O" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="P" top="" bottom="P" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="[" top="{" bottom="[" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="]" top="}" bottom="]" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="LINE FEED" @pressed="keypress" :keystate="keystate">
              <div slot="content" style="font-size:9px;line-height:10px;padding-top:6px;">
                LINE
              </div>
              <div slot="content" style="font-size:9px;line-height:10px;">
                FEED
              </div>
            </key>
            <Key key-id="ENTER" @pressed="keypress" :keystate="keystate" :width="2">
              <div slot="content" style="padding-top:10px;font-size:11px;line-height:11px;">
                RETURN
              </div>
            </key>
          </v-layout>
        </v-layout>
        <v-layout>
          <v-layout class="exidy-key-row">
            <Key key-id="GRAPHIC" @pressed="keypress" :keystate="keystate" :width="1.5" dark toggle>
              <div slot="content" style="padding-top:10px;font-size:9px;line-height:11px;">
                GRAPHIC
              </div>
            </key>
            <key key-id="SHIFT LOCK" @pressed="keypress" :keystate="keystate" toggle>
              <div slot="content" style="font-size:9px;line-height:10px;padding-top:6px;">
                SHIFT
              </div>
              <div slot="content" style="font-size:9px;line-height:10px;">
                LOCK
              </div>
            </key>
            <Key key-id="A" top="" bottom="A" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="S" top="" bottom="S" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="D" top="" bottom="D" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="F" top="" bottom="F" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="G" top="" bottom="G" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="H" top="" bottom="H" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="J" top="" bottom="J" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="K" top="" bottom="K" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="L" top="" bottom="L" @pressed="keypress" :keystate="keystate"/>
            <Key key-id=";" top="+" bottom=";" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="@" top="`" bottom="@" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="Backslash" top="|" bottom='\' @pressed="keypress" :keystate="keystate"/>
            <key key-id="Unknown1" @pressed="keypress" :keystate="keystate" >
              <div slot="content" style="font-size:9px;line-height:10px;padding-top:6px;">
                RUB
              </div>
              <div slot="content" style="font-size:9px;line-height:10px;">
                _
              </div>
            </key>
            <Key key-id="Unknown2" @pressed="keypress" :keystate="keystate" dark>
              <div slot="content" style="padding-top:10px;font-size:9px;line-height:11px;" >
                CLEAR
              </div>
            </key>
          </v-layout>
        </v-layout>
        <v-layout style="margin-left:16px">
          <v-layout class="exidy-key-row">
            <Key key-id="CTRL" @pressed="keypress" :keystate="keystate"  toggle>
              <div slot="content" style="padding-top:10px;font-size:11px;line-height:11px;">
                CTRL
              </div>
            </key>
            <Key key-id="SHIFT" @pressed="keypress" :keystate="keystate" :width="1.5" toggle>
              <div slot="content" style="padding-top:10px;font-size:11px;line-height:11px;">
                SHIFT
              </div>
            </key>
            <Key key-id="Z" top="" bottom="Z" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="X" top="" bottom="X" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="C" top="" bottom="C" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="V" top="" bottom="V" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="B" top="" bottom="B" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="N" top="" bottom="N" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="M" top="" bottom="M" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="," top="<" bottom="," @pressed="keypress" :keystate="keystate"/>
            <Key key-id="." top=">" bottom="." @pressed="keypress" :keystate="keystate"/>
            <Key key-id="/" top="?" bottom="/" @pressed="keypress" :keystate="keystate"/>
            <Key key-id="SHIFT" @pressed="keypress" :keystate="keystate" :width="1.5" toggle>
              <div slot="content" style="padding-top:10px;font-size:11px;line-height:11px;">
                SHIFT
              </div>
            </key>
            <Key key-id="Repeat" @pressed="keypress" :keystate="keystate" >
              <div slot="content" style="padding-top:10px;font-size:8px;line-height:11px;">
                REPEAT
              </div>
            </key>
            <key key-id="RUN STOP" @pressed="keypress" :keystate="keystate" dark>
              <div slot="content" style="font-size:9px;line-height:10px;padding-top:6px;">
                RUN
              </div>
              <div slot="content" style="font-size:9px;line-height:10px;">
                STOP
              </div>
            </key>
          </v-layout>
        </v-layout>
        <v-layout style="margin-left:126px">
          <v-layout class="exidy-key-row">
            <Key key-id="SPACE" top="" bottom="" @pressed="keypress" :keystate="keystate" :width="9"/>
          </v-layout>
        </v-layout>
      </v-layout>
      <v-layout column style="margin-left:24px">
        <v-layout class="exidy-key-row">
          <Key key-id="NUM_-" top="" bottom="-" @pressed="keypress" :keystate="keystate"/>
          <Key key-id="NUM_7" top="" bottom="7" @pressed="keypress" :keystate="keystate"/>
          <Key key-id="NUM_8" top="" bottom="8" @pressed="keypress" :keystate="keystate"/>
          <Key key-id="NUM_9" top="" bottom="9" @pressed="keypress" :keystate="keystate"/>
        </v-layout>
        <v-layout class="exidy-key-row">
          <Key key-id="NUM_/" top="" bottom='/' @pressed="keypress" :keystate="keystate"/>
          <Key key-id="NUM_4" top="" bottom="4" @pressed="keypress" :keystate="keystate"/>
          <Key key-id="NUM_5" top="" bottom="5" @pressed="keypress" :keystate="keystate"/>
          <Key key-id="NUM_6" top="" bottom="6" @pressed="keypress" :keystate="keystate"/>
        </v-layout>
        <v-layout class="exidy-key-row">
          <Key key-id="NUM_*" top="" bottom="*" @pressed="keypress" :keystate="keystate"/>
          <Key key-id="NUM_1" top="" bottom="1" @pressed="keypress" :keystate="keystate"/>
          <Key key-id="NUM_2" top="" bottom="2" @pressed="keypress" :keystate="keystate"/>
          <Key key-id="NUM_3" top="" bottom="3" @pressed="keypress" :keystate="keystate"/>
        </v-layout>
        <v-layout class="exidy-key-row">
          <Key key-id="NUM_+" top="" bottom="+" @pressed="keypress" :keystate="keystate"/>
          <Key key-id="NUM_0" top="" bottom="0" @pressed="keypress" :keystate="keystate"/>
          <Key key-id="NUM_." top="" bottom="." @pressed="keypress" :keystate="keystate"/>
          <Key key-id="NUM_=" top="" bottom="=" @pressed="keypress" :keystate="keystate"/>
        </v-layout>
      </v-layout>
    </v-layout>
    </div>
  </equipment>
</template>

<script>
  import emulator from '@/assets/emulator';
  import Equipment from './Equipment';
  import Key from './Key';

  export default {
    computed: {

    },
    mounted() {
      emulator.getKeyboard().listener = (keyId, pressed) => {
        this.$set(this.keystate, keyId, pressed);
      };
    },
    data: () => ({
      keystate: {}
    }),
    methods:{
      keypress({ keyId, pressed }) {
        if (pressed) {
          emulator.getKeyboard().pressKey(keyId);
        }
        else {
          emulator.getKeyboard().releaseKey(keyId);
        }
      },
      keydownHandler(key) {
        emulator.getBrowserKeyboard().browserKeyDown(key.keyCode);
        key.preventDefault();
      },
      keyupHandler(key) {
        emulator.getBrowserKeyboard().browserKeyUp(key.keyCode);
        key.preventDefault();
      }
    },
    components: {
      Equipment,
      Key
    }
  }
</script>
<style>
.exidy-key-row {
  border-radius:10px;
  background-color:black;
  width: fit-content !important;
  flex: none !important;
}
</style>
