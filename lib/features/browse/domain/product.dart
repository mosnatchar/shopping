// lib/features/browse/domain/product.dart
class Product {
  final String id;
  final String name;
  final String subtitle;
  final double price;
  final double? oldPrice;
  final String image;

  const Product({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.price,
    this.oldPrice,
    required this.image,
  });
}
