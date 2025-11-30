import '../models/product_model.dart';

class ProductRepository {
  // Simulate fetching product by QR code
  Product getProductByCode(String code) {
    return Product(
      id: code,
      name: "Product $code",
      price: 10 + code.hashCode % 100,
      imageUrl: "assets/box.png", // random image
    );
  }
}
