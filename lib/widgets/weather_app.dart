import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/bloc/weather_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs/tema/bloc/tema_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/widgets/gecisli_arkaplan_renk.dart';
import 'package:flutter_weatherapp_with_bloc/widgets/hava_durumu_resim.dart';
import 'package:flutter_weatherapp_with_bloc/widgets/last_update.dart';
import 'package:flutter_weatherapp_with_bloc/widgets/location.dart';
import 'package:flutter_weatherapp_with_bloc/widgets/max_min_sicaklik.dart';
import 'package:flutter_weatherapp_with_bloc/widgets/sehir_serc.dart';

class WeatherApp extends StatelessWidget {
  WeatherApp({Key? key}) : super(key: key);
  String secilenSehir = '';
  @override
  Widget build(BuildContext context) {
    // final _weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        // appbar'ın içerisine koyduğun şeyler actions'ın içinde tanımlanır.

        actions: [
          IconButton(
              onPressed: () async {
                secilenSehir =
                    await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SehirSec(),
                ));
                if (secilenSehir != null) {
                  context
                      .read<WeatherBloc>()
                      .add(FetchWeatherEvent(sehirAdi: secilenSehir));
                }
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Center(
        child:
            BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          if (state is WeatherInitialState) {
            print('WeatherInitialState calisti');
            return Center(
              child: Text('Sehir Seciniz'),
            );
          }
          if (state is WeatherLoadingState) {
            print('WeatherLoadingState calisti');
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is WeatherLoadedState) {
            final getirilenWeather = state.weatherApi;
            // final _temaBloc = BlocProvider.of<TemaBloc>(context);
            final _havadurumKisaltmasi =
                getirilenWeather.consolidatedWeather![0].weatherStateAbbr;

            //context.read<TemaBloc>().add(
            //  TemaDegistirEvent(havaDurumuKisaltmasi: _havadurumKisaltmasi!));

            BlocProvider.of<TemaBloc>(context).add(
                TemaDegistirEvent(havaDurumuKisaltmasi: _havadurumKisaltmasi!));
            debugPrint(_havadurumKisaltmasi + ' Hava durumu kısaltması');

            // bugunun verileri
            //getirilenWeather.consolidatedWeather[0].;
            return BlocBuilder(
              bloc: BlocProvider.of<TemaBloc>(context),
              builder: (context, TemaState temaState) => GecisliRenkContainer(
                renk: (temaState as UygulamaTemasi).renk,
                child: RefreshIndicator(
                  onRefresh: () async {
                    context
                        .read<WeatherBloc>()
                        .add(FetchWeatherEvent(sehirAdi: secilenSehir));
                  },
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: LocationWidget(
                          secilenSehir: getirilenWeather.title!,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: SonGuncellemeWidget()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: HavaDurumuResimWidget()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: MaxVeMinSicaklik()),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Text('WeatherErorState  ');
          }
        }),
      ),
    );
  }
}
