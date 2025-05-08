import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/Components/cart_item.dart';
import 'package:shoe_store/Home/home.dart';
import 'package:shoe_store/Models/cart_class.dart';
import 'package:shoe_store/Models/shoe.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: Padding(
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(
            onPressed: () {
              Future.delayed(Duration.zero, () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => Home()));
              });
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 24.sp,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
      body: Center(
        child: Consumer<CartClass>(
          builder: (context, value, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "MY CART",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.getUserCart().length,
                    itemBuilder: (context, index) {
                      Shoe individualCart = value.getUserCart()[index];
                      return CartItem(shoe: individualCart);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
