<template>
  <div>
    <ul>
    <li v-for="event in events" :key="event.id">
      <h2>{{ event.name }}</h2>
      <p>{{ event.description }}</p>
      <p>Date: {{ event.date }}</p>
      <p>Time: {{ event.time }}</p>
      <p>Location: {{ event.location }}</p>
      <p>Public: {{ event.public ? 'Yes' : 'No' }}</p>
      <p>Budget: {{ event.budget }}</p>
      <button @click="handleDelete(event.id)">Delete</button>
    </li>
    </ul>
  </div>
</template>
  
<script>
export default {
  name: 'EventList',
  props: {
    events: Array
  },
  methods: {
  handleDelete(id) {
  this.$emit('delete', id)
    }
  }
}
  </script>
  