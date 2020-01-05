<template>
  <v-dialog v-model="$store.getters.ui.dialog.profile" persistent max-width="290">
    <v-card>
      <v-card-title class="headline">Profile</v-card-title>
      <v-card-text>
        Profile
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn text @click="close">Close</v-btn>
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
