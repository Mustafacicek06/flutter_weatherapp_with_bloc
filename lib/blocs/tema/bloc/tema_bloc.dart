import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tema_event.dart';
part 'tema_state.dart';

class TemaBloc extends Bloc<TemaEvent, TemaState> {
  TemaBloc()
      : super(UygulamaTemasi(themeData: ThemeData.light(), renk: Colors.blue)) {
    on<TemaEvent>((event, emit) {
      // geriye sürekli uygulama temasi donduren stream
      // bende ıcerıde boyle bır sey dondurmem gerekıyor.
      UygulamaTemasi? uygulamaTemasi;
      if (event is TemaDegistirEvent) {
        switch (event.havaDurumuKisaltmasi) {
          case "sn": // karlı
          case "sl": // veya sulu kar ıse
          case "h": // veya dolu ıse
          case "t": // fırtına
          case "hc": // cok bulutlu
            uygulamaTemasi = UygulamaTemasi(
                themeData: ThemeData(primaryColor: Colors.blueGrey),
                renk: Colors.grey);
            break;

          case "hr": // agir yağmurlu
          case "lr": // hafif yağmurlu
          case "s": // sağanak yağıs
            uygulamaTemasi = UygulamaTemasi(
                themeData: ThemeData(primaryColor: Colors.indigoAccent),
                renk: Colors.indigo);
            break;
          case "lc": // az bulutlu
          case "c": // acik günesli
            uygulamaTemasi = UygulamaTemasi(
                themeData: ThemeData(primaryColor: Colors.orangeAccent),
                renk: Colors.yellow);
            break;
        }
      }
      // on bizim geriye bir sey dondurmemizi isityoru ve bizde uygulama temeasini
      // emit ile geriye donduruyoruz.

      emit(uygulamaTemasi!);
    });
  }
}
