
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/controllers/favorite_controller.dart';

class FavoriteScreen extends StatelessWidget {
  final FavoriteController favoriteController = Get.find<FavoriteController >();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: Center(
        child: Obx(
              () => ListView.builder(
            itemCount: favoriteController.favoriteItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset(favoriteController.favoriteItems[index].image),
                title: Text(favoriteController.favoriteItems[index].name),
                subtitle: Text('Price: \$${favoriteController.favoriteItems[index].price}'), // Display the price
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Remove item from the wishlist when the delete button is pressed
                    favoriteController.removeFromFavorite(favoriteController.favoriteItems[index]);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // String newItem = "Item 1"; // Replace this with your actual item
                // if (!wishlistController.isItemInWishlist(newItem)) {
                //   wishlistController.addToWishlist(newItem);
                // }
              },
              child: Text('Add to Wishlist'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // String itemToRemove = "Item 1"; // Replace this with your actual item
                // wishlistController.removeFromWishlist(itemToRemove);
              },
              child: Text('Remove from Wishlist'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(FavoriteScreen());
              },
              child: Text('View Wishlist'),
            ),
          ],
        ),
      ),
    );
  }
}