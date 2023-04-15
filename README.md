Chat Application
This is a chat application that allows users to communicate with each other in real-time. The application uses the OpenWeatherMap API to display weather information for the user's location.

Getting Started
To get started with the application, follow these steps:

Clone the repository to your local machine.
Open the project in your preferred IDE.
Run flutter pub get to install the necessary dependencies.
Add your OpenWeatherMap API key to the lib/config.dart file.
Run the application using flutter run.
Features
The chat application has the following features:

Real-time messaging using the Firebase Cloud Messaging service.
Display of weather information using the OpenWeatherMap API.
User authentication and registration using Firebase Authentication.
State management using the BLoC pattern and the flutter_bloc library.
Libraries Used
The following libraries were used in the development of the chat application:

flutter_bloc: For implementing the BLoC pattern and managing application state.
firebase_messaging: For handling push notifications and messaging.
firebase_auth: For user authentication and registration.
http: For making HTTP requests to the OpenWeatherMap API.
Architecture
The chat application follows the BLoC architecture pattern, which separates the application into three layers:

Presentation layer: Handles user interface and user input.
Business logic layer: Implements the BLoC pattern and handles application state.
Data layer: Handles data fetching and storage.
License
This chat application is licensed under the MIT License. See the LICENSE file for more information.

Contributors
Your Name - Developer
Acknowledgments
OpenWeatherMap - Weather API
Flutter - UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
