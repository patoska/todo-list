import { defineStore } from 'pinia'

export interface ToDo {
  id?: number
  title: string
  due_on: string
  notify_id: string
  notes: string
  added_by_id: string
  assigned_to_id: string
  date_completed?: string
  estimate?: string
}

export const toDosStore = defineStore('to_dos', {
  state: () => ({
    to_dos: [] as ToDo[],
  }),

  actions: {
    completed(to_do: ToDo) {
      return to_do.date_completed !== null && to_do.date_completed !== undefined && to_do.date_completed !== ""
    },
    async fetchToDos() {
      const res = await fetch(`${import.meta.env.VITE_API_ENDPONT}/to_dos`)

      this.to_dos = await res.json()
    },

    async fetchToDo(id: number) {
      const res = await fetch(`${import.meta.env.VITE_API_ENDPONT}/to_dos/${id}`)
      return await res.json()
    },
    
    async createToDo(to_do: ToDo) {
      const res = await fetch(`${import.meta.env.VITE_API_ENDPONT}/to_dos`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(to_do),
      })
      const newToDo:any = await res.json()
      this.to_dos.push(newToDo)
    },

    removeToDo(to_doId: number) {
      this.to_dos = this.to_dos.filter(item => item.id !== to_doId);
    },

    async deleteToDo(to_do: ToDo) {
      const res = await fetch(`${import.meta.env.VITE_API_ENDPONT}/to_dos/${to_do.id}`, {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },
      })
      const jsonRes = await res.json()
      if (res.status == 200) {
        this.removeToDo(to_do.id!)
      }
      else {
        alert("Error deleting to_do")
      }
    },

    markAsCompleted(to_do: ToDo){
      if (to_do.date_completed == "" ||
          to_do.date_completed === undefined ||
          to_do.date_completed === null ) {
        
            to_do.date_completed = new Date().toISOString()
      }
      else {
        to_do.date_completed = ""
      }
      this.updateToDo(to_do)
    },

    async updateToDo(to_do: ToDo) {
      const res = await fetch(`${import.meta.env.VITE_API_ENDPONT}/to_dos/${to_do.id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(to_do),
      })
      const jsonRes = await res.json()
      if (res.status == 200) {
        jsonRes.to_do.date_completed
      }
      else {
        alert("Error updating to_do")
      }
    },
  },
})