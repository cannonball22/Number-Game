import '../../../src/event_base.dart';

abstract class GameStatusEvent extends BaseBlocEvent {}

class GameStartedEvent extends GameStatusEvent {
  GameStartedEvent();
}

class GameFinishedEvent extends GameStatusEvent {
  GameFinishedEvent();
}
