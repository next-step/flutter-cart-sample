class Counter {
  int _count = 1;

  get count {
    return _count;
  }

  void dispose() {
    _count = 1;
  }
}
