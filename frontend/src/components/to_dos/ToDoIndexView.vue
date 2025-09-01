<script setup lang="ts">
import { onMounted } from 'vue'
import { usersStore } from '../../store/users'
import { toDosStore } from '../../store/to_dos'

const users = usersStore()
const store = toDosStore()

onMounted(() => {
  users.fetchUsers().then(() => {
    store.fetchToDos()
  })  
})
</script>

<template>
  <div>
    <h1 class="text-2xl font-bold mb-4">Todo Index</h1>
    <div class="py-6 px-[10vw]">
      <div class="flex flex-col items-center mb-4 w-full p-6 bg-white rounded-lg shadow-md">
        <div v-for="to_do in store.to_dos.filter(to_do => !store.completed(to_do))" :key="to_do.id" class="flex w-full items-center">
          <input @change="store.markAsCompleted(to_do)" :checked="store.completed(to_do)" class="mr-2" type="checkbox">
          <RouterLink class="flex-grow-2" :to="`/to_dos/${to_do.id}`">{{ to_do.title }}</RouterLink>
          <img v-if="users.users_hash[parseInt(to_do.assigned_to_id)].avatar" :src="users.users_hash[parseInt(to_do.assigned_to_id)].avatar" alt="Assigned to" class="w-10 h-10 rounded-full object-cover" />
          <button @click="store.deleteToDo(to_do)" class="ml-5 px-3 py-1 bg-rose-400 hover:bg-rose-500 text-white rounded-lg shadow-md">X</button>
        </div>
        <div class="flex w-full align-left items-center my-4">
          <RouterLink to="/to_dos/new" class="px-3 py-1 text-slate-700 bg-slate-50 hover:bg-slate-100 border border-slate-300 rounded-4xl shadow-md">Add a to-do</RouterLink>
        </div>
        <div v-for="to_do in store.to_dos.filter(td => store.completed(td))" :key="to_do.id" class="flex w-full items-center">
          <input @change="store.markAsCompleted(to_do)" :checked="store.completed(to_do)" class="mr-2" type="checkbox">
          <RouterLink class="flex-grow-2" :to="`/to_dos/${to_do.id}`">{{ to_do.title }}</RouterLink>
          <img v-if="users.users_hash[parseInt(to_do.assigned_to_id)].avatar" :src="users.users_hash[parseInt(to_do.assigned_to_id)].avatar" alt="Assigned to" class="w-10 h-10 rounded-full object-cover" />
          <button @click="store.deleteToDo(to_do)" class="ml-5 px-3 py-1 bg-rose-400 hover:bg-rose-500 text-white rounded-lg shadow-md">X</button>
        </div>
      </div>
    </div>
  </div>
</template>
