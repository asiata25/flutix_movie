import 'package:flutix_movie/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int navBarIndex;
  final void Function(int) onPageChanged;

  const BottomNav(
      {super.key, required this.navBarIndex, required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: CustomBottomNavClipper(),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: BottomNavigationBar(
                  elevation: 0,
                  selectedItemColor: AppPallete.grey100,
                  unselectedItemColor: AppPallete.grey300,
                  currentIndex: navBarIndex,
                  onTap: onPageChanged,
                  items: const [
                    BottomNavigationBarItem(
                      label: "Movie",
                      icon: Icon(Icons.movie),
                    ),
                    BottomNavigationBarItem(
                      label: "Ticket",
                      icon: Icon(Icons.confirmation_num),
                    ),
                  ]),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.only(bottom: 65),
            child: FloatingActionButton(
              onPressed: () => {print("floating Action Button")},
              backgroundColor: AppPallete.mainColor,
              shape: const CircleBorder(),
              child: const Icon(Icons.account_balance_wallet),
            ),
          ),
        )
      ],
    );
  }
}

class CustomBottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    final center = size.width / 2;
    const diameter = 70.0; // Diameter of the circle (width of cutout)
    const radius = diameter / 2;

    // Start from left side
    path.lineTo(center - radius, 0);

    // Draw the half circle
    path.arcToPoint(Offset(center + radius, 0),
        radius: const Radius.circular(radius), clockwise: false);

    // Complete the path
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
