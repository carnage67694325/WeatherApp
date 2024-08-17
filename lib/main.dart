import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              return MaterialApp(
                theme: ThemeData(
                  primarySwatch: getWeatherColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition),
                  useMaterial3: false,
                ),
                home: const HomeView(),
              );
            },
          ),
        ));
  }
}

MaterialColor getWeatherColor(String? weatherCondition) {
  if (weatherCondition == null) {
    return Colors.blue;
  }
  switch (weatherCondition) {
    case "Sunny":
      return Colors.yellow;
    case "Partly cloudy":
      return Colors.blueGrey;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
      return Colors.blueGrey;
    case "Mist":
      return Colors.lightBlue;
    case "Patchy rain possible":
      return Colors.blue;
    case "Patchy snow possible":
      return Colors.lightBlue;
    case "Patchy sleet possible":
      return Colors.green;
    case "Patchy freezing drizzle possible":
      return Colors.lightBlue;
    case "Thundery outbreaks possible":
      return Colors.deepPurple;
    case "Blowing snow":
      return Colors.blueGrey;
    case "Blizzard":
      return Colors.blue;
    case "Fog":
      return Colors.grey;
    case "Freezing fog":
      return Colors.lightBlue;
    case "Patchy light drizzle":
      return Colors.blueGrey;
    case "Light drizzle":
      return Colors.blueGrey;
    case "Freezing drizzle":
      return Colors.lightBlue;
    case "Heavy freezing drizzle":
      return Colors.lightBlue;
    case "Patchy light rain":
      return Colors.blue;
    case "Light rain":
      return Colors.blue;
    case "Moderate rain at times":
      return Colors.blueGrey;
    case "Moderate rain":
      return Colors.blueGrey;
    case "Heavy rain at times":
      return Colors.indigo;
    case "Heavy rain":
      return Colors.indigo;
    case "Light freezing rain":
      return Colors.lightBlue;
    case "Moderate or heavy freezing rain":
      return Colors.blue;
    case "Light sleet":
      return Colors.green;
    case "Moderate or heavy sleet":
      return Colors.green;
    case "Patchy light snow":
      return Colors.lightBlue;
    case "Light snow":
      return Colors.lightBlue;
    case "Patchy moderate snow":
      return Colors.blue;
    case "Moderate snow":
      return Colors.blue;
    case "Patchy heavy snow":
      return Colors.blueGrey;
    case "Heavy snow":
      return Colors.blueGrey;
    case "Ice pellets":
      return Colors.lightBlue;
    case "Light rain shower":
      return Colors.blue;
    case "Moderate or heavy rain shower":
      return Colors.blue;
    case "Torrential rain shower":
      return Colors.indigo;
    case "Light sleet showers":
      return Colors.green;
    case "Moderate or heavy sleet showers":
      return Colors.green;
    case "Light snow showers":
      return Colors.lightBlue;
    case "Moderate or heavy snow showers":
      return Colors.blue;
    case "Light showers of ice pellets":
      return Colors.lightBlue;
    case "Moderate or heavy showers of ice pellets":
      return Colors.blue;
    case "Patchy light rain with thunder":
      return Colors.deepPurple;
    case "Moderate or heavy rain with thunder":
      return Colors.deepPurple;
    case "Patchy light snow with thunder":
      return Colors.lightBlue;
    case "Moderate or heavy snow with thunder":
      return Colors.blue;
    default:
      return Colors.grey; // Default color for undefined weather conditions
  }
}
