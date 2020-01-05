<template>
  <v-app-bar class="header" app hide-on-scroll extended elevate-on-scroll :scroll-threshold="1" :height="100" :extension-height="62">
    <v-row class="header-content-wrapper">
      <v-row class="header-title-wrapper" justify="center" align="center">
        <router-link class="header-title font-weight-black" to="/" v-text="'BLOGOLE'" />
        <v-row class="header-login-wrapper" align="center">
          <template v-if="$store.state.user.id">
            <v-btn fab color="white" :elevation="1" @click="profile">
              <v-icon v-text="'mdi-account'" />
            </v-btn>
            <v-col class="header-login-content">
              <v-row class="my-0">
                <div class="header-login-user" v-text="$store.state.user.name" />
              </v-row>
              <v-row class="my-0">
                <div class="header-login-user">
                  <span>Welcome, </span>
                  <a @click="signOut">Sign Out</a>
                </div>
              </v-row>
              <v-row class="my-0">
                <v-btn class="mt-1" dark tile small block color="black" :elevation="0" to="/writePost">
                  Write Post
                  <v-icon class="ml-1" small v-text="'mdi-square-edit-outline'" />
                </v-btn>
              </v-row>
            </v-col>
          </template>
          <template v-else>
            <v-btn fab color="white" :elevation="1" @click="signIn">
              <v-icon v-text="'mdi-account-question'" />
            </v-btn>
            <v-col class="header-login-content">
              <v-row class="my-0">
                <v-btn class="my-1" dark tile small block text color="black" :elevation="0" @click="signIn" v-text="'Sign In'" />
              </v-row>
              <v-row class="my-0">
                <v-btn class="my-1" dark tile small block color="black" :elevation="0" @click="signUp" v-text="'Sign Up'" />
              </v-row>
            </v-col>
          </template>
        </v-row>
      </v-row>
    </v-row>

    <template v-slot:extension>
      <v-app-bar-nav-icon @click="sidebar" />

      <v-spacer />

      <div class="header-menu-wrapper">
        <v-menu content-class="header-menu-content" offset-y bottom transition="slide-y-transition" v-for="(item, itemIndex) in items" :key="itemIndex">
          <template v-slot:activator="{ on }">
            <v-btn text v-on="on">
              <div v-text="item.title" />
              <v-icon v-text="'mdi-chevron-down'" />
            </v-btn>
          </template>
          <v-list dense flat>
            <v-list-item :to="menu.to" v-for="(menu, menuIndex) in item.child" :key="menuIndex">
              <v-list-item-content>
                <v-list-item-title v-text="menu.title" />
              </v-list-item-content>
            </v-list-item>
          </v-list>
        </v-menu>
      </div>

      <v-spacer />

      <v-btn icon @click="search">
        <v-icon v-text="'mdi-magnify'" />
      </v-btn>
    </template>
  </v-app-bar>
</template>

<script>
export default {
  name: 'Header',

  components: {
  },

  data: () => ({
    items: [
      {
        title: 'Category',
        child: [
          {
            title: 'IT',
            to: '/postList/category/it'
          }, {
            title: 'SOCIAL',
            to: '/postList/category/social'
          }
        ]
      }, {
        title: 'Tag',
        child: [
          {
            title: 'IT',
            to: '/postList/tag/it'
          }, {
            title: 'SOCIAL',
            to: '/postList/tag/social'
          }
        ]
      }
    ]
  }),

  methods: {
    signIn () {
      this.$store.state.ui.dialog.signIn = true;
    },
    signUp () {
      this.$store.state.ui.dialog.signUp = true;
    },
    signOut () {
      this.$store.state.user.name = '';
      this.$store.state.user.id = '';
      this.$store.state.user.token = {};
      this.$store.state.user.additionalUserInfo = {};
    },
    profile () {
      this.$store.state.ui.dialog.profile = true;
    },
    sidebar () {
      this.$store.state.ui.sidebar = !this.$store.state.ui.sidebar;
    },
    search () {
      this.$store.state.ui.search = true;
    }
  }
};
</script>

<style>
.header {
  user-select: none;
}

.v-app-bar.v-app-bar--hide-shadow {
  box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0.2), 0px 0px 0px 0px rgba(0, 0, 0, 0.14), 0px 0px 0px 0px rgba(0, 0, 0, 0.12) !important;
}

.v-toolbar {
  box-shadow: 0px 2px 1px -1px rgba(0, 0, 0, 0.2), 0px 1px 1px 0px rgba(0, 0, 0, 0.14), 0px 1px 3px 0px rgba(0, 0, 0, 0.12) !important;
}

.header-content-wrapper {
  width: 100%;
  height: 100%;
  overflow: visible !important;
}

.header-title-wrapper {
  position: relative;
}

.header-title {
  color: black !important;
  font-size: 4rem;
  letter-spacing: -5.5px;
  line-height: 3.125rem;
  text-align: center;
  text-transform: uppercase;
}

.header-login-wrapper {
  position: absolute;
  right: 32px;
  top: 0;
  bottom: 0;
}

.header-login-avatar {
  box-shadow: 0px 2px 1px -1px rgba(0, 0, 0, 0.2), 0px 1px 1px 0px rgba(0, 0, 0, 0.14), 0px 1px 3px 0px rgba(0, 0, 0, 0.12);
}

.header-login-content {
  margin-left: 12px;
}

.header-login-user {
  display: block;
  height: 14px;
  min-width: 64px;
  line-height: 14px;
  font-size: 0.7rem;
  font-weight: 500;
  white-space: nowrap;
}

.header-login-user a {
  color: black !important;
  opacity: 0.5;
}

.header-menu-wrapper {
  text-align: center;
}

.header-menu-content {
  box-shadow: 0px 2px 1px -1px rgba(0, 0, 0, 0.2), 0px 1px 1px 0px rgba(0, 0, 0, 0.14), 0px 1px 3px 0px rgba(0, 0, 0, 0.12) !important;
}
</style>
