part of './cart_screen.dart';

class Product extends StatelessWidget {
  final String name;
  final String image;
  final String contents;
  final int price;

  const Product(
      {Key? key,
      required this.name,
      required this.image,
      required this.contents,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              _productName(name),
              Spacer(),
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              productImage(image),
              SizedBox(
                width: 10,
              ),
              _productContents(contents, krw(price)),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Column _productContents(contents, price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contents,
          style: TextStyle(
            color: Color.fromRGBO(125, 125, 125, 1.0),
          ),
        ),
        Text(price),
      ],
    );
  }

  Container productImage(image) {
    return Container(
      decoration: productImageDecoration(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          image,
          width: 70,
          height: 70,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  BoxDecoration productImageDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.grey.withOpacity(0.3),
        width: 1,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }

  Text _productName(name) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
