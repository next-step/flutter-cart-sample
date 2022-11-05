class Payment {
  final int originalPrice;
  final int deliveryPrice;

  int totalPrice() {
    return originalPrice + deliveryPrice;
  }

  Payment({
    required this.originalPrice,
    required this.deliveryPrice,
  });
}
