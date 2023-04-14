<template>
  <div>
    <h1>{{ event.title }}</h1>
    <p>{{ event.description }}</p>
    <p>Location: {{ event.location }}</p>
    <p>Date: {{ event.date }}</p>
    <p v-if="event.public">This event is public.</p>
    <p v-else>This event is private.</p>
    <button @click="deleteEvent">Delete Event</button>
    <GuestList :event-id="event.id" />
    <GuestForm :event-id="event.id" />
    <GuestsIndex :event-id="event.id" />
  </div>
</template>
  
<script>
  import GuestList from './GuestList.vue'
  import GuestForm from './GuestForm.vue'
  import GuestsIndex from './GuestsIndex.vue'
  
  export default {
  components: { GuestList, GuestForm, GuestsIndex },
  data() {
    return {
    event: {}
    }
  },
  mounted() {
    this.loadEvent()
  },
  methods: {
    loadEvent() {
    axios.get(`/api/events/${this.$route.params.id}`)
      .then(response => {
      this.event = response.data
      })
    .catch(error => {
    console.log(error)
    })
    },
    deleteEvent() {
    axios.delete(`/api/events/${this.$route.params.id}`)
      .then(response => {
      console.log(response)
      this.$router.push('/')
      })
      .catch(error => {
      console.log(error)
      })
    }
  }
}
  </script>
  