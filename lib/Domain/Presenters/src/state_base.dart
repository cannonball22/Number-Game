import 'package:equatable/equatable.dart';

abstract class BaseBlocState extends Equatable {
  final List<Object?>? properties;
  const BaseBlocState({this.properties});
  @override
  List<Object?> get props => properties ?? [];
}

//t2 ------------- Uninitialized/Initial State
class InitialBlocState extends BaseBlocState {
  const InitialBlocState();
}

//t2 -----------------------------------------
//
//t2 ------------- Loading State
class LoadingBlocState extends BaseBlocState {
  const LoadingBlocState();
}

//t2 -----------------------------------------
//
//t2 ------------- Error State
class ErrorBlocState extends BaseBlocState {
  final dynamic error;
  final dynamic stackTrace;
  final List<Object?>? propers;

  const ErrorBlocState({this.error, this.stackTrace, this.propers})
      : super(properties: propers);
}

//t2 -----------------------------------------
//
//t2 ------------- Loaded State
class LoadedBlocState<T> extends BaseBlocState {
  final T data;
  final List<Object?>? propers;
  const LoadedBlocState({required this.data, this.propers})
      : super(properties: propers);
}
//t2 -----------------------------------------