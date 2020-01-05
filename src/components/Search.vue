<template>
  <v-bottom-sheet v-model="$store.getters.ui.search" fullscreen color="white" :retain-focus="false">
    <v-sheet class="search-sheet" color="white" height="100%">
      <v-btn class="close-button" icon large @click="close">
        <v-icon v-text="'mdi-close'" />
      </v-btn>
      <v-text-field class="search-query-field" counter clearable ref="searchQuery" autoComplete="off" label="Search" prepend-inner-icon="mdi-magnify" />
    </v-sheet>
  </v-bottom-sheet>
</template>

<script>
export default {
  name: 'Search',

  components: {
  },

  data: () => ({
  }),

  watch: {
    '$store.getters.ui.search' (val) {
      if (val) {
        this.$nextTick(() => this.$nextTick(() => this.$refs.searchQuery.$el.querySelector('input').focus()));
      }
    }
  },

  methods: {
    search () {
    },
    close () {
      this.$store.state.ui.search = false;
    }
  }
};
</script>

<style>
.search-sheet {
  padding: 64px;
}

.close-button {
  position: absolute;
  top: 8px;
  right: 8px;
}

.search-query-field input {
  text-align: center;
}
</style>
