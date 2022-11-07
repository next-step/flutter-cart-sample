part of '../cart_screen.dart';

class StoreInformationContainer extends StatelessWidget {
  const StoreInformationContainer({
    Key? key,
    required String name,
    required String logo,
  })  : _name = name,
        _logo = logo,
        super(key: key);

  final String _name;
  final String _logo;

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
            child: Image.asset('images/$_logo', width: 35, height: 35),
          ),
          SizedBox(width: 10),
          Text(
            _name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )
        ],
      ),
    );
  }
}
