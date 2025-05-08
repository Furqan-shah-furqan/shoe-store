import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/Components/my_textfield.dart';
import 'package:shoe_store/Components/shoe_tile.dart';
import 'package:shoe_store/Models/shoe.dart';
import 'package:shoe_store/Models/cart_class.dart';
import 'package:shoe_store/Pages/intro.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<CartClass>(context, listen: false).addtoCart(shoe);

    // alert
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            title: Text(
              "Item added Successfully",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              "Check Your Cart",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {
              Future.delayed(Duration.zero, () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => IntroPage()));
              });
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24.sp,
              color: Colors.blueGrey,
            ),
          ),
        ),
        actions: [
          Builder(
            builder:
                (context) => Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 24.sp,
                      color: Colors.blueGrey,
                    ), // Increase the size here
                    onPressed: () {
                      Scaffold.of(
                        context,
                      ).openEndDrawer(); // Open the end drawer
                    },
                  ),
                ),
          ),
        ],
      ),

      // end Drawer
      endDrawer: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 100.r,
                  width: 100.r,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset("lib/images/nike.png"),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder:
                      (context, index) => ListTile(
                        leading: Icon(Icons.home),
                        title: Text("HOME"),
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.logout_rounded,
                        size: 25.sp,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      "SIGNOUT",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0.r),
          child: Consumer<CartClass>(
            builder: (context, value, child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // textField
                  MyTextfield(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20.r,
                      horizontal: 2.r,
                    ),
                    child: Text(
                      "Everyone flies.. Some fly longer than others",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Hot deals 🔥",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                            color: Colors.blueAccent.shade200,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.shoeList.length,
                      itemBuilder: (context, index) {
                        Shoe shoe = value.getShoeList()[index];
                        return ShoeTile(
                          shoe: shoe,
                          onPressed: () => addShoeToCart(shoe),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
