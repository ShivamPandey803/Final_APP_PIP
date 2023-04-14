<template>
  <div>
  <event-form @submit="handleSubmit"></event-form>
  <event-list :events="events" @delete="handleDelete"></event-list>
  </div>
</template>

<script>
import EventForm from './components/EventForm.vue'
import EventList from './components/EventList.vue'
import EventService from './services/EventService.js'

export default {
  name: 'App',
  components: {
    EventForm,
    EventList
  },
data() {
  return {
    events: []
  }
},
created() {
  this.getEvents()
  },
methods: {
  getEvents() {
    EventService.getEvents()
      .then(response => {
        this.events = response.data
      })
      .catch(error => {
        console.log(error)
      })
  },
  handleSubmit(event) {
    EventService.createEvent(event)
      .then(() => {
        this.getEvents()
      })
      .catch(error => {
        console.log(error)
      })
  },
  handleDelete(id) {
    EventService.deleteEvent(id)
      .then(() => {
        this.getEvents()
      })
      .catch(error => {
        console.log(error)
      })
    }
  }
}
</script>
