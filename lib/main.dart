import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Domain/Presenters/Blocs/Game Bloc/game_status.bloc.dart';
import 'Presentation/Screens/game_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
  ]);
  final player = AudioPlayer();
  //
  await player.play(AssetSource('sounds/instructions_audio.mp3'));
  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
          providers: [
            BlocProvider<GameStatusBloc>(
              create: (_) => GameStatusBloc(),
            ),
          ],
          child: const GameScreen()),
    );
  }
}
