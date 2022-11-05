class Shop {
  final String name;
  final String? description;
  final String? thumbnail;
  final int deliveryPrice;

  Shop(
    this.name, {
    this.description,
    this.thumbnail,
    required this.deliveryPrice,
  });
}
