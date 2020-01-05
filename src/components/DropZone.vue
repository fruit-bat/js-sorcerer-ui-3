
<!-- (c) Liaquay Ltd 2017 -->
<template>
  <div
    class="dropzone"
    :class="{dragOver: isDragOver, drag: isDrag}"
    @click="onClick"
  >
    <div v-if="isDragOver || isDrag" class="dropzone-overlay"
      @dragenter="onDragEnter"
      @dragleave="onDragLeave"
      @dragover="onDragOver"
      @drop="onDrop"
    />
    <input type="file" @change="onFileChange"/>
    <slot>
      <div class="dropzone-default">Drop Zone</div>
    </slot>
  </div>
</template>

<script>

export default {
  props :  {
    disabled: {
      default: false,
      type: Boolean
    },
    clickable: {
      default: false,
      type: Boolean
    }
  },
  data() {
    return {
      isDragOver: false,
      isDrag: false
    };
  },
  mounted() {
    document.addEventListener('dragenter', this.documentDragEnter, false);
    document.addEventListener('drop', this.documentDragExit, false);
  },
  beforeDestroy() {
    document.removeEventListener('dragenter', this.documentDragEnter);
    document.removeEventListener('drop', this.documentDragExit);
  },
  methods: {

    stopEvent(e) {
      e.stopPropagation();
      e.preventDefault();
    },

    onDragOver(e) {
      if (this.isEnabled()) {
        this.stopEvent(e);
      }
    },

    onDragEnter(e) {
      if (this.isEnabled()) {
        this.stopEvent(e);
        this.isDragOver = true;
      }
    },

    onDragLeave(e) {
      if (this.isEnabled()) {
        this.stopEvent(e);
        this.isDragOver = false;
      }
    },

    onFileChange(e) {
      if (this.isEnabled()) {
        this.handleFiles(e.target.files);
      }
    },

    onDrop(e) {
      if (this.isEnabled()) {
        this.stopEvent(e);

        let url = e.dataTransfer.getData('text/plain');

        if (url) {
          this.handleUrl(url);
        } else {
          this.handleFiles(e.dataTransfer.files);
        }
      }
      this.isDragOver = false;
    },

    isEnabled() {
      return !this.disabled;
    },

    isClickable() {
      return this.clickable;
    },

    upload() {
      if (this.isEnabled()) {
        this.$el.querySelector('input').click();
      }
    },

    onClick(e) {
      if (this.isEnabled() && this.isClickable()) {
        this.upload();
      }
    },

    handleUrl(url) {
      this.$emit('url-for-upload', url);
    },

    handleFiles(files) {
      for (let i = 0; i < files.length; i++) {
        let file = files[i];
        this.$emit('file-for-upload', file);
      }
    },

    documentDragEnter(e) {
      if (this.isEnabled()) {
        this.isDrag = true;
        if (this._timeout) {
          clearTimeout(this._timeout);
        }
        this._timeout = setTimeout(() => {
          this.isDrag = false;
        }, 1000);
      }
    },
    documentDragExit(e) {
      this.isDrag = false;
    }
  },
  watch: {
    disabled() {
      this.isDragOver = false;
      this.isDrag = false;
    }
  }
};

</script>

<style scoped>

.dropzone {
  padding: 7px;
  display: inline-flex;
  position: relative;
}
.dropzone .dropzone-default {
  border-style: solid;
  border-width: 1px;
  border-color: #ccc;
  text-align: center;
  padding: 5px;
}
.dropzone.drag {
  border-style: dotted;
  border-color: grey;
}
.dropzone.dragOver {
  border-style: dashed;
  border-color: grey;
}
.dropzone.drag, .dropzone.dragOver {
  padding: 3px;
  border-width: 4px;
}
.dropzone input {
  display: none;
}
.dropzone-overlay {
  z-index: 1;
  position: absolute;
  top: 0px;
  left: 0px;
  right: 0px;
  bottom: 0px;
  opacity: 0.2;
  background-color: blue;
}
.dropzone-overlay * {
  pointer-events: none;
}


</style>
