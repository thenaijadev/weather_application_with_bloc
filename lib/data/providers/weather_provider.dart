import 'dart:convert';

import 'package:bloc_tutorial/data/repository/location_repository.dart';
import 'package:http/http.dart' as http;

class WeatherProvider {
  Future<Map<String, dynamic>> getWeatherData(String? city) async {
    final locationRepo = LocationRepository();
    final location = await locationRepo.getLocation(city!);
    final lat = location.lat;
    final lon = location.lon;
    print({"lat": lat, "lon": lon});
    var url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=68460aac14c8c61f6def6315d7ef13af&units=metric',
    );
    var response = await http.Client().get(
      url,
    );

    if (response.statusCode == 200) {
      final arr = jsonDecode(response.body);
      final weatherData = arr["main"];
      print(weatherData);
      return weatherData;
    } else {
      print(response.statusCode);
      throw Exception();
    }
  }
}
