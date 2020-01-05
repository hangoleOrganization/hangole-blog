<template>
  <v-navigation-drawer class="sidebar" v-model="$store.getters.ui.sidebar" app>
    <v-list subheader>
      <v-list-item class="sidebar-item">
        <v-list-item-icon class="sidebar-icon-wrapper">
          <v-icon v-text="'mdi-settings'" />
        </v-list-item-icon>

        <v-list-item-content class="sidebar-text-wrapper">
          <span class="sidebar-text">asd</span>
        </v-list-item-content>
      </v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>

<script>
export default {
  name: 'Sidebar',

  components: {
  }
};
</script>
