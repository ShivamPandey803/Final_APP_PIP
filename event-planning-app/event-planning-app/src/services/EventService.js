import axios from 'axios'

const API_URL = 'http://localhost:3000/api/events/'

class EventService {
  getEvents() {
    return axios.get(API_URL)
  }

  createEvent(event) {
    return axios.post(API_URL, event)
  }

  deleteEvent(id) {
    return axios.delete(API_URL + id)
  }
}

export default new EventService()
