
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/controllers/favorite_controller.dart';
import '../controllers/product_controller.dart';
import 'cart_screen.dart';
import 'favorite_screen.dart';

class ProductScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final FavoriteController favoriteController = Get.put(FavoriteController());

  ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text("ALL Product List"),
        actions: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton.icon(style: ButtonStyle(shadowColor: MaterialStatePropertyAll(Colors.transparent)),
                  onPressed: () {
                    Get.to(FavoriteScreen());
                  },
                  icon: Icon(Icons.favorite),
                  label: GetX<FavoriteController>(
                    builder: (controller) =>
                        Text(favoriteController.count.toString()),
                  ),
                ),
              ),
              ElevatedButton.icon(style: ButtonStyle(shadowColor: MaterialStatePropertyAll(Colors.transparent)),
                onPressed: () {
                  Get.to(CartScreen());
                },
                icon: const Icon(Icons.shopping_cart),
                label: GetX<ProductController>(
                  builder: (controller) => Text(
                    productController.count.toString(),
                  ),
                ),),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ProductController>(
              builder: (controller) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 5,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 120,
                              width: double.infinity,
                              child: Image.asset(
                                controller.productData[index].image,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.productData[index].name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => Container(
                                        height: 40,width: 50,
                                        decoration: BoxDecoration(color: Colors.green.shade100,
                                          borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            if (productController.productData[index].favorite) {
                                              favoriteController.removeFromFavorite(productController.productData[index]);
                                            } else {
                                              favoriteController.addToFavorite(productController.productData[index]);
                                            }
                                            productController.adddToFavorite(productController.productData[index].id);
                                          },
                                          icon: Icon(
                                            productController.productData[index].favorite
                                                ? Icons.favorite
                                                : Icons.favorite_border_rounded,
                                            color: productController.productData[index].favorite
                                                ? Colors.red
                                                : Colors.white
                                          ),
                                        ),
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "price:${controller.productData[index].price}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        productController.addtocart(
                                            controller.productData[index]);
                                        // Handle the add to cart action here
                                      },
                                      child: Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: controller.productData.length,
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GetX<ProductController>(
            builder: (controller) => Text(
              "Total amount:${productController.totalprice}",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}