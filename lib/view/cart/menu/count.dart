part of '../menu_screen.dart';

class Count extends StatelessWidget {
  final ValueKey<int> valueKey;

  const Count({
    required this.valueKey,
  }) : super(key: valueKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Consumer<Cart>(
        builder: (context, cart, child) {
          int count = cart.getMenu(valueKey.value).count;
          int idx = valueKey.value;
          return Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                disabledColor: Colors.grey,
                onPressed:
                    count == 1 ? null : () => cart.decrementMenuCount(idx),
              ),
              Text('$count'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => cart.incrementMenuCount(idx),
              ),
            ],
          );
        },
      ),
    );
  }
}
