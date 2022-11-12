class CartInfo {
  final int count;
  final int price;
  final int deliveryFee;

  const CartInfo({
    required this.count,
    required this.price,
    required this.deliveryFee,
  });

  CartInfo countUp() {
    return CartInfo(count: count + 1, price: price, deliveryFee: deliveryFee);
  }

  CartInfo countDown() {
    return CartInfo(count: count - 1, price: price, deliveryFee: deliveryFee);
  }

  int getTotalPayAmount() {
    return price * count + deliveryFee;
  }

  int getTotalMenuAmount() {
    return price * count;
  }
}
