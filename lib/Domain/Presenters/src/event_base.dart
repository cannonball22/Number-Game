import 'package:equatable/equatable.dart';

class BaseBlocEvent extends Equatable {
  final List<Object?>? properties;
  const BaseBlocEvent({this.properties});
  @override
  List<Object?> get props => properties ?? [];
}