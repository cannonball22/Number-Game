//t2 Core Packages Imports
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../../Data/Models/Numbers With Background/numbers_with_backround_data.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports
class DraggableNumberWidget extends StatefulWidget {
  //SECTION - Widget Arguments
  final int number;

  //!SECTION
  //
  const DraggableNumberWidget({
    required this.number,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<DraggableNumberWidget> createState() => _DraggableNumberWidgetState();
}

class _DraggableNumberWidgetState extends State<DraggableNumberWidget> {
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
    final player = AudioPlayer();

    //SECTION - Build Return
    return Draggable<int>(
      onDragStarted: () {
        player.play(
            AssetSource(allNumberWithBackground[widget.number - 1].sound));
      },
      data: widget.number,
      feedback: Container(
        height: 100,
        width: 97.2,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(allNumberWithBackground[widget.number - 1].image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      childWhenDragging: const SizedBox(
        height: 100,
        width: 97.2,
      ),
      child: Container(
        height: 100,
        width: 97.2,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(allNumberWithBackground[widget.number - 1].image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
    //!SECTION
  }
}
