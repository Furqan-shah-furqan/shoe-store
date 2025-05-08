import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoe_store/Components/my_button.dart';
import 'package:shoe_store/Pages/mybottom_nav.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "lib/images/nike.png",
                    height: 250.r,
                    width: 250.r,
                  ),
                  Text(
                    "JUST DO IT",
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 42.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.r),
                  Text(
                    '" Take The High Road And Go Higher to touch the sky "',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50.r),
                  MyButton(
                    height: 55.r,
                    width: 200.r,
                    color: Colors.black,
                    text: "GO TO HOME",
                    fontSize: 15.sp,
                    onPressed: () {
                      Future.delayed(Duration.zero, () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MybottomNav(),
                          ),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
