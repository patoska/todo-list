<script setup lang="ts">
import { toDosStore } from '../../store/to_dos'
import { useRoute } from 'vue-router';

const store = toDosStore()
let not_found = false

const route = useRoute();
const id = parseInt(route.params.id + "");
const to_do = await store.fetchToDo(id)

not_found = to_do.status == 404
</script>

<template>
  <div>
    <div v-if="not_found">404 not found</div>
    <div v-else>
      <div class="flex flex-col px-[15vw] py-5">
        
        <div class="flex flex-row">
          <div class="p-5 font-bold w-[15vw]  min-w-[15vw]  max-w-[15vw]"></div>
          <div class="p-5 flex-grow-2 font-bold text-4xl">{{ to_do.title }}</div>
        </div>
        <div class="flex flex-row">
          <div class="p-5 font-bold w-[15vw]  min-w-[15vw]  max-w-[15vw]">Assigned to</div>
          <div class="p-5 flex-grow-2">{{ to_do.title }}</div>
        </div>
        <div class="flex flex-row">
          <div class="p-5 font-bold w-[15vw]  min-w-[15vw]  max-w-[15vw]">Due on</div>
          <div class="p-5 flex-grow-2">{{ to_do.due_on }}</div>
        </div>
        <div class="flex flex-row">
          <div class="p-5 font-bold w-[15vw]  min-w-[15vw]  max-w-[15vw]">When done, notify</div>
          <div class="p-5 flex-grow-2">{{ to_do.notify }}</div>
        </div>
        <div class="flex flex-row">
          <div class="p-5 font-bold w-[15vw]  min-w-[15vw]  max-w-[15vw]">Notes</div>
          <div class="p-5 flex-grow-2">{{ to_do.notes }}</div>
        </div>
        <div class="flex flex-row">
          <div class="p-5 font-bold w-[15vw]  min-w-[15vw]  max-w-[15vw]">Added by</div>
          <div class="p-5 flex-grow-2">{{ to_do.added_by }}</div>
        </div>
      </div>
    </div>
  </div>
</template>