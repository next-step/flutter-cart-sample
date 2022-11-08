part of '../menu.dart';

class Count extends StatelessWidget {
  const Count({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuCounter counter = Provider.of<MenuCounter>(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.remove),
            disabledColor: Colors.grey,
            onPressed:
                counter.count == 1 ? null : counter.decrementCount,
          ),
          Text('${counter.count}'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: counter.incrementCount,
          ),
        ],
      ),
    );
  }
}
