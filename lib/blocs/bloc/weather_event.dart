part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherEvent {
  late final String sehirAdi;

  // mesela 1 kere ankara sehrini istedin sen ve getirildi
  // ardına 1 kere daha ankara'yı istedin ve burda geldi kontrol etti
  // veriyi tekrar yeniden getirmez ve kolaylık sağlar
  FetchWeatherEvent({required this.sehirAdi}) : super();
}

class RefreshWeatherEvent extends WeatherEvent {
  late final String sehirAdi;

  // mesela 1 kere ankara sehrini istedin sen ve getirildi
  // ardına 1 kere daha ankara'yı istedin ve burda geldi kontrol etti
  // veriyi tekrar yeniden getirmez ve kolaylık sağlar
  RefreshWeatherEvent({required this.sehirAdi}) : super();
}
