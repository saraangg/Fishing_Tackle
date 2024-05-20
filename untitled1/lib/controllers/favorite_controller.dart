import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/product_model.dart';

class FavoriteController extends GetxController {
  RxList<Product> favoriteItems = <Product>[].obs;
  final box = GetStorage();

  int get count => favoriteItems.length;

  @override
  void onInit() {
    super.onInit();
    loadFavorites(); // Load favorites from storage during initialization
  }

  void addToFavorite(Product item) {
    favoriteItems.add(item);
    saveFavorites(); // Save to storage after adding to favorites
    saveFavoriteStatus(item.id, true); // Save favorite status to storage
  }

  void removeFromFavorite(Product item) {
    favoriteItems.remove(item);
    saveFavorites(); // Save to storage after removing from favorites
    saveFavoriteStatus(item.id, false); // Save favorite status to storage
  }

  bool isItemInFavorite(Product item) {
    return favoriteItems.contains(item);
  }

  void saveFavorites() {
    // Convert favorite items to a list of JSON and save to storage
    box.write('favoriteItems', favoriteItems.map((item) => item.toJson()).toList());
  }

  void loadFavorites() {
    if (box.hasData('favoriteItems')) {
      // Read from storage, convert JSON to Product, and assign to favoriteItems
      var favorites = box.read<List<dynamic>>('favoriteItems')!;
      favoriteItems.assignAll(favorites.map((item) => Product.fromJson(item)).toList());
    }
  }

  bool getFavoriteStatus(int id) {
    return box.read('favoriteStatus_$id') ?? false;
  }

  void saveFavoriteStatus(int id, bool isFavorite) {
    box.write('favoriteStatus_$id', isFavorite);
  }
}
