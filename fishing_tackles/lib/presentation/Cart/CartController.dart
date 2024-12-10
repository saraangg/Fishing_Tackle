import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs; // Observable list of cart items
  var quantity = 1.obs;

  void addToCart(String name, String image, String price) {
    // Check if the product already exists in the cart
    int index = cartItems.indexWhere((item) => item['name'] == name);
    if (index >= 0) {
      // If exists, increase the quantity
      cartItems[index]['quantity'] += quantity.value;
    } else {
      // Add new item to the cart
      cartItems.add({
        'name': name,
        'image': image,
        'price': price,
        'quantity': quantity.value,
      });
    }
  }

  void decreaseQuantity() {
    if (quantity.value > 1) quantity.value--;
  }

  void increaseQuantity() {
    quantity.value++;
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
  }
}
