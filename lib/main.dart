import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/Models/cart_class.dart';
import 'package:shoe_store/Pages/intro.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartClass())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Set your base design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            drawerTheme: DrawerThemeData(elevation: 0),
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.elMessiriTextTheme(
              // Set Aclonica as the default font
              Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
          ),
          home: child!,
        );
      },
      child: const IntroPage(), // Ensure this is not null
    );
  }
}
