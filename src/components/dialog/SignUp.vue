<template>
  <v-dialog v-model="$store.getters.ui.dialog.signUp" content-class="dialog" persistent>
    <v-card tile>
      <v-form @submit.prevent="signUp">
        <v-card-title class="display-1 font-weight-black text-center">Sign Up</v-card-title>
        <v-card-text>
          <v-text-field v-model="email" counter clearable type="email" label="Email" prepend-inner-icon="mdi-email" hint="At least 8 characters" />
          <v-text-field v-model="password" counter clearable label="Password" prepend-inner-icon="mdi-key" hint="At least 8 characters" :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'" :type="showPassword ? 'text' : 'password'" @click:append="showPassword = !showPassword" />
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn text tile @click="cancel">Cancel</v-btn>
          <v-btn text tile @click="signIn">Sign In</v-btn>
          <v-btn text tile color="green darken-1" @click="signUp">Sign Up</v-btn>
        </v-card-actions>
      </v-form>
    </v-card>
  </v-dialog>
</template>

<script>
import firebase from 'firebase'

export default {
  name: 'SignUp',

  components: {
  },

  data: () => ({
    email: '',
    password: '',
    showPassword: false
  }),

  methods: {
    signUp () {
      firebase.auth().createUserWithEmailAndPassword(this.email, this.password).then((user) => {
        window.console.log(user);

        this.$store.state.ui.dialog.signUp = false;
      }).catch((error) => {
        window.console.log(error);
      });
    },
    signIn () {
      this.$store.state.ui.dialog.signUp = false;
      this.$store.state.ui.dialog.signIn = true;
    },
    cancel () {
      this.$store.state.ui.dialog.signUp = false;
    }
  }
};
</script>

<style>
</style>
