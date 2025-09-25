class DealItem {
  final String id; // ✅ เพิ่ม id
  final String image;
  final String category;
  final double price;
  final double? oldPrice;
  final String name;
  final String subtitle;

  const DealItem({
    required this.id,
    required this.image,
    required this.category,
    required this.price,
    this.oldPrice,
    required this.name,
    required this.subtitle,
  });
}
