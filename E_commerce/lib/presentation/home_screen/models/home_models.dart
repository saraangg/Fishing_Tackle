class Product {
  final String id;
  final String text;
  final String image;
  final double price;
  final double star;
  final int count;
  bool favorite; // Added the 'favorite' property

  // Constructor with the 'favorite' parameter
  Product({
    required this.id,
    required this.text,
    required this.image,
    required this.price,
    required this.star,
    required this.count,
    this.favorite = false, // Default value for 'favorite'
  });

  // Toggle favorite status
  void toggleFavorite() {
    favorite = !favorite;
  }

  // Convert the Product instance to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'image': image,
      'price': price,
      'star': star,
      'count': count,
    };
  }

  // Create a Product instance from a JSON map
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      text: json['text'],
      image: json['image'],
      price: json['price'].toDouble(),
      star: json['star'].toDouble(), // Assuming 'star' is stored as a double
      count: json['count'],
      favorite: json['favorite'] ?? false, // Added 'favorite' with default value
    );
  }
}
