import 'package:flutter/material.dart';
import 'package:shoe_store/Models/shoe.dart';

class CartClass extends ChangeNotifier {
  // List of shoes for sale
  List<Shoe> shoeList = [
    Shoe(
      imagePath: 'lib/images/shoe7.png',
      name: 'Nike ZoomX Vaporfly',
      description:
          'A running shoe designed for speed with responsive ZoomX foam.',
      price: '\$ 250',
    ),
    Shoe(
      imagePath: 'lib/images/shoe1.png',
      name: 'Nike Air Force 1',
      description:
          'Classic all-white sneakers with premium leather and Air cushioning.',
      price: '\$ 110',
    ),
    Shoe(
      imagePath: 'lib/images/shoe2.png',
      name: 'Nike Air Max 90',
      description:
          'A retro-style sneaker with a visible Air unit for all-day comfort.',
      price: '\$ 130',
    ),
    Shoe(
      imagePath: 'lib/images/shoe3.png',
      name: 'Nike Dunk Low',
      description: 'Skateboarding-inspired sneakers with a low-top silhouette.',
      price: '\$ 120',
    ),
    Shoe(
      imagePath: 'lib/images/shoe4.png',
      name: 'Nike Blazer Mid 77',
      description: 'Vintage-style basketball sneakers with a high-top design.',
      price: '\$ 100',
    ),
    Shoe(
      imagePath: 'lib/images/shoe5.png',
      name: 'Nike Air Jordan 1',
      description:
          'The legendary sneaker worn by Michael Jordan, known for its premium look.',
      price: '\$ 180',
    ),
    Shoe(
      imagePath: 'lib/images/shoe6.png',
      name: 'Nike React Vision',
      description:
          'A futuristic sneaker with lightweight cushioning and breathable mesh.',
      price: '\$ 140',
    ),
    Shoe(
      imagePath: 'lib/images/shoe8.png',
      name: 'Nike LeBron 20',
      description: 'Basketball sneakers engineered for performance and style.',
      price: '\$ 200',
    ),
  ];

  // List of items in cartPage
  List<Shoe> userCart = [];
  // get List of shoes for sale
  List<Shoe> getShoeList() {
    return shoeList;
  }

  // get Cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // Add items to the cart
  addtoCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items from the cart
  removeitemCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
