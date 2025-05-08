import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GNavPage extends StatelessWidget {
  final void Function(int)? onTabChange;
  const GNavPage({super.key, this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey.shade200,
      child: GNav(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        style: GnavStyle.google,
        curve: Curves.decelerate,
        tabBorderRadius: 15,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.white,
        activeColor: Colors.grey[900],
        color: const Color.fromARGB(255, 131, 131, 131),
        mainAxisAlignment: MainAxisAlignment.center,
        onTabChange: onTabChange,
        tabs: [
          GButton(icon: Icons.home, iconSize: 25.sp),
          GButton(icon: Icons.shopping_cart, iconSize: 25.sp),
        ],
      ),
    );
  }
}
