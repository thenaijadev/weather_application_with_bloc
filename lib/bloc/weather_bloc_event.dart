part of 'weather_bloc_bloc.dart';

abstract class WeatherBlocEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherBlocEvent {
  FetchWeatherEvent(this._city);

  final String _city;
  @override
  List<Object> get props => [_city];
}

class ResetWeatherEvent extends WeatherBlocEvent {}

class UpdateCityWeatherEvent extends WeatherBlocEvent {}
