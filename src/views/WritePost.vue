<template>
  <div class="write-post">
    <v-form @submit.prevent="post">
      <v-text-field v-model="title" outlined counter clearable autofocus autoComplete="off" type="text" label="Title" hint="At least 8 characters" />

      <v-textarea v-model="contents" outlined counter auto-grow label="Contents" hint="At least 8 characters" />

      <v-row>
        <v-col v-for="(image, imageIndex) in images" :key="imageIndex" class="d-flex child-flex" cols="2">
          <div class="image-card d-flex" @click="removeImage(imageIndex)">
            <v-img :src="image.url" aspect-ratio="1">
              <template v-slot:placeholder>
                <v-row class="fill-height ma-0" align="center" justify="center">
                  <v-progress-circular indeterminate color="grey lighten-5" />
                </v-row>
              </template>
            </v-img>
          </div>
        </v-col>
        <v-col class="d-flex child-flex" cols="2">
          <div class="image-card d-flex" @click="addImage" v-if="images.length < maxImageCount">
            <v-img class="image-card-add" aspect-ratio="1">
              <v-icon large v-text="'mdi-image-plus'" />
            </v-img>
          </div>
          <div class="image-card else d-flex" v-else>
            <v-img class="image-card-max" aspect-ratio="1">
              You can upload up to 8 images
            </v-img>
          </div>
        </v-col>
      </v-row>

      <v-row class="mx-0 my-4" justify="end">
        <v-btn class="mr-1" tile :elevation="0" @click="reset">
          Reset
          <v-icon class="ml-1" v-text="'mdi-sync'" />
        </v-btn>

        <v-btn dark tile :elevation="0">
          Write
          <v-icon class="ml-1" v-text="'mdi-check'" />
        </v-btn>
      </v-row>

      <input multiple ref="image" style="display: none;" type="file" accept="image/*" @change="onFilePicked" />
    </v-form>
  </div>
</template>

<script>
import firebase from 'firebase'

export default {
  name: 'WritePost',

  components: {
  },

  data: () => ({
    title: '',
    contents: '',
    images: [],
    maxImageCount: 8
  }),

  methods: {
    post () {
      let newPostKey = firebase.database().ref().child('posts').push().key;

      let postData = {
        id: newPostKey,
        writer: 'user',
        title: this.title,
        contents: this.contents,
        date: Date.now()
      };

      let updates = {};
      updates['/posts/' + newPostKey] = postData;

      firebase.database().ref().update(updates, (error) => {
        if (error) {
          window.console.log(error);
        } else {
          window.console.log('wrote post');
          this.$router.push('/');
        }
       });
    },
    reset () {
      this.title = '';
      this.contents = '';
      this.images = [];
    },
    removeImage (imageIndex) {
      this.images.splice(imageIndex, 1);
    },
    addImage () {
      this.$refs.image.click();
    },
    onFilePicked (event) {
      const files = event.target.files;

      let fileLength = files.length;

      if (fileLength + this.images.length > this.maxImageCount) {
        fileLength = this.maxImageCount - this.images.length;
      }

      for (let i = 0; i < fileLength; i++) {
        let file = files[i];
        if (file !== undefined) {
          if (typeof file !== 'object') {
            return;
          }

          let image = {};
          image.name = file.name;
  
          if (!image.name || image.name.lastIndexOf('.') < 0) {
            return;
          }
  
          const fileReader = new FileReader();
          fileReader.addEventListener('load', () => {
            image.url = fileReader.result;
            image.file = file;
            this.images.push(image);
          });
  
          fileReader.readAsDataURL(file);
        }
      }
    }
  }
};
</script>

<style>
.write-post {
  user-select: none;
}

.image-card {
  cursor: pointer;
  border: 1px solid rgba(0, 0, 0, 0.86);
  opacity: 0.38;
  border-radius: 4px;
  transition: all .3s cubic-bezier(0.25, 0.8, 0.25, 1);
}

.image-card:hover,
.image-card.else {
  opacity: 1;
}

.image-card.else {
  cursor: default;
}

.image-card-add .v-responsive__content {
  display: flex;
  justify-content: center;
  align-items: center;
}

.image-card-max .v-responsive__content {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 12px;
  font-size: 12px;
  text-align: center;
}
</style>
