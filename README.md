# Flutter News App

A Flutter news app built using the latest Flutter features and tools. This app fetches news articles from an external API and displays them in an easy-to-read format. It utilizes modern state management, ORM, API integration, and model generation for clean, maintainable code.

## Features

- Fetches news articles from a RESTful API.
- Display articles with title, description, author, and image.
- Offline caching and local storage using Drift ORM.
- State management using RiverPod for efficient and scalable architecture.
- API integration with Retrofit and Dio for smooth networking.
- Automatic model generation using Freezed for cleaner, immutable code.
  
## Technologies Used

- **Flutter 3.24.5**: The latest stable version of Flutter.
- **Drift**: ORM for offline data storage and SQLite integration.
- **RiverPod**: State management solution for Flutter that provides a more flexible and scalable way to manage app state.
- **Retrofit**: A type-safe HTTP client for Flutter that makes network requests easy and efficient.
- **Dio**: A powerful HTTP client for Dart, used in conjunction with Retrofit for API calls.
- **Freezed**: Code generation tool for creating immutable models and reducing boilerplate code.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/flutter-news-app.git
   cd flutter-news-app

1. Install dependencies:

   ```bash
   flutter pub get

1. Run the app on an emulator or physical device:

   ```bash
   flutter run


## How it works

- **News API Integration:** The app fetches news articles using Retrofit and Dio. The news data is parsed into Dart models, and displayed in the UI.
- **State Management with RiverPod:** The app uses RiverPod to manage state, including news fetching, displaying data, and handling loading/error states.
- **Local Storage with Drift:** News articles are saved in a local SQLite database using Drift ORM. This allows the app to display cached articles when the device is offline.
- **Model Generation with Freezed:** Freezed is used to generate immutable models for the app, which simplifies data handling and reduces boilerplate code.



## Contributing
Feel free to fork the repository and submit a pull request if you'd like to contribute to the development of this app.

 ***Created by:*** [@dilshan98](https://github.com/dilshanmaduranga98)