<template>
  <div>
    <h2>Guest List</h2>
    <ul>
    <li v-for="guest in guests" :key="guest.id">
    {{ guest.name }} ({{ guest.email }})
    <button @click="deleteGuest(guest.id)">Remove</button>
    </li>
    </ul>
  </div>
</template>
  
<script>
  export default {
  props: ['eventId'],
  data() {
    return {
    guests: []
    }
  },
  mounted() {
    this.loadGuests()
  },
  methods: {
  loadGuests() {
  axios.get(`/api/events/${this.eventId}/guests`)
  .then(response => {
  this.guests = response.data
  })
  .catch(error => {
    console.log(error)
    })
  },
  deleteGuest(guestId) {
    axios.delete(`/api/events/${this.eventId}/guests/${guestId}`)
    .then(response => {
    console.log(response)
    this.loadGuests()
    })
  .catch(error => {
  console.log(error)
    })
  }
  }
}
  </script>
  