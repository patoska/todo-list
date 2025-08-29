<script setup lang="ts">
import { onMounted } from 'vue'
import { usersStore } from '../../store/users'

const store = usersStore()

onMounted(() => {
  store.fetchUsers()
})
</script>

<template>
  <div>
    <RouterLink to="/users/new" class="hover:underline">New User</RouterLink>
    <h1 class="text-2xl font-bold mb-4">User Index</h1>
    <ul class="space-y-4">
      <li v-for="user in store.users" :key="user.id" class="p-4 border rounded-lg bg-white shadow">
        <p class="text-sm text-gray-500">ID: {{ user.id }}</p>
        <p class="text-gray-700">Name: {{ user.first_name }} {{ user.last_name }}</p>
        <p class="text-sm text-gray-500">Position: {{ user.position }}</p>
        <img v-if="user.avatar" :src="user.avatar" alt="User" class="mt-2 max-h-48 object-cover rounded" />
        <button @click="store.deleteUser(user)" class="px-3 py-1 bg-rose-400 hover:bg-rose-500 text-white rounded-lg shadow-md">Delete</button>
      </li>
    </ul>
  </div>
</template>
