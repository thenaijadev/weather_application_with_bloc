class WeatherModel {
  final double temp;
  final int humidity;
  final int pressure;
  final double tempMax;
  final double tempMin;

  // double get getTemp => temp - 272.5;
  // double get getMaxTemp => tempMax - 272.5;
  // double get getMinTemp => tempMin - 272.5;

  WeatherModel({
    required this.temp,
    required this.humidity,
    required this.tempMax,
    required this.tempMin,
    required this.pressure,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: json['temp'],
      humidity: json['humidity'],
      tempMax: json['temp_max'] - 272.5,
      tempMin: json['temp_min'] - 272.5,
      pressure: json['pressure'],
    );
  }
}
