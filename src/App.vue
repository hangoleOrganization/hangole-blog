<template>
  <v-app id="app" color="white">
    <Header />
    <Sidebar />

    <v-content class="app-content">
      <v-container class="app-container">
        <v-fade-transition hide-on-leave>
          <router-view />
        </v-fade-transition>
      </v-container>
    </v-content>

    <SignIn />
    <SignUp />
    <Profile />

    <Search />
  </v-app>
</template>

<script>
import Header from '@/components/Header';
import Sidebar from '@/components/Sidebar';

import SignIn from '@/components/dialog/SignIn';
import SignUp from '@/components/dialog/SignUp';
import Profile from '@/components/dialog/Profile';

import Search from '@/components/Search';

export default {
  name: 'App',

  components: {
    Header,
    Sidebar,
    SignIn,
    SignUp,
    Profile,
    Search
  },

  data: () => ({
  })
};
</script>

<style>

/* all */

* {
  outline: none;
  vertical-align: middle;
  scroll-behavior: smooth;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

/* scrollbar */

::-webkit-scrollbar {
  width: 0px;
}
::-webkit-scrollbar-track {
  background: transparent;
}
::-webkit-scrollbar-thumb {
  background: rgba(124, 124, 124, 0.5);
}
::-webkit-scrollbar-thumb:hover {
  background: rgba(124, 124, 124, 0.5);
}

/* user selection */

::-moz-selection {
  color: black !important;
  background: white !important;
}
::selection {
  color: black !important;
  background: white !important;
}

/* all scopes */

html, body {
  margin: 0px;
  background-color: white;
}

#app {
  background-color: white;
}

.app-content {
}

.app-container {
  max-width: 800px;
  margin: 62px auto;
}

a {
  color: inherit;
  text-decoration: none !important;
}

.hidden {
  position: fixed;
  bottom: 0;
  right: 0;
  display: none;
  width: 0px;
  height: 0px;
  opacity: 0;
  overflow: hidden;
}

.no-select {
  user-select: none !important;
}

.pointer {
  cursor: pointer !important;
}

.button-group-divider {
  width: 100%;
  margin: 8px 0px;
}

.spinner:not(.disabled) i.material-icons {
  -webkit-animation: anim-spinner 2s linear infinite;
  -moz-animation: anim-spinner 2s linear infinite;
  animation: anim-spinner 2s linear infinite;
}

.row {
  margin: -12px;
}

.v-divider {
  border-color: black !important;
}

.theme--dark.v-divider {
  border-color: white !important;
}

/* animation */

@keyframes anim-spinner {
  60% { -webkit-transform: rotate(1080deg); transform:rotate(1080deg); }
  100% { -webkit-transform: rotate(1440deg); transform:rotate(1440deg); }
}

/* fade-in */

.fade-in-transition-enter-active,
.fade-in-transition-leave-active {
  -webkit-transition: all .3s cubic-bezier(0, 0.49, 0.46, 1.01) !important;
  -moz-transition: all .3s cubic-bezier(0, 0.49, 0.46, 1.01) !important;
  -ms-transition: all .3s cubic-bezier(0, 0.49, 0.46, 1.01) !important;
  -o-transition: all .3s cubic-bezier(0, 0.49, 0.46, 1.01) !important;
  transition: all .3s cubic-bezier(0, 0.49, 0.46, 1.01) !important;
}

.fade-in-transition-enter-active {
  /* transition-delay: .3s; */
}
.fade-in-transition-leave-active {
  display: none;
}

.fade-in-transition-enter {
  opacity: 0;
}

/* slide-x */

.slide-x-enter-active,
.slide-x-leave-active {
  -webkit-transition: all .3s cubic-bezier(0, 0.49, 0.46, 1.01) !important;
  -moz-transition: all .3s cubic-bezier(0, 0.49, 0.46, 1.01) !important;
  -ms-transition: all .3s cubic-bezier(0, 0.49, 0.46, 1.01) !important;
  -o-transition: all .3s cubic-bezier(0, 0.49, 0.46, 1.01) !important;
  transition: all .3s cubic-bezier(0, 0.49, 0.46, 1.01) !important;
}

.slide-x-enter,
.slide-x-leave-to {
  transform: translateX(-100%);
}
</style>
