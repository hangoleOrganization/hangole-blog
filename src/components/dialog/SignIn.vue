<template>
  <v-dialog v-model="$store.getters.ui.dialog.signIn" persistent max-width="290">
    <v-card>
      <v-form @submit.prevent="signIn">
        <v-card-title class="headline font-weight-black">Sign In</v-card-title>
        <v-card-text>
          <v-text-field v-model="email" counter clearable type="email" label="Email" prepend-inner-icon="mdi-email" hint="At least 8 characters" />
          <v-text-field v-model="password" counter clearable label="Password" prepend-inner-icon="mdi-key" hint="At least 8 characters" :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'" :type="showPassword ? 'text' : 'password'" @click:append="showPassword = !showPassword" />
        </v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn text @click="cancel">Cancel</v-btn>
          <v-btn text @click="signUp">Sign Up</v-btn>
          <v-btn color="green darken-1" text @click="signIn">Sign In</v-btn>
        </v-card-actions>
      </v-form>
    </v-card>
  </v-dialog>
</template>

<script>
import firebase from 'firebase'

export default {
  name: 'SignIn',

  components: {
  },

  data: () => ({
    email: '',
    password: '',
    showPassword: false
  }),

  methods: {
    signIn () {
      firebase.auth().signInWithEmailAndPassword(this.email, this.password).then((response) => {
        window.console.log(response);

        this.$store.state.user.name = this.email;
        this.$store.state.user.id = response.user.uid;
        this.$store.state.user.token = response.user;
        this.$store.state.user.additionalUserInfo = response.additionalUserInfo;

        this.$store.state.ui.dialog.signIn = false;
      }).catch((error) => {
        window.console.log(error);
      });
    },
    signUp () {
      this.$store.state.ui.dialog.signIn = false;
      this.$store.state.ui.dialog.signUp = true;
    },
    cancel () {
      this.$store.state.ui.dialog.signIn = false;
    }
  }
};
</script>

<style>
</style>
