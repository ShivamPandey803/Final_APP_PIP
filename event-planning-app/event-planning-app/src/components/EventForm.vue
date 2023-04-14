<template>
  <form @submit.prevent="handleSubmit">
  <div>
    <label>Name</label>
    <input v-model="name" type="text" :class="{ 'is-invalid': $v.name.$error }">
    <div class="invalid-feedback" v-if="!$v.name.required">Name is required.</div>
    </div>
  <div>
    <label>Description</label>
    <textarea v-model="description"></textarea>
    </div>
  <div>
    <label>Date</label>
    <input v-model="date" type="date" :class="{ 'is-invalid': $v.date.$error }">
    <div class="invalid-feedback" v-if="!$v.date.required">Date is required.</div>
  </div>
  <div>
    <label>Time</label>
    <input v-model="time" type="time" :class="{ 'is-invalid': $v.time.$error }">
    <div class="invalid-feedback" v-if="!$v.time.required">Time is required.</div>
  </div>
  <div>
    <label>Location</label>
    <input v-model="location" type="text" :class="{ 'is-invalid': $v.location.$error }">
    <div class="invalid-feedback" v-if="!$v.location.required">Location is required.</div>
  </div>
  <div>
    <label>Public</label>
    <input v-model="public" type="checkbox">
  </div>
  <div>
    <label>Budget</label>
    <input v-model.number="budget" type="number" :class="{ 'is-invalid': $v.budget.$error }">
    <div class="invalid-feedback" v-if="!$v.budget.required">Budget is required.</div>
    <div class="invalid-feedback" v-if="!$v.budget.numeric">Budget must be a number.</div>
    <div class="invalid-feedback" v-if="!$v.budget.minValue">Budget must be greater than or equal to 0.</div>
  </div>
      <button type="submit">Save</button>
  </form>
  </template>
  
  <script>
  import { required, minValue, numeric } from 'vuelidate/lib/validators'
  
  export default {
    name: 'EventForm',
    data() {
      return {
        name: '',
        description: '',
        date: '',
        time: '',
        location: '',
        public: true,
        budget: ''
      }
    },
    validations: {
      name: {
        required
      },
      date: {
        required
      },
      time: {
        required
      },
      location: {
        required
      },
      budget: {
        required,
        numeric,
        minValue: minValue(0)
      }
    },
    methods: {
      handleSubmit() {
        if (this.$v.$invalid) {
          return
        }
        const event = {
          name: this.name,
          description: this.description,
          date: this.date,
          time: this.time,
          location: this.location,
          public: this.public,
          budget: this.budget
        }
        this.$emit('submit', event)
      }
    }
  }
  </script>
  