import 'package:dating/configs/colors_config.dart';
import 'package:dating/data/models/dating_card_data.dart';
import 'package:dating/presentation/components/chips.dart';
import 'package:dating/presentation/components/components.dart';
import 'package:dating/presentation/components/dating_card.dart';
import 'package:dating/presentation/components/header.dart';
import 'package:dating/presentation/components/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  List<DatingData> datingDataList = [
    DatingData(
      name: "잭과분홍콩나물",
      image: "assets/images/image1.png",
      description: "서울.2km 거리에 있음",
      chips: [],
    ),
    DatingData(
      name: "잭과분홍콩나물",
      image: "assets/images/image2.png",
      description:
          "서로 아껴주고 힘이 되어줄 사람 찾아요 선릉으로 직장 다니고 있고 여행 좋아해요 이상한 이야기하시는 분 바로 차단입니다",
      chips: [],
    ),
    DatingData(
      name: "잭과분홍콩나물",
      image: "assets/images/image3.png",
      description: "",
      chips: [
        const Chips(name: "💖 진지한 연애를 찾는 중", isLove: true, widthValue: 170),
        const Chips(name: "🍸 전혀 안 함", isLove: false, widthValue: 100),
        const Chips(name: "🚬 비흡연", isLove: false, widthValue: 80.0),
        const Chips(name: "💪🏻 매일 1시간 이상", isLove: false, widthValue: 140),
        const Chips(name: "🤝 만나는 걸 좋아함", isLove: false, widthValue: 140),
        const Chips(name: "NFP", isLove: false, widthValue: 50),
      ],
    ),
    DatingData(
      name: "잭과분홍콩나물",
      image: "assets/images/image3.png",
      description: "",
      chips: [
        const Chips(name: "💖 진지한 연애를 찾는 중", isLove: true, widthValue: 170),
        const Chips(name: "🍸 전혀 안 함", isLove: false, widthValue: 100),
        const Chips(name: "🚬 비흡연", isLove: false, widthValue: 80.0),
        const Chips(name: "💪🏻 매일 1시간 이상", isLove: false, widthValue: 140),
        const Chips(name: "🤝 만나는 걸 좋아함", isLove: false, widthValue: 140),
        const Chips(name: "NFP", isLove: false, widthValue: 50),
      ],
    ),
    DatingData(
      name: "잭과분홍콩나물",
      image: "assets/images/image3.png",
      description: "",
      chips: [
        const Chips(name: "💖 진지한 연애를 찾는 중", isLove: true, widthValue: 170),
        const Chips(name: "🍸 전혀 안 함", isLove: false, widthValue: 100),
        const Chips(name: "🚬 비흡연", isLove: false, widthValue: 80.0),
        const Chips(name: "💪🏻 매일 1시간 이상", isLove: false, widthValue: 140),
        const Chips(name: "🤝 만나는 걸 좋아함", isLove: false, widthValue: 140),
        const Chips(name: "NFP", isLove: false, widthValue: 50),
      ],
    ),
    DatingData(
      name: "",
      image: "",
      description: "",
      chips: [],
    ),
  ];
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The background color of the app
      backgroundColor: primaryBlack,

      // The app bar of the app
      appBar: PreferredSize(
          // The preferred size of the app bar
          preferredSize: const Size.fromHeight(100),
          // The app bar itself
          child: Container(
            // The padding of the app bar
            padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
            // The content of the app bar
            child: const Row(
              // The children of the app bar
              children: [],
            ),
          )),

      // The bottom navigation bar of the app
      bottomNavigationBar: Container(
        // The color of the bottom navigation bar
        // color: primaryColor,
        // The height of the bottom navigation bar
        // height: 60,
        // The content of the bottom navigation bar
        child: const NavBar(),
      ),
      body: Container(
          child: Column(
        children: [
          // The header of the app
          const Header(),
          // The space between the header and the page view
          const SizedBox(height: 16),
          // The page view of the app
          Expanded(
            child: PageView.builder(
              // The controller of the page view
              controller: _pageController,
              // The number of items in the page view
              itemCount: datingDataList.length,
              // The callback that is called when the page index is changed
              onPageChanged: (index) {
                setState(() {
                  // Update the current page index
                  _pageIndex = index;
                });
              },
              // The callback that is called to build each item in the page view
              itemBuilder: (context, index) {
                // The key of the card
                GlobalKey cardKey = GlobalKey();
                return GestureDetector(
                  // The callback that is called when the card is tapped
                  onTapDown: (TapDownDetails details) {
                    // The render box of the card
                    RenderBox? box = cardKey.currentContext!.findRenderObject()
                        as RenderBox?;
                    if (box != null) {
                      // The local position of the tap
                      Offset localPosition =
                          box.globalToLocal(details.globalPosition);

                      // The size of the card
                      Size cardSize = box.size;

                      // The threshold values as a percentage of the card's width and height
                      double thresholdWidth =
                          cardSize.width * 0.3; // 30% of the card's width
                      double thresholdHeight =
                          cardSize.height * 0.3; // 30% of the card's height

                      if (localPosition.dx < thresholdWidth &&
                          localPosition.dy < thresholdHeight &&
                          _pageIndex > 0) {
                        // Tapped on the left-top corner of the card
                        _pageController.animateToPage(_pageIndex - 1,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.linear);
                      }
                      if (localPosition.dx > cardSize.width - thresholdWidth &&
                          localPosition.dy < thresholdHeight &&
                          _pageIndex < datingDataList.length - 1) {
                        // Tapped on the right-top corner of the card
                        _pageController.animateToPage(
                          _pageIndex + 1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeIn,
                        );
                      }
                    }
                  },
                  // The card itself
                  child: DatingCard(
                    // The key of the card
                    key: cardKey,
                    // The index of the card
                    index: index,
                    // The data of the card
                    data: datingDataList[index],
                  ),
                );
              },
            ),
          ),
          // The space between the page view and the bottom navigation bar
          const SizedBox(height: 32),
        ],
      )),
    );
  }
}
