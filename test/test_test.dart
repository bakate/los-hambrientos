import 'package:flutter_test/flutter_test.dart';

class Counter {
  int value = 0;

  void increment() => value++;

  void decrement() => value--;
}

void main() {
  group('COunter', () {
    late Counter counter;

    // since we initialize each test by creating a new instance of Counter
    // we can use the `setUp` method to create a new instance of Counter
    setUp(() {
      counter = Counter();
    });
    test('value should be 0 at the beginning', () {
      expect(counter.value, 0);
    });

    test('value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('value should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
