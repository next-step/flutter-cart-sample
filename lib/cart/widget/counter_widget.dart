part of './menu_widget.dart';

class _CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter counterModel = Provider.of<Counter>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.4)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Consumer<Counter>(
              builder: (context, counter, child) => IconButton(
                    icon: Icon(Icons.remove),
                    disabledColor: Colors.grey,
                    onPressed: counter.count == 1 ? null : counter.decrement,
                  )),
          Consumer<Counter>(
              builder: (context, counter, child) => Text('${counter.count}')),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: counterModel.increment,
          ),
        ],
      ),
    );
  }
}
