<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { toDosStore, type ToDo } from '../../store/to_dos'
import { usersStore } from '../../store/users'

const store = toDosStore()
const users = usersStore()
const route = useRoute();
const router = useRouter()
let not_found = false
let loading = true
let to_do:any
let id:number

if (route.params !== undefined && "id" in route.params) {
  id = parseInt(route.params.id + "");
  to_do = await store.fetchToDo(id)
  not_found = to_do.status == 404
}
users.fetchUsers()

const form = ref<ToDo>({
  title: to_do ? to_do.title : '',
  due_on: to_do ? to_do.due_on : '',
  notify_id: to_do ? to_do.notify_id : '',
  notes: to_do ? to_do.notes : '',
  added_by_id: to_do ? to_do.added_by_id : '',
  assigned_to_id: to_do ? to_do.assigned_to_id : '',
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

  if (id) {
    form.value.id = id
    await store.updateToDo(form.value)
  }
  else {
    await store.createToDo(form.value)
  }
  router.push('/to_dos')
}
</script>

<template>
  <div class="flex flex-col px-[15vw] py-5">
    <form @submit.prevent="submitForm">
      <div class="flex flex-row">
        <div class="p-5 font-bold w-[15vw]  min-w-[15vw]  max-w-[15vw]">
          <div v-if="!id">Título</div>
        </div>
        <textarea v-if="id" v-model="form.title" class="p-5 flex-grow-2 font-bold text-4xl" required />
        <input v-else v-model="form.title" class="p-5 flex-grow-2" />
      </div>
      <div class="flex flex-row">
        <div class="p-5 font-bold w-[15vw]  min-w-[15vw]  max-w-[15vw]">Asignado a</div>
        <select v-model="form.assigned_to_id" class="p-5 flex-grow-2">
          <option v-for="user in users.users" :key="user.id" :value="user.id">{{ user.first_name }} {{ user.last_name }}</option>
        </select>
      </div>
      <div class="flex flex-row">
        <div class="p-5 font-bold w-[15vw]  min-w-[15vw]  max-w-[15vw]">Plazo</div>
        <input v-model="form.due_on" class="p-5 flex-grow-2" />
      </div>
      <div class="flex flex-row">
        <div class="p-5 font-bold w-[15vw]  min-w-[15vw]  max-w-[15vw]">Notificar a</div>
        <select v-model="form.notify_id" class="p-5 flex-grow-2">
          <option v-for="user in users.users" :key="user.id" :value="user.id">{{ user.first_name }} {{ user.last_name }}</option>
        </select>
      </div>
      <div class="flex flex-row">
        <div class="p-5 font-bold w-[15vw]  min-w-[15vw]  max-w-[15vw]">Notas</div>
        <input v-model="form.notes" class="p-5 flex-grow-2" />
      </div>
      <div class="flex flex-row">
        <div class="p-5 font-bold w-[15vw]  min-w-[15vw]  max-w-[15vw]">Agregado por</div>
        <select v-model="form.added_by_id" class="p-5 flex-grow-2">
          <option v-for="user in users.users" :key="user.id" :value="user.id">{{ user.first_name }} {{ user.last_name }}</option>
        </select>
      </div>
      <div v-if="id" class="flex flex-row">
        <div class="p-5 font-bold w-[15vw]  min-w-[15vw]  max-w-[15vw]">Estimación</div>
        <div class="p-5 flex-grow-2">{{ to_do.estimate }}</div>
      </div>
      <div class="flex flex-row">
        <div class="p-5 font-bold w-[15vw]  min-w-[15vw]  max-w-[15vw]"></div>
        <div class="p-5 flex-grow-2">
          <button type="submit" class="px-3 py-1 text-slate-700 bg-slate-50 hover:bg-slate-100 border border-slate-300 rounded-4xl shadow-md">
            Enviar
          </button>
        </div>
      </div>
    </form>
  </div>
</template>
