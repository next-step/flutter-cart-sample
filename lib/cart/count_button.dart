part of './cart_screen.dart';

class CountButton extends StatefulWidget {
  const CountButton({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ButtonState();
}

class _ButtonState extends State<CountButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Consumer<Count>(
        builder: (BuildContext context, value, Widget? child) {
          return contents(value);
        },
      ),
    );
  }

  Wrap contents(Count count) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        minusButton(count),
        Text('${count.count}'),
        addButton(count),
      ],
    );
  }

  IconButton addButton(count) {
    return IconButton(
      icon: Icon(Icons.add),
      onPressed: () {
        setState(() {
          count.add();
        });
      },
    );
  }

  IconButton minusButton(count) {
    return IconButton(
      icon: Icon(Icons.remove),
      disabledColor: Colors.grey,
      onPressed: count.isOne()
          ? null
          : () {
              setState(() {
                count.minus();
              });
            },
    );
  }
}
