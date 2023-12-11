import '../../../src/state_base.dart';

abstract class GameStatusState<T> extends BaseBlocState {
  final T? data;

  const GameStatusState({this.data});

  @override
  List<Object> get props => [];
}

class LoadingGameState extends GameStatusState {
  const LoadingGameState();
}

class GameViewState extends GameStatusState {
  const GameViewState();
}

class ErrorTripStatusState extends GameStatusState {
  final dynamic error;
  final dynamic stackTrace;
  final List<Object?>? propers;

  const ErrorTripStatusState({this.error, this.stackTrace, this.propers});
}
