<template>
  <v-dialog v-model="$store.getters.ui.dialog.profile" content-class="dialog" persistent>
    <v-card tile>
      <v-card-title class="display-1 font-weight-black text-center">Profile</v-card-title>
      <v-card-text>
        Profile
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn text tile @click="close">Close</v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  name: 'Profile',

  components: {
  },

  data: () => ({
  }),

  methods: {
    close () {
      this.$store.state.ui.dialog.profile = false;
    }
  }
};
</script>

<style>
</style>
