import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/product_model.dart';

class ProductController extends GetxController {
  RxList<Product> productData = <Product>[].obs;
  RxList<Product> cartItem = <Product>[].obs;
  final box = GetStorage(); // Create an instance of GetStorage

  addtocart(Product item) {
    print("calling addtocart");
    cartItem.add(item);
    saveCartToStorage(); // Save to storage after adding to the cart
  }

  void removeFromCart(int index) {
    if (index >= 0 && index < cartItem.length) {
      cartItem.removeAt(index);
      saveCartToStorage(); // Save to storage after removing from the cart
      update();
    }
  }

  double get totalprice => cartItem.fold(0, (sum, item) => sum + item.price);

  int get count => cartItem.length;

  @override
  void onInit() {
    fetchProductData();
    loadCartFromStorage(); // Load cart from storage during initialization
    super.onInit();
  }

  void saveCartToStorage() {
    // Convert the cart items to a list of JSON and save to storage
    box.write('cartItems', cartItem.map((item) => item.toJson()).toList());
  }

  void loadCartFromStorage() {
    if (box.hasData('cartItems')) {
      // Read from storage, convert JSON to Product, and assign to cartItem
      var cartItems = box.read<List<dynamic>>('cartItems')!;
      cartItem.assignAll(cartItems.map((item) => Product.fromJson(item)).toList());
    }
  }

  void fetchProductData() async {
    await Future.delayed(Duration(seconds: 5));

    List<Product> serverResponse = [
      Product(
        id: 1,
        name: 'Crocs',
        image: 'assets/crc.png',
        price: 1450,
        favorite: getFavoriteStatus(1), // Load favorite status from storage
      ),
      Product(
        id: 2,
        name: 'Crocs',
        image: 'assets/crc1.png',
        price: 1800,
        favorite: getFavoriteStatus(2), // Load favorite status from storage
      ),
      Product(
        id: 3,
        name: 'Crocs',
        image: 'assets/crc2.png',
        price: 1199,
        favorite: getFavoriteStatus(3), // Load favorite status from storage
      ),
    ];

    // Load favorite status for each product from storage
    serverResponse.forEach((product) {
      product.favorite = getFavoriteStatus(product.id);
    });

    productData.assignAll(serverResponse);
    print(productData);
    update();
  }


  adddToFavorite(id) {
    var index = productData.indexWhere((element) => element.id == id);
    productData[index].favorite = !productData[index].favorite;
    saveFavoriteStatus(id, productData[index].favorite); // Save favorite status to storage
    update();
  }


  bool getFavoriteStatus(int id) {
    return box.read('favoriteStatus_$id') ?? false;
  }

  void saveFavoriteStatus(int id, bool isFavorite) {
    box.write('favoriteStatus_$id', isFavorite);
  }
}
