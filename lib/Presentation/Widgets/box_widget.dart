//t2 Core Packages Imports
import 'package:flutter/material.dart';
import 'package:number_gussing_game/Data/Models/Shared/happy_box_color.dart';

import '../../Data/Models/Numbers/numbers_data.dart';
import '../../Data/Models/Shared/closed_box_color.dart';

//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports
class BoxWidget extends StatefulWidget {
  //SECTION - Widget Arguments
  //!SECTION
  //
  final ClosedBoxColor closedBoxColor;
  final HappyBoxColor happyBoxColor;
  final int number;
  final void Function(bool hide) showNumberCallback;

  // final
  const BoxWidget({
    Key? key,
    required this.closedBoxColor,
    required this.happyBoxColor,
    required this.number,
    required this.showNumberCallback,
  }) : super(
          key: key,
        );

  @override
  State<BoxWidget> createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  bool success = false;

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

    return success
        ? SizedBox(
            height: 130,
            width: 106,
            child: Image.asset(
              widget.happyBoxColor.color,
            ),
          )
        : DragTarget<int>(
            builder: (context, candidateData, rejectedData) => SizedBox(
                  height: 130,
                  width: 106,
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.closedBoxColor.color,
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 44,
                        child: SizedBox(
                          height: 62,
                          width: 72,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Image.asset(
                                allNumbers[widget.number - 1].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            onWillAccept: (data) => true,
            onAccept: (data) {
              if (data == widget.number) {
                setState(() {
                  success = true;
                });
                widget.showNumberCallback(false);
              }
              // to be implemented
              // else {}
            });
    //!SECTION
  }
}
