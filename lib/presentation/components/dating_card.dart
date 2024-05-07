import 'package:dating/configs/colors_config.dart';
import 'package:dating/data/models/dating_card_data.dart';
import 'package:dating/presentation/components/step_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class DatingCard extends StatefulWidget {
  const DatingCard({super.key, required this.index, required this.data});
  final int index;
  final DatingData data;

  @override
  // ignore: library_private_types_in_public_api
  _DatingCardState createState() => _DatingCardState();
}

class _DatingCardState extends State<DatingCard> {
  @override
  Widget build(BuildContext context) {
    return widget.data.name != ""
        ? Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.data.image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      Steps(currentIndex: widget.index)
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter, // Start from the top center
                        end: Alignment.bottomCenter, // End at the bottom center
                        colors: [
                          const Color.fromARGB(255, 99, 99, 99)
                              .withOpacity(0.0),
                          Colors.black.withOpacity(
                              0.5), // Make white color fully transparent
                          Colors.black.withOpacity(
                              0.9), // Make black color semi-transparent
                        ], // Add your desired colors
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxWidth: 100),
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, top: 6, bottom: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border:
                                Border.all(color: primaryBlackLight, width: 1),
                            color: Colors.black,
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/star3.svg',
                                width: 16,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              const Text("323,233")
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        widget.data.name,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      const Text(
                                        "25",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          widget.data.description,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                    ],
                                  ),
                                  Wrap(
                                    spacing: 8, // Spacing between chips
                                    runSpacing: 6,
                                    children: [
                                      for (final chip in widget.data.chips) ...[
                                        chip,
                                      ],
                                      const SizedBox(
                                        width: 4,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Stack(
                              children: [
                                // White container
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100)),

                                  child: ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback: (Rect bounds) {
                                      return LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [gradientGreen, gradientPurple],
                                      ).createShader(bounds);
                                    },
                                    child: const Icon(Icons.favorite,
                                        size: 30, color: Colors.white),
                                  ),
                                  // color: Colors.white,
                                ),
                                // Gradient border
                                CustomPaint(
                                  size: const Size(50, 50),
                                  painter: GradientBorderPainter(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [gradientGreen, gradientPurple],
                                    ),
                                    strokeWidth: 1, // Set the border width
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : const Expanded(
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

class GradientBorderPainter extends CustomPainter {
  final Gradient gradient;
  final double strokeWidth;

  GradientBorderPainter({
    required this.gradient,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader =
          gradient.createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2 - strokeWidth / 2;

    final path = Path()
      ..addOval(
          Rect.fromCircle(center: Offset(centerX, centerY), radius: radius));

    canvas.drawPath(path, paint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
