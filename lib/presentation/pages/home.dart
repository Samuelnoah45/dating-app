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
  List<String> names = [
    "💖 진지한 연애를 찾는 중",
    "💖 전혀 안 함",
    "💖 비흡연",
    "💖 매일 1시간 이상",
    "💖 만나는 걸 좋아함",
    "NFP",
  ];
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
      backgroundColor: primaryBlack,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
            child: const Row(
              children: [],
            ),
          )),
      bottomNavigationBar: Container(
        // color: primaryColor,
        // height: 60,
        child: const NavBar(),
      ),
      body: Container(
          child: Column(
        children: [
          const Header(),
          const SizedBox(height: 16),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: datingDataList.length,
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                GlobalKey cardKey = GlobalKey();
                return GestureDetector(
                  onTapDown: (TapDownDetails details) {
                    RenderBox? box = cardKey.currentContext!.findRenderObject()
                        as RenderBox?;
                    if (box != null) {
                      Offset localPosition =
                          box.globalToLocal(details.globalPosition);

                      // Get the size of the card
                      Size cardSize = box.size;

                      // Calculate the threshold values as a percentage of the card's width and height
                      double thresholdWidth =
                          cardSize.width * 0.3; // 30% of the card's width
                      double thresholdHeight =
                          cardSize.height * 0.3; // 30% of the card's height

                      if (localPosition.dx < thresholdWidth &&
                          localPosition.dy < thresholdHeight &&
                          _pageIndex > 0) {
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
                  child: DatingCard(
                    key: cardKey,
                    index: index,
                    data: datingDataList[index],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 32),
        ],
      )),
    );
  }
}
