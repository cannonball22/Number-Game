import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/exports.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

export 'src/exports.dart';

class GameStatusBloc extends Bloc<GameStatusEvent, GameStatusState> {
  //
  //
  GameStatusBloc() : super(const GameViewState()) {
    //--
    on<GameStartedEvent>((event, emit) async {
      emit(const GameViewState());
    });
    //--
    on<GameFinishedEvent>((event, emit) async {
      emit(const LoadingGameState());
    });
  }
}
