import 'package:dating/configs/colors_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Steps extends StatefulWidget {
  const Steps({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  // ignore: library_private_types_in_public_api
  _StepsState createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        children: [
          for (int i = 0; i < 5; i++) ...[
            Expanded(
                child: Container(
              height: 4,
              decoration: BoxDecoration(
                  color: i != widget.currentIndex
                      ? primaryBlackLight
                      : primaryColor,
                  borderRadius: BorderRadius.circular(6)),
            )),
            const SizedBox(width: 4)
          ]
        ],
      ),
    );
  }
}
