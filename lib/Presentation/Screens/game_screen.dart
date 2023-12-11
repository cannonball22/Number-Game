//t2 Core Packages Imports
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Data/Models/Shared/closed_box_color.dart';
import '../../Data/Models/Shared/happy_box_color.dart';
import '../../Domain/Presenters/Blocs/Game Bloc/game_status.bloc.dart';
import '../../Domain/Services/Random Number Generator/random_number_generator_service.dart';
import '../Widgets/box_widget.dart';
import '../Widgets/draggable_number.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports
class GameScreen extends StatefulWidget {
  //SECTION - Widget Arguments
  //!SECTION
  //
  const GameScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  //
  //SECTION - State Variables
  //t2 --Controllers
  //t2 --Controllers
  //
  //t2 --State
  //t2 --State
  //
  //t2 --Constants
  //t2 --Constants
  //!SECTION
  late List<int> numbersList;
  late List<bool> boolList;
  List<int> indexList = [0, 1, 2];

  @override
  void initState() {
    super.initState();
    //
    //SECTION - State Variables initializations & Listeners
    //t2 --Controllers & Listeners
    //t2 --Controllers & Listeners
    //
    startNewGame();

    //t2 --State
    //t2 --State
    //
    //t2 --Late & Async Initializers
    //t2 --Late & Async Initializers
    //!SECTION
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //
    //SECTION - State Variables initializations & Listeners
    //t2 --State
    //t2 --State
    //!SECTION
  }

  //SECTION - Stateless functions
  //!SECTION
  void startNewGame() {
    numbersList = generateRandomNumbers(20);
    indexList.shuffle();
    boolList = [true, true, true];
  }

  void isGameFinished() {
    if (!boolList.contains(true)) {
      context.read<GameStatusBloc>().add(GameFinishedEvent());
      Future.delayed(const Duration(seconds: 3), () {
        context.read<GameStatusBloc>().add(GameStartedEvent());
        startNewGame();
      });
    }
  }

  //SECTION - Action Callbacks
  //!SECTION

  @override
  Widget build(BuildContext context) {
    //SECTION - Build Setup
    //t2 -Values
    //double w = MediaQuery.of(context).size.width;
    //double h = MediaQuery.of(context).size.height;
    //t2 -Values
    //
    //t2 -Widgets
    //t2 -Widgets
    //!SECTION

    //SECTION - Build Return
    return Scaffold(
      // Background image
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.webp"),
            fit: BoxFit.fill,
          ),
        ),
        child: BlocBuilder<GameStatusBloc, GameStatusState>(
            bloc: context.read<GameStatusBloc>(),
            builder: (context, state) {
              if (state is GameViewState) {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            boolList[0]
                                ? DraggableNumberWidget(number: numbersList[0])
                                : const SizedBox(
                                    height: 100,
                                    width: 97.2,
                                  ),
                            boolList[1]
                                ? DraggableNumberWidget(number: numbersList[1])
                                : const SizedBox(
                                    height: 100,
                                    width: 97.2,
                                  ),
                            boolList[2]
                                ? DraggableNumberWidget(number: numbersList[2])
                                : const SizedBox(
                                    height: 100,
                                    width: 97.2,
                                  ),
                          ],
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BoxWidget(
                              closedBoxColor: ClosedBoxColor.blue,
                              happyBoxColor: HappyBoxColor.blue,
                              number: numbersList[indexList[0]],
                              showNumberCallback: (hide) {
                                setState(() {
                                  boolList[indexList[0]] = false;
                                });
                                isGameFinished();
                              },
                            ),
                            BoxWidget(
                              closedBoxColor: ClosedBoxColor.purple,
                              happyBoxColor: HappyBoxColor.purple,
                              number: numbersList[indexList[1]],
                              showNumberCallback: (hide) {
                                setState(() {
                                  boolList[indexList[1]] = false;
                                });
                                isGameFinished();
                              },
                            ),
                            BoxWidget(
                              closedBoxColor: ClosedBoxColor.green,
                              happyBoxColor: HappyBoxColor.green,
                              number: numbersList[indexList[2]],
                              showNumberCallback: (hide) {
                                setState(() {
                                  boolList[indexList[2]] = false;
                                });
                                isGameFinished();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                  child: Container(
                    child: Lottie.asset('assets/animations/congrats.json'),
                  ),
                );
              }
            }),
      ),
    );
    //!SECTION
  }

  @override
  void dispose() {
    //SECTION - Disposable variables
    //!SECTION
    super.dispose();
  }
}
