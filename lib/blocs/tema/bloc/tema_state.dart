part of 'tema_bloc.dart';

abstract class TemaState extends Equatable {
  const TemaState();

  @override
  List<Object> get props => [];
}

class UygulamaTemasi extends TemaState {
  // Tüm UI widgetlerimize bu bilgiyi vermemiz lazım.
  final ThemeData themeData;
  final MaterialColor renk;

  UygulamaTemasi({required this.themeData, required this.renk}) : super();
}
