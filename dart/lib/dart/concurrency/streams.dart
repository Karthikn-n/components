/// A **stream** is a sequence of asynchronous data events.  
/// It can be **single-value (`Future`)** or **multi-value (`Stream`)**.
/// More about async: https://dart.dev/language/async
class Streams {
  Stream<int> numberStream() async* {
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(Duration(seconds: 1)); // Simulate delay
      yield i;
    }
  }

  /// Initialize the Stream using `async*` keyword
  /// - `async*` makes the function a **stream generator**.
  /// - `yield` emits values one by one.
  /// - The `listen()` function subscribes to the stream.
  /// - `async*` allows `yield` in an async function.
  void initializeStream() {
    numberStream().listen((value) {
      print("Received: $value");
    });
  }

  /// For yield
  Stream<int> fibonacci(int n) async* {
    int a = 0, b = 1;
    for (int i = 0; i < n; i++) {
      yield a; // Emit the current Fibonacci number
      int temp = a;
      a = b;
      b = temp + b;
    }
  }

  /// The `yield` keyword emits values from an `async*` function.
  /// Unlike `return`, it pauses execution and resumes later.
  /// - Each `yield` suspends execution and returns the value.
  /// - The function continues from where it left off.
  void yieldStream() {
    fibonacci(5).listen((value) {
      print("Fibonacci: $value");
    });
  }

  /// For yield* keyword example
  Stream<int> firstHalf() async* {
    yield 1;
    yield 2;
  }

  Stream<int> secondHalf() async* {
    yield 3;
    yield 4;
  }

  Stream<int> fullStream() async* {
    yield* firstHalf();  // Delegates firstHalf stream
    yield* secondHalf(); // Delegates secondHalf stream
  }
  /// End of example
  
  /// - `yield*` is used inside `async*` functions to delegate a stream.
  /// - It forwards emitted values from another stream without extra processing.
  /// - `yield*` *merges streams* seamlessly.
  /// - The function *waits for one stream to finish* before yielding another.
  void yieldStarStream() {
     fullStream().listen((value) {
      print("Received: $value");
    });
  }

}
