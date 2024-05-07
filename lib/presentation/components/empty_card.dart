import 'package:dating/configs/colors_config.dart';
import 'package:dating/data/models/dating_card_data.dart';
import 'package:dating/presentation/components/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class EmptyCard extends StatefulWidget {
  const EmptyCard({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _EmptyCardState createState() => _EmptyCardState();
}

class _EmptyCardState extends State<EmptyCard> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "추천 드릴 친구들을 준비 중이에요",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          Text(
            "매일 새로운 친구들을 소개시켜드려요",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
