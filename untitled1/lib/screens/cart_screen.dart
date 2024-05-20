import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';

class CartScreen extends StatelessWidget {
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ProductController>(
              builder: (controller) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.cartItem[index].name),
                      subtitle: Text("Price: ${controller.cartItem[index].price}"),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Remove item from the cart when delete button is pressed
                          controller.removeFromCart(index);
                        },
                      ),
                    );
                  },
                  itemCount: controller.cartItem.length,
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GetX<ProductController>(
            builder: (controller) => Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(color: Colors.blue.shade800),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Total amount: ${controller.totalprice}",
                  style: const TextStyle(fontSize: 23, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
