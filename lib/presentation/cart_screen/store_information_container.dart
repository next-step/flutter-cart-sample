part of '../cart_screen.dart';

class StoreInformationContainer extends StatelessWidget {
  const StoreInformationContainer({
    Key? key,
    required this.name,
    required this.logo,
  }) : super(key: key);

  final String name;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 70,
      child: Row(
        children: [
          SizedBox(width: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('images/$logo', width: 35, height: 35),
          ),
          SizedBox(width: 10),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}

