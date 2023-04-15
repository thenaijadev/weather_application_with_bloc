import 'package:bloc_tutorial/bloc/weather_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'show_weather.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String city = "";
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBlocBloc>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
        builder: (context, state) {
          if (state is WeatherIsNotSearchedState) {
            return ListView(
              children: [
                Image.asset("assets/images/planet.jpg"),
                const Text(
                  "Fetch weather data instantly!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {
                      city = value;
                    },
                    decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.white),
                      contentPadding: const EdgeInsets.all(20),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      hintText: "City Name:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color.fromARGB(255, 35, 0, 105),
                      ),
                    ),
                    onPressed: () {
                      if (city.isNotEmpty) {
                        weatherBloc.add(FetchWeatherEvent(city));
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      child: Text(
                        "Fetch Data",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            );
          } else if (state is WeatherIsLoadingState) {
            return const Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitRotatingCircle(
                      color: Color.fromARGB(255, 35, 0, 105),
                      size: 50.0,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Fetching  weather data....",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ]),
            );
          } else if (state is WeatherIsLoadedState) {
            return ShowWeather(weather: state.getWeather, city: city);
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "There is an error",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => const Color.fromARGB(255, 35, 0, 105),
                    ),
                  ),
                  onPressed: () {
                    weatherBloc.add(ResetWeatherEvent());
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    child: Text(
                      "Fetch for another city",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
