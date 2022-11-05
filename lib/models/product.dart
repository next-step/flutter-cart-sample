class Product {
  final String name;
  final String? description;
  final String? thumbnail;
  final int originalPrice;

  Product(
    this.name, {
    this.description,
    this.thumbnail,
    required this.originalPrice,
  });
}
