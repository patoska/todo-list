<script setup lang="ts">
import ToDoForm from './ToDoForm.vue'
</script>

<template>
  <div>
    <div class="flex flex-col px-[15vw] py-5">
      <div class="flex flex-row">
        <div class="p-5 font-bold w-[15vw]  min-w-[15vw]  max-w-[15vw]"></div>
        <div class="p-5 flex-grow-2 font-bold text-4xl" >Nuevo To-Do</div>
      </div>
    </div>
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
