import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/bloc/weather_bloc.dart';

class SonGuncellemeWidget extends StatelessWidget {
  const SonGuncellemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return BlocBuilder(
        bloc: _weatherBloc,
        builder: (context, WeatherState state) {
          var newDate = DateTime.now().hour;
          var newDate2 = DateTime.now().minute;

          return Text(
            'Son Guncelleme : ' +
                newDate.toString() +
                ':' +
                newDate2.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          );
        });
  }
}
