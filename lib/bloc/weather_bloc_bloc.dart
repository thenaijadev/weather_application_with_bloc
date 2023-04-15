import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/data/models/weather_model.dart';
import 'package:bloc_tutorial/data/repository/weather_repository.dart';
import 'package:equatable/equatable.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherRepository weatherRepo;

  WeatherBlocBloc(this.weatherRepo) : super(WeatherIsNotSearchedState()) {
    on<WeatherBlocEvent>((event, emit) async {
      if (event is FetchWeatherEvent) {
        emit(WeatherIsLoadingState());
        try {
          WeatherModel weather = await weatherRepo.getWeather(event._city);

          emit(WeatherIsLoadedState(weather));
        } catch (error) {
          emit(WeatherIsNotLoadedState());
        }
      } else if (event is ResetWeatherEvent) {
        emit(WeatherIsNotSearchedState());
      }
    });
  }

  // Stream<WeatherBlocState> mapEventToState(WeatherBlocEvent event) async* {
  //   if (event is FetchWeatherEvent) {
  //     yield WeatherIsLoadingState();

  //     try {
  //       WeatherModel weather = await weatherRepo.getWeather(event._city);

  //       yield WeatherIsLoadedState(weather);
  //     } catch (error) {
  //       yield WeatherIsNotLoadedState();
  //     }
  //   } else if (event is ResetWeatherEvent) {
  //     yield WeatherIsNotSearchedState();
  //   }
  // }
}
