import 'package:bloc_tutorial/data/models/weather_model.dart';
import 'package:bloc_tutorial/data/providers/weather_provider.dart';

class WeatherRepository {
  Future<WeatherModel> getWeather(String city) async {
    WeatherProvider provider = WeatherProvider();
    final weatherData = await provider.getWeatherData(city);
    final WeatherModel weather = WeatherModel.fromJson(weatherData);
    print(weather.temp);
    return weather;
  }
}
