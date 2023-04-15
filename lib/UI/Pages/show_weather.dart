import 'package:bloc_tutorial/data/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:bloc_tutorial/bloc/weather_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowWeather extends StatefulWidget {
  WeatherModel? weather;
  final String? city;
  ShowWeather({super.key, this.weather, this.city});

  @override
  State<ShowWeather> createState() => _ShowWeatherState();
}

class _ShowWeatherState extends State<ShowWeather> {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBlocBloc>(context);
    return ListView(children: [
      Image.asset("assets/images/planet.jpg"),
      Text(
        "${widget.city}",
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 50,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const Text(
                "Temperature",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                " ${widget.weather!.temp.ceil()}°C",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
          Column(
            children: [
              const Text(
                "Pressure",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                " ${widget.weather!.pressure.floor()}",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
        ],
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40),
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
          ))
    ]);
  }
}
