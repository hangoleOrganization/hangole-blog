<template>
  <div>
    <div v-for="post in posts" :key="post.id">
      <div v-text="post.id" />
      <div v-text="post.title" />
      <div v-text="post.writer" />
      <div v-text="post.date" />
      <div v-text="post.contents" />
    </div>
  </div>
</template>

<script>
import firebase from 'firebase'

export default {
  name: 'Test4',

  data: () => ({
    posts: []
  }),

  methods: {
  },

  mounted () {
    firebase.database().ref('posts').orderByKey().once('value', (snapshot) => {
      snapshot.forEach((childSnapshot) => {
        let childData = childSnapshot.val();
        this.posts.push(childData);
      });
    });
  }
};
</script>
