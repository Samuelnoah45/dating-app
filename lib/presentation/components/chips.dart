import 'package:dating/configs/colors_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// A widget that displays a chip with a name and a bool value(isLove).
/// The width of the widget is defined by [widthValue].
///
/// The widget is a container with a padding of 8 on the left and right, and 8 on the top and bottom.
/// The background color of the widget is defined by [isLove] value. If [isLove] is true, the background color is #621133,
/// otherwise the background color is [primaryBlackLight].
///
/// The widget has a border with a width of 1 and a color defined by [isLove] value. If [isLove] is true, the border color is [primaryColor],
/// otherwise the border color is #3A3A3A.
///
/// The widget has a child row with a text widget that displays the name of the chip.
/// The text color of the text widget is defined by [isLove] value. If [isLove] is true, the text color is [primaryColor],
/// otherwise the text color is white.
class Chips extends StatefulWidget {
  const Chips(
      {super.key,
      required this.name,
      required this.isLove,
      required this.widthValue});
  final String name;
  final bool isLove;
  final double widthValue;
  @override
  // ignore: library_private_types_in_public_api
  _ChipsState createState() => _ChipsState();
}

class _ChipsState extends State<Chips> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // The width of the widget
      width: widget.widthValue.toDouble(),
      // The padding of the widget
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      // The decoration of the widget
      decoration: BoxDecoration(
        // The border radius of the widget
        borderRadius: BorderRadius.circular(100),
        // The border of the widget
        border: Border.all(
            // The color of the border
            color: widget.isLove ? primaryColor : const Color(0Xff3A3A3A),
            // The width of the border
            width: 1),
        // The color of the widget
        color: widget.isLove ? const Color(0Xff621133) : primaryBlackLight,
      ),
      // The child of the widget
      child: Row(
        // The children of the row
        children: [
          Text(
            // The text to display
            widget.name,
            // The style of the text
            style: TextStyle(
                // The color of the text
                color: widget.isLove ? primaryColor : Colors.white),
          )
        ],
      ),
    );
  }
}
