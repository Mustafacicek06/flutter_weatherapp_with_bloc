import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/bloc/weather_bloc.dart';

class MaxVeMinSicaklik extends StatelessWidget {
  const MaxVeMinSicaklik({Key? key}) : super(key: key);

  // birden fazla bloc'un olabilir o yüzden yaz bunu

  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    // PROVİDER getirmeye yarar
    // kullanmak için ise blocBuilder tanımlaman gerekir.
    return BlocBuilder(
      bloc: _weatherBloc,
      builder: (context, WeatherState state) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // type casting yapmamız gerekir doğrudan state.weather e ulasamyız
          // o yüzden bize gelen LoadedState oldugunu bildiğimiz için onu kullanmamız gerekir.
          Text(
            'Maximum : ' +
                (state as WeatherLoadedState)
                    .weatherApi
                    .consolidatedWeather![0]
                    .maxTemp!
                    .floor()
                    .toString() +
                // (state as WeatherApi)
                '°C ' +
                'Minimum : ' +
                (state as WeatherLoadedState)
                    .weatherApi
                    .consolidatedWeather![0]
                    .minTemp!
                    .floor()
                    .toString() +
                '°C ',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
