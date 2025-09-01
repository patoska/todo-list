<script setup lang="ts">
import ToDoForm from './ToDoForm.vue'
</script>

<template>
  <div>
    <suspense>
      <template #default>
        <ToDoForm />
      </template>
      <template #fallback>
        Loading...
      </template>
    </suspense>
  </div>
</template>
