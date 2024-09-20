import { LightningElement, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class WeatherSearch extends LightningElement {
  @track city = '';
  @track weatherData = [];
  @track error;

  handleCityChange(event) {
    this.city = event.target.value;
  }

  async handleGetWeather() {
    if (!this.city) {
      this.error = 'Please enter a city name';
      return;
    }
    this.error = null;
    const apiKey = '3fc7b67ab12843eaa61e9ffb29659de6'; // Tu clave API de Weatherbit
    const endpoint = `https://api.weatherbit.io/v2.0/current?city=${this.city}&key=${apiKey}&units=M`;
    try {
      const response = await fetch(endpoint);
      if (!response.ok) {
        throw new Error('Error fetching weather data');
      }
      const data = await response.json();
      if (data.error) {
        throw new Error(data.error.message);
      }
      this.weatherData = data.data;
    } catch (error) {
      this.weatherData = [];
      this.error = error.message;
      this.dispatchEvent(
        new ShowToastEvent({
          title: 'Error',
          message: error.message,
          variant: 'error',
        })
      );
    }
  }
}
