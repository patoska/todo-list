import { createRouter, createWebHistory } from 'vue-router'
import TodoIndexView from '../components/to_dos/ToDoIndexView.vue'
import NewTodoView from '../components/to_dos/NewTodoView.vue'
import ShowToDo from '../components/to_dos/ShowToDo.vue'
import UserIndexView from '../components/users/UserIndexView.vue'
import NewUserView from '../components/users/NewUserView.vue'

const routes = [
  { path: '/', component: TodoIndexView },
  { path: '/to_dos', component: TodoIndexView },
  { path: '/to_dos/new', component: NewTodoView },
  { path: '/to_dos/:id', component: ShowToDo },
  { path: '/users', component: UserIndexView },
  { path: '/users/new', component: NewUserView }
]

export default createRouter({
  history: createWebHistory(),
  routes,
})
