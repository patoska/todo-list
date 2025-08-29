<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { toDosStore, type ToDo } from '../../store/to_dos'
import { usersStore } from '../../store/users'

const store = toDosStore()
const users = usersStore()
const router = useRouter()

onMounted(() => {
  users.fetchUsers()
})

const form = ref<ToDo>({
  title: '',
  due_on: '',
  notify_id: '',
  notes: '',
  added_by_id: '',
  assigned_to_id: '',
})

async function submitForm() {
  if (!form.value.title ||
      !form.value.due_on ||
      !form.value.notify_id ||
      !form.value.notes ||
      !form.value.added_by_id ||
      !form.value.assigned_to_id) {
    alert('Fill all the inputs please.')
    return
  }

  await store.createToDo(form.value)
  router.push('/to_dos')
}
</script>

<template>
  <form @submit.prevent="submitForm" class="space-y-4 max-w-lg">
    <div>
      <label class="block mb-1 font-medium">Title</label>
      <input v-model="form.title" class="w-full border rounded p-2" required />
    </div>
    <div>
      <label class="block mb-1 font-medium">Due on</label>
      <input v-model="form.due_on" class="w-full border rounded p-2" />
    </div>
    <div>
      <label class="block mb-1 font-medium">Notify</label>
      <select v-model="form.notify_id" class="w-full border rounded p-2">
        <option v-for="user in users.users" :key="user.id" :value="user.id">{{ user.first_name }} {{ user.last_name }}</option>
      </select>
    </div>
    <div>
      <label class="block mb-1 font-medium">Notes</label>
      <input v-model="form.notes" class="w-full border rounded p-2" />
    </div>
    <div>
      <label class="block mb-1 font-medium">Added by</label>
      <select v-model="form.added_by_id" class="w-full border rounded p-2">
        <option v-for="user in users.users" :key="user.id" :value="user.id">{{ user.first_name }} {{ user.last_name }}</option>
      </select>
    </div>
    <div>
      <label class="block mb-1 font-medium">Assigned to</label>
      <select v-model="form.assigned_to_id" class="w-full border rounded p-2">
        <option v-for="user in users.users" :key="user.id" :value="user.id">{{ user.first_name }} {{ user.last_name }}</option>
      </select>
    </div>
    <button type="submit" class="px-4 py-2 bg-indigo-600 text-white rounded hover:bg-indigo-700">
      Submit
    </button>
  </form>
</template>
