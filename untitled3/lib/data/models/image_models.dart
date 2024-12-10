class ImageModel {
  final String imageUrl;

  ImageModel({required this.imageUrl});

  static List<ImageModel> getImages() {
    return [
      ImageModel(imageUrl: "https://www.freepnglogos.com/uploads/adidas-logo-png-black-0.png"),
      ImageModel(imageUrl: "https://assets.stickpng.com/thumbs/5847f1f5cef1014c0b5e4860.png"),
      ImageModel(imageUrl: "https://zeevector.com/wp-content/uploads/Black-Nike-Logo-PNG-Transparent.png"),
      ImageModel(imageUrl: "https://assets.stickpng.com/thumbs/5a1ed72c4ac6b00ff574e2e6.png"),
      ImageModel(imageUrl: "https://assets.stickpng.com/thumbs/608ae9c60517f5000437cce7.png"),
      ImageModel(imageUrl: "https://assets.stickpng.com/thumbs/5a314c97cb9a85480a628f80.png"),
      ImageModel(imageUrl: "https://assets.stickpng.com/thumbs/580b57fcd9996e24bc43c4f8.png"),
      ImageModel(imageUrl: "https://upload.wikimedia.org/wikipedia/commons/3/33/Reebok_logo19.png"),
      ImageModel(imageUrl: "https://assets.stickpng.com/thumbs/5842f005a6515b1e0ad75b0f.png"),
    ];
  }
}
