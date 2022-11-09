class Store {
  String name;
  String logo;
  List<Item> itemList;
  int deliveryFee;

  Store({
    required this.name,
    required this.logo,
    required this.itemList,
    required this.deliveryFee,
  });
}

class Item {
  String name;
  String? description;
  String image;
  int price;
  int count;

  Item({
    required this.name,
    this.description,
    required this.image,
    required this.price,
    this.count = 1,
  });
}
