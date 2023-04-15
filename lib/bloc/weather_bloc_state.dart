part of 'weather_bloc_bloc.dart';

abstract class WeatherBlocState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherBlocInitial extends WeatherBlocState {}

class WeatherIsNotSearchedState extends WeatherBlocState {}

class WeatherIsLoadingState extends WeatherBlocState {}

class WeatherIsNotLoadedState extends WeatherBlocState {}

class WeatherIsLoadedState extends WeatherBlocState {
  final WeatherModel _weather;
  WeatherIsLoadedState(this._weather);
  WeatherModel get getWeather => _weather;
  @override
  List<Object> get props => [_weather];
}
