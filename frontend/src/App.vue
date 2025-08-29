<template>
  <div class="min-h-screen bg-gray-100 text-gray-900">
    <nav class="bg-slate-700 text-white p-4 flex gap-4">
      <RouterLink to="/" class="hover:underline">To-Dos</RouterLink>
      <RouterLink to="/users" class="hover:underline">Users</RouterLink>
    </nav>
    <main class="p-6">
      <RouterView />
    </main>
  </div>
</template>