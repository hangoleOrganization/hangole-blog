<template>
  <div class="home">
    <Test />
    <Test2 />
    <Test3 />
    <Test4 />
  </div>
</template>

<script>
import Test from '@/components/Test';
import Test2 from '@/components/Test2';
import Test3 from '@/components/Test3';
import Test4 from '@/components/Test4';

export default {
  name: 'home',

  components: {
    Test,
    Test2,
    Test3,
    Test4
  }
};
</script>
