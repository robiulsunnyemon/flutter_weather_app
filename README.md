# 🌤️ Flutter Weather App

This is a weather application built with **Flutter** that fetches real-time weather data from [WeatherAPI.com](https://www.weatherapi.com/). The app provides **hourly weather updates** and a **7-day weather forecast**. It also features **dark/light theme management** using the **Provider state management**.

## ✨ Features

- 🌦️ **Hourly Weather Updates**: Get weather data for every hour of the day.
- 📅 **7-Day Forecast**: View upcoming weather conditions for the next 7 days.
- 🌙 **Dark/Light Theme Support**: Switch between dark and light modes seamlessly.
- 📍 **Location-Based Weather**: Get weather updates based on your current location.
- 🔄 **API Integration**: Fetches weather data from [WeatherAPI.com](https://www.weatherapi.com/).
- 📱 **Responsive UI**: Works smoothly on both Android and iOS.

## 📸 Screenshots

_(Add screenshots of your app here)_

## 🚀 Installation

1. **Clone the repository**
   ```sh
   git clone https://github.com/your-username/weather-app.git
   cd weather-app
   ```
2**Install dependencies**
  ````sh
  flutter pub get
  flutter run
  ````

## 🛠️ Technologies Used
- Flutter (Dart)
- Provider (State Management)
- WeatherAPI.com (Weather Data)
- Dio / HTTP Package (API Calls)
- Shared Preferences (Theme Management)


## 🔑 API Configuration
- Sign up on WeatherAPI.com to get your free API key.
- Create a .env file in the root directory and add:

  ````sh
  WEATHER_API_KEY=your_api_key_here
  ````
- Use this key in your app while making API requests.  

## 📌 Future Improvements
- Add search functionality for different cities.
- Show weather alerts and warnings.
- Improve UI with animations.

## 🤝 Contributing
Contributions are welcome! Feel free to submit a PR or open an issue.

## 📄 License
This project is open-source and available under the MIT License.