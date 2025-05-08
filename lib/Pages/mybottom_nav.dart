import 'package:flutter/material.dart';
import 'package:shoe_store/Home/home.dart';
import 'package:shoe_store/Pages/cart_page.dart';
import 'package:shoe_store/Pages/g_nav.dart';

class MybottomNav extends StatefulWidget {
  const MybottomNav({super.key});

  @override
  State<MybottomNav> createState() => _MybottomNavState();
}

class _MybottomNavState extends State<MybottomNav> {
  var selectedIndex = 0;

  selectedPageIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List pages = [Home(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNavPage(
        onTabChange: (index) => selectedPageIndex(index),
      ),
      body: pages[selectedIndex],
    );
  }
}
