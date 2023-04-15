*Weather Application*
This is a weather application that allows users to view weather information for their location or for any city in the world. The application uses the OpenWeatherMap API to retrieve weather data and the BLoC pattern for state management.

Getting Started
To get started with the application, follow these steps:

Clone the repository to your local machine.
Open the project in your preferred IDE.
Run flutter pub get to install the necessary dependencies.
Add your OpenWeatherMap API key to the lib/config.dart file.
Run the application using flutter run.
Features
The weather application has the following features:

View current weather conditions for your location or for any city in the world.
View a five-day weather forecast for any city in the world.
View weather conditions in different units (metric or imperial).
Search for cities using a search bar.
View the current weather conditions on the home screen widget.
Libraries Used
The following libraries were used in the development of the weather application:

flutter_bloc: For implementing the BLoC pattern and managing application state.
http: For making HTTP requests to the OpenWeatherMap API.
geolocator: For retrieving the user's location.
flutter_svg: For displaying SVG icons.
Architecture
The weather application follows the BLoC architecture pattern, which separates the application into three layers:

Presentation layer: Handles user interface and user input.
Business logic layer: Implements the BLoC pattern and handles application state.
Data layer: Handles data fetching and storage.
License
This weather application is licensed under the MIT License. See the LICENSE file for more information.

Contributors
Your Name - Okwor Chukwuemeka Nnajiofor
Acknowledgments
OpenWeatherMap - Weather API
Flutter - UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.


