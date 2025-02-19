// ignore_for_file: avoid_print

/// Keywords are reserved terms in the dart we can't use it as
/// 1) Variable/Method/class name
/// 2) import prefix
/// These are the list of Keyword dart contains
/// https://dart.dev/language/keywords
class Keywords {

 /// final:
 /// Assigned only once at runtime.
 /// More flexible than const as it allows runtime calculation but still ensures the variable's immutability once assigned.
 /// Can hold values that are determined during program execution, like the result of a method or API call.
 void finalKey() {
  final now = DateTime.now();  // `final` variable assigned at runtime
  print(now);  // Output: The current date and time, e.g., 2025-02-18 12:30:00.000

  final int a = 10;  // A `final` integer can be assigned at runtime but not changed after assignment
  print(a);  // Output: 10
  // Trying to reassign a `final` variable will result in a compilation error
  // a = 20;  // Error: The final variable 'a' can only be set once.
 }

 /// const keyword
 /// const:
 /// Always known at compile time.
 /// Can be used to define constants that are shared across the entire program.
 /// Values are immutable, and the instance is shared.
 void constKey() {
    const pi = 3.14159;  // A constant value of pi
    print(pi); // Output: 3.14159

    // Using `const` in a List
    const numbers = [1, 2, 3];  // This list is immutable and the values are set at compile time
    print(numbers);  // Output: [1, 2, 3]
    // Trying to modify the `const` List will give an error:
    // numbers[0] = 10; // Unsupported operation: Cannot modify an unmodifiable list
 }
}