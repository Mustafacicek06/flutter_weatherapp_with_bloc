part of 'tema_bloc.dart';

abstract class TemaEvent extends Equatable {
  const TemaEvent();

  @override
  List<Object> get props => [];
}

class TemaDegistirEvent extends TemaEvent {
  final String? havaDurumuKisaltmasi;

  // birden fazla tema degistir eventini birbirinden ayıracak super
  TemaDegistirEvent({required this.havaDurumuKisaltmasi}) : super();
}
