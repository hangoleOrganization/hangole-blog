<template>
  <v-form @submit.prevent="signIn">
    <h4>이메일</h4>
    <input v-model="email" type="email" />
    <h4>패스워드</h4>
    <input v-model="password" type="password" />
    <div>
      <button>로그인</button>
    </div>
  </v-form>
</template>

<script>
import firebase from 'firebase'

export default {
  name: 'Test2',

  data: () => ({
    email: '',
    password: ''
  }),

  methods: {
    signIn () {
      window.console.log(this.email);
      window.console.log(this.password);

      firebase.auth().signInWithEmailAndPassword(this.email, this.password).then((user) => {
        window.console.log(user);
      }).catch((error) => {
        window.console.log(error);
      });
    }
  }
};
</script>
