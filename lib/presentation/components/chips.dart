import 'package:dating/configs/colors_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      width: widget.widthValue.toDouble(),
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
            color: widget.isLove ? primaryColor : const Color(0Xff3A3A3A),
            width: 1),
        color: widget.isLove ? const Color(0Xff621133) : primaryBlackLight,
      ),
      child: Row(
        children: [
          Text(
            widget.name,
            style:
                TextStyle(color: widget.isLove ? primaryColor : Colors.white),
          )
        ],
      ),
    );
  }
}
