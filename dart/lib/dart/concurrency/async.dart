/// `async/await` is used for **handling `Future` values synchronously**.
/// More about: https://dart.dev/language/async
class Async {
  
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating network call
    return "Data Loaded";
  }

  /// - `await` **pauses execution** until the future completes.
  /// - `async` allows using `await` inside a function.
  void futureIntialize() async {
    print("Fetching...");
    String result = await fetchData();
    print("Result: $result");
  }
} 

