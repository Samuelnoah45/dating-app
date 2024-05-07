import 'package:flutter/material.dart';

class DatingData {
  final String name;
  final String image;
  final String description;
  final List<Widget> chips;

  DatingData({
    required this.name,
    required this.image,
    required this.description,
    required this.chips,
  });
}
