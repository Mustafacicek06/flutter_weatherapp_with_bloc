import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weatherapp_with_bloc/data/weather_repository.dart';
import 'package:flutter_weatherapp_with_bloc/locator.dart';
import 'package:flutter_weatherapp_with_bloc/models/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  // locator içinde kaydettigim sınıf nesnesini gitti buraya getirdi.
  final WeatherRepository weatherRepository = locator<WeatherRepository>();

  WeatherBloc() : super(WeatherInitialState()) {
    on<WeatherEvent>((event, emit) async {
      debugPrint('FetcWeatherEvent dışı');

      if (event is FetchWeatherEvent) {
        debugPrint('FetcWeatherEvent içindeyim');
        emit(WeatherLoadingState());
        debugPrint('loadingi geçtim ');

        try {
          // hava durumu burada getirme kodları
          //bir sınıfın içinde baska bir sınıftan nesne üretmek iyi bir sey değildir.
          // bunlar artık birbirine bağımlı hale gelmiştir.
          debugPrint('try catch içindeyim');

          final WeatherApi? getirilenWeather =
              await weatherRepository.getWeatherApi(event.sehirAdi);
          debugPrint(' weather api succes');

          emit(WeatherLoadedState(weatherApi: getirilenWeather!));
          debugPrint('weatherloaded state i geçtim');
        } catch (e) {
          emit(WeatherErorState());
        }
      } else if (event is RefreshWeatherEvent) {
        try {
          // hava durumu burada getirme kodları
          //bir sınıfın içinde baska bir sınıftan nesne üretmek iyi bir sey değildir.
          // bunlar artık birbirine bağımlı hale gelmiştir.
          debugPrint('try catch içindeyim');

          final WeatherApi? getirilenWeather =
              await weatherRepository.getWeatherApi(event.sehirAdi);
          debugPrint(' weather api succes');

          emit(WeatherLoadedState(weatherApi: getirilenWeather!));
          debugPrint('weatherloaded state i geçtim');
        } catch (e) {
          debugPrint('catch içindeyim');

          onTransition(Transition(
              currentState: state,
              nextState: state,
              event: FetchWeatherEvent(sehirAdi: event.sehirAdi)));
        }
      }
    });
  }
}
