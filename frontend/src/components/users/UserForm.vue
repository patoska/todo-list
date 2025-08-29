<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { usersStore, type User } from '../../store/users'

const store = usersStore()
const router = useRouter()

const form = ref<User>({
  first_name: '',
  last_name: '',
  position: '',
  avatar: '',
})

function handleFileUpload(event: Event) {
  const file = (event.target as HTMLInputElement).files?.[0]
  if (!file) return

  const reader = new FileReader()
  reader.onload = () => {
    form.value.avatar = reader.result as string
  }
  reader.readAsDataURL(file)
}

async function submitForm() {
  if (!form.value.first_name ||
      !form.value.last_name ||
      !form.value.position ||
      !form.value.avatar) {
    alert('Fill all the inputs please.')
    return
  }

  await store.createUser(form.value)
  router.push('/users')
}
</script>

<template>
  <form @submit.prevent="submitForm" class="space-y-4 max-w-lg">
    <div>
      <label class="block mb-1 font-medium">First Name</label>
      <input v-model="form.first_name" class="w-full border rounded p-2" required />
    </div>

    <div>
      <label class="block mb-1 font-medium">Last Name</label>
      <input v-model="form.last_name" class="w-full border rounded p-2" />
    </div>

    <div>
      <label class="block mb-1 font-medium">Position</label>
      <input v-model="form.position" class="w-full border rounded p-2" />
    </div>

    <div>
      <label class="block mb-1 font-medium">Avatar</label>
      <input type="file" @change="handleFileUpload" />
      <img v-if="form.avatar" :src="form.avatar" class="mt-2 max-h-32 rounded shadow" />
    </div>

    <button type="submit" class="px-4 py-2 bg-indigo-600 text-white rounded hover:bg-indigo-700">
      Submit
    </button>
  </form>
</template>
