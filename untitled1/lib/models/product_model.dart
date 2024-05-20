class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  bool favorite;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.favorite,
  });

  // Toggle the favorite status of the product
  void toggleFavorite() {
    favorite = !favorite;
  }

  // Convert the Product instance to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'favorite': favorite,
    };
  }

  // Create a Product instance from a JSON map
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'].toDouble(), // Assuming 'price' is stored as a double
      favorite: json['favorite'],
    );
  }
}
