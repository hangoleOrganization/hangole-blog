<template>
  <v-form @submit.prevent="post">
    <h4>제목</h4>
    <input v-model="title" type="text" />
    <h4>내용</h4>
    <input v-model="contents" type="text" />
    <div>
      <button>글쓰기</button>
    </div>
  </v-form>
</template>

<script>
import firebase from 'firebase'

export default {
  name: 'Test3',

  data: () => ({
    title: '',
    contents: ''
  }),

  methods: {
    post () {
      window.console.log(this.title);
      window.console.log(this.contents);

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
          window.console.log('posted');
        }
       });
    }
  }
};
</script>
