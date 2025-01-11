import 'package:flutix_movie/core/commons/widgets/bottom_nav.dart';
import 'package:flutix_movie/core/theme/app_pallete.dart';
import 'package:flutix_movie/features/movie/presentation/pages/movie_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  static route() => MaterialPageRoute(
        builder: (context) => const MainPage(),
      );

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int bottomNavBarIndex;
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    bottomNavBarIndex = 0;
    pageController = PageController(initialPage: bottomNavBarIndex);
  }

  void pageChangeHandler(int index) {
    setState(() {
      bottomNavBarIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          decoration: const BoxDecoration(
        color: AppPallete.purpleColor,
      )),
      SafeArea(
          child: Container(
              decoration: const BoxDecoration(
        color: AppPallete.backgroundColor,
      ))),
      PageView(
        controller: pageController,
        onPageChanged: (value) {
          setState(() {
            bottomNavBarIndex = value;
          });
        },
        children: const [
          MoviePage(),
          Center(
            child: Text("Ticket"),
          )
        ],
      ),
      BottomNav(
        navBarIndex: bottomNavBarIndex,
        onPageChanged: pageChangeHandler,
      ),
    ]));
  }
}
