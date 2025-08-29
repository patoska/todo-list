<script setup lang="ts">
import ToDo  from './ToDo.vue';

</script>

<template>
  <div>
    <suspense>
      <template #default>
        <ToDo />
      </template>
      <template #fallback>
        Loading...
      </template>
    </suspense>
  </div>
</template>