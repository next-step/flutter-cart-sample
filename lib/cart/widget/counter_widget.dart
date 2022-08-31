part of './menu_widget.dart';

class _CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter counter = Provider.of<Counter>(context);
    int count = counter.count;

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
            onPressed: count == 1 ? null : counter.decrement,
          ),
          Text('$count'),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: counter.increment,
          ),
        ],
      ),
    );
  }
}
