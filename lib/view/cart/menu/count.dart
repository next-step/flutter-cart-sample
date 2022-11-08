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
      child: Consumer<Menu>(
        builder: (context, menu, child) {
          return Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                disabledColor: Colors.grey,
                onPressed: menu.count == 1 ? null : menu.decrementCount,
              ),
              Text('${menu.count}'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: menu.incrementCount,
              ),
            ],
          );
        },
      ),
    );
  }
}
