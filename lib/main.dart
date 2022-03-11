import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/bloc/weather_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/tema/bloc/tema_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/locator.dart';
import 'package:flutter_weatherapp_with_bloc/widgets/weather_app.dart';

void main() {
  setupLocator();
  runApp(BlocProvider<TemaBloc>(
      lazy: false, create: (context) => TemaBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<TemaBloc>(context),
      builder: (context, TemaState state) => MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: (state as UygulamaTemasi).themeData,
        color: state.renk,
        home: BlocProvider<WeatherBloc>(
            lazy: true,
            create: (context) => WeatherBloc(),
            child: WeatherApp()),
      ),
    );
  }
}
