<template>
  <div>
    <h2>Invite Guests</h2>
    <form @submit.prevent="submitForm">
    <label>
      Name:
      <input type="text" v-model="name" required>
      </label>
      <label>
      Email:
      <input type="email" v-model="email" required>
      </label>
      <button type="submit">Invite</button>
      </form>
  </div>
  </template>
  
  <script>
  
export default {
  props: ['eventId'],
  data() {
  return {
    name: '',
    email: ''
    }
  },
  methods: {
  submitForm() {
    axios.post(`/api/events/${this.eventId}/guests`, {
    name: this.name,
    email: this.email
  })
  .then(response => {
  console.log(response)
  this.name = ''
  this.email = ''
  })
  .catch(error => {
    console.log(error)
        })
      }
    }
  }
  </script>
  