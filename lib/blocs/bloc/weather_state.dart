part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  late final WeatherApi weatherApi;

  // ignore: prefer_const_constructors_in_immutables
  // super kullanımı weather apinin gelen api ile eslesip eslenmedigini
  // kontrol etmek amaclıdır.
  WeatherLoadedState({required this.weatherApi}) : super();
}

class WeatherErorState extends WeatherState {}
