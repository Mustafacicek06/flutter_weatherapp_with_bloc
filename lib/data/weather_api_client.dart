import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weatherapp_with_bloc/models/weather.dart';

class WeatherApiClient {
  static const baseUrl = "https://www.metaweather.com";

  Future<int> getLocationID(String sehirAdi) async {
    //final sehirUrl = "${baseUrl}/api/location/search/?query=$sehirAdi";

    //var url = Uri.http(baseUrl, sehirUrl);

    // var response = await httpClient.get(url);
    // var url1 = Uri.parse(
    //     'https://www.metaweather.com/api/location/search/?query=' + sehirAdi);

    // var response = await http.post(url1);
    // var response = await httpClient
    //     .post(Uri.https(baseUrl, 'location/search/?query' + sehirAdi));

    // await httpClient.get();
    var response = await Dio().get(
        'https://www.metaweather.com/api/location/search/?query=' + sehirAdi);
    debugPrint(response.statusCode.toString() + 'getLocation');

    if (response.statusCode != 200) {
      throw Exception("Api cannot connected");
    }
    // burada dedigimiz şey getirdigin veri aslında bir liste
    debugPrint((response.data as List)[0]['woeid'].toString());
    // dioda böyle bi zorunluluk yok zaten bize dönüştürdü.
    // final responceJSON = jsonDecode(response.data);
    return (response.data as List)[0]['woeid'];
  }

  Future<WeatherApi> getWeather(int sehirID) async {
    // var havaDurumuUrl = "https://www.metaweather.com/api/location/$sehirID/";
    //var urlHava = Uri.http(baseUrl, havaDurumuUrl);
    //debugPrint("Hava durumu bağlantısı yok");
    // var responseHava = await httpClient.get(urlHava);

    // var url = Uri.parse(
    //     'https://www.metaweather.com/api/location/' + sehirID.toString() + '/');

    // var response = await http.post(url);

    var response =
        await Dio().get('https://www.metaweather.com/api/location/$sehirID/');

    debugPrint(response.statusCode.toString() + 'getWeat');

    if (response.statusCode != 200) {
      debugPrint("Hava durumu getirilemedi");
      throw Exception("Hava durumu getirilemedi");
    }
    // burada dedigimiz şey getirdigin veri aslında bir liste

    return WeatherApi.fromJson(response.data);
  }
}
