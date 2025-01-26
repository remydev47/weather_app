 Weather App 

Project Overview
A mobile weather application built using Flutter, leveraging Dio for network requests and Riverpod for state management.

## Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio or VS Code with Flutter extensions
- Emulator or physical device

## Setup and Installation

### 1. Clone the Repository
```bash
git clone https://github.com/remydev47/weather_app.git
cd weather_app
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Configure API Keys
- Create a `.env` file in the root directory
- Add your weather API key: `API_KEY=your_api_key_here`

### 4. Run the App
```bash
flutter run
```

## Architecture and State Management
- Network Layer**: Dio for making HTTP requests
- State Management**: Riverpod for efficient and reactive state handling
- Design Pattern**: MVVM (Model-View-ViewModel)

## Key Features
- Real-time weather data
- Location-based forecasts
- Detailed weather information
- Error handling and loading states

## Challenges and Solutions

1. API Integration
Challenge: Handling different API response structures
Solution: Created robust parsing methods with null safety and custom error handling

2. State Management
Challenge: Managing complex application states
Solution: Implemented Riverpod providers for clean, testable state management

3. Location Services
-Challenge: Obtaining and managing user location
-Solution**: Used `geolocator` package with permission handling and fallback mechanisms

 Testing
- Unit tests for data models
- Widget tests for UI components
- Integration tests for critical user flows

# Future Improvements
- Offline support
- More detailed forecasts
- Custom location selection
- Advanced error handling
