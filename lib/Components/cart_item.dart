import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shoe_store/Models/cart_class.dart';
import 'package:shoe_store/Models/shoe.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;
  const CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // Remove item from cart
  void removeItemFromCart() {
    Provider.of<CartClass>(context, listen: false).removeitemCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Shoe Image
          Container(
            height: 55.h,
            width: 60.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                image: AssetImage(widget.shoe.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20.w),

          // Shoe Name & Price
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.shoe.name,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.shoe.price,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Delete Icon
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              icon: Icon(Icons.delete, color: Colors.red[200], size: 24.sp),
              onPressed: removeItemFromCart,
            ),
          ),
        ],
      ),
    );
  }
}
