enum Label {
  cart('장바구니'),
  additionalOrder('더 담으러 가기'),
  subtotal('총 주문금액'),
  deliveryFee('배탈팁'),
  paymentTotal('결제예정금액'),
  order('배달 주문하기'),
  won('원');

  const Label(this.displayName);
  final String displayName;
}