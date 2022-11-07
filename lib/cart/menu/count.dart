part of '../menu.dart';

class Count extends StatelessWidget {
  const Count({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int counter = MenuCounter.of(context).count;
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
                counter == 1 ? null : MenuCounter.of(context).onDecrementCount,
          ),
          Text('$counter'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: MenuCounter.of(context).onIncrementCount,
          ),
        ],
      ),
    );
  }
}
