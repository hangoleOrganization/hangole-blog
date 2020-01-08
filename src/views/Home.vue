<template>
  <div class="home">
    <v-row>
      <v-col cols="12">
        <v-card tile flat dark color="black">
          <v-row class="ma-0">
            <v-col cols="4">
              <v-row>
                <v-col cols="12">
                  <v-card-subtitle class="pb-0" v-text="hotPost.subtitle" />

                  <v-card-title class="py-0 display-1" v-text="hotPost.title" />

                  <v-divider class="mx-4 mt-2" style="width: 30%;" />

                  <v-card-text>Whitsunday Island, Whitsunday Islands</v-card-text>
                </v-col>
                <v-spacer />
                <v-col cols="12">
                  <v-card-text>Whitsunday Island, Whitsunday Islands</v-card-text>

                  <v-card-actions>
                    <v-btn tile dark v-text="'qweqwe'" />
                  </v-card-actions>
                </v-col>
              </v-row>
            </v-col>
            <v-img :src="require(`@/assets/images/${hotPost.image}`)" aspect-ratio="1.7">
              <template v-slot:placeholder>
                <v-row class="fill-height ma-0" align="center" justify="center">
                  <v-progress-circular indeterminate color="grey lighten-5" />
                </v-row>
              </template>
            </v-img>
          </v-row>
        </v-card>
      </v-col>
    </v-row>

    <v-row>
      <v-col cols="8">
        <v-row class="ma-0">
          <v-col cols="12" v-for="(post, postIndex) in posts" :key="postIndex">
            <v-card tile flat>
              <v-row class="my-0">
                <v-img :src="require(`@/assets/images/${post.image}`)" aspect-ratio="1.7">
                  <template v-slot:placeholder>
                    <v-row class="fill-height ma-0" align="center" justify="center">
                      <v-progress-circular indeterminate color="grey darken-1" />
                    </v-row>
                  </template>
                </v-img>
                <v-col cols="6">
                  <v-card-title v-text="post.title" />

                  <v-card-subtitle v-text="post.subtitle" />

                  <v-card-text>
                    <div>Whitehaven Beach</div>

                    <div>Whitsunday Island, Whitsunday Islands</div>
                  </v-card-text>
                </v-col>
              </v-row>
            </v-card>
          </v-col>
        </v-row>
      </v-col>
      <v-col cols="4">
        <v-row class="my-0">
          <v-col cols="12">
            <v-card tile flat dark color="black">
              <v-img :src="require(`@/assets/images/${issuePost.image}`)" aspect-ratio="1.7">
                <template v-slot:placeholder>
                  <v-row class="fill-height ma-0" align="center" justify="center">
                    <v-progress-circular indeterminate color="grey lighten-5" />
                  </v-row>
                </template>
              </v-img>

              <v-card-title v-text="issuePost.title" />

              <v-card-subtitle v-text="issuePost.subtitle" />

              <v-card-text>
                <div>Whitehaven Beach</div>

                <div>Whitsunday Island, Whitsunday Islands</div>
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </div>
</template>

<script>
export default {
  name: 'Home',

  components: {
  },

  data: () => ({
    hotPost: {
      title: 'test1',
      subtitle: 'test1',
      image: 'test1.jpg'
    },
    issuePost: {
      title: 'test7',
      subtitle: 'test7',
      image: 'test7.jpg'
    },
    posts: [
      {
        title: 'test2',
        subtitle: 'test2',
        image: 'test2.jpg'
      }, {
        title: 'test3',
        subtitle: 'test3',
        image: 'test3.jpg'
      }, {
        title: 'test4',
        subtitle: 'test4',
        image: 'test4.jpg'
      }, {
        title: 'test5',
        subtitle: 'test5',
        image: 'test5.jpg'
      }, {
        title: 'test6',
        subtitle: 'test6',
        image: 'test6.jpg'
      },
    ]
  })
};
</script>

<style>
.home {
}
</style>
