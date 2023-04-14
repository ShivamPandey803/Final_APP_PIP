<template>
  <div>
  <h2>Guest List</h2>
  <table>
  <thead>
    <tr>
    <th>Name</th>
    <th>Email</th>
    <th>RSVP</th>
    </tr>
  </thead>
  <tbody>
  <tr v-for="guest in guests" :key="guest.id">
  <td>{{ guest.name }}</td>
  <td>{{ guest.email }}</td>
  <td>
  <select v-model="guest.rsvp" @change="updateGuest(guest)">
  <option value="pending">Pending</option>
  <option value="yes">Yes</option>
  <option value="no">No</option>
  </select>
  </td>
  </tr>
  </tbody>
  </table>
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
    updateGuest(guest) {
      axios.put(`/api/events/${this.eventId}/guests/${guest.id}`, { guest })
        .then(response => {
          console.log(response)
        })
        .catch(error => {
          console.log(error)
        })
      }
    }
  }
  