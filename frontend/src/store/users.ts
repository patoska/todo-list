import { defineStore } from 'pinia'

export interface User {
  id?: number
  first_name: string
  last_name: string
  position: string
  avatar: string
}

export const usersStore = defineStore('users', {
  state: () => ({
    users: [] as User[],
    users_hash: {} as Record<number, User>,
  }),

  actions: {
    async fetchUsers() {
      const res = await fetch(`${import.meta.env.VITE_API_ENDPONT}/users`)
      this.users = await res.json()
      this.users.forEach((user) => {
        this.users_hash[user.id!] = user;
      });
    },

    async createUser(user: User) {
      const res = await fetch(`${import.meta.env.VITE_API_ENDPONT}/users`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(user),
      })
      const newUser = await res.json()
      if (!Array.isArray(this.users)) {
        this.users = []
      }
      this.users.push(newUser)
    },

    removeUser(userId: number) {
      this.users = this.users.filter(item => item.id !== userId);
    },

    async deleteUser(user: User) {
      const res = await fetch(`${import.meta.env.VITE_API_ENDPONT}/users/${user.id}`, {
        method: 'DELETE',
        headers: { 'Content-Type': 'application/json' },
      })
      const jsonRes = await res.json()
      if (res.status == 200) {
        this.removeUser(user.id!)
      }
      else {
        alert("Error deleting user")
      }
    },
  },
})