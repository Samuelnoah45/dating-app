import 'package:dating/configs/colors_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 70),
          painter: BNBCustomPainter(),
        ),
        Positioned(
            left: 177,
            bottom: 28,
            child: Container(
              width: 59,
              height: 59,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0Xff0E0D0D), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: -3,
                    blurRadius: 7,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0Xff101010),
                    Color(0Xff2F2F2F),
                  ], // Add your desired colors
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/star2.svg',
                    width: 20,
                  ),
                ],
              ),
            )),
        Container(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  SizedBox(
                    height: 60,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/home.svg',
                          width: 24,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "홈",
                          style: TextStyle(color: primaryColor),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    height: 60,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location2.svg',
                          width: 19,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "스팟",
                          style: TextStyle(color: textSecondary),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: 60,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/message.svg',
                          width: 26,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "채팅",
                          style: TextStyle(color: textSecondary),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    height: 60,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/user.svg',
                          width: 26,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "마이",
                          style: TextStyle(color: textSecondary),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, -10);
    path.lineTo(size.width * 0.43, -10);
    path.quadraticBezierTo(size.width * 0.50, -36, size.width * 0.57, -10);
    path.lineTo(size.width, -10);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
    // Draw the inner shadow

    Paint borderPaint = Paint()
      ..color = navbarShadow // White color for the border
      ..style = PaintingStyle.stroke // Stroke style
      ..strokeWidth = 1.2; // Border width

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
