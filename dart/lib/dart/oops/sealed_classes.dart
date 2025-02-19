/// A Sealed Class is a special type of class that restricts subclassing to only specific classes within the same file.
/// It is useful for pattern matching and ensuring safety in state management.
class SealedClasses {
  /// Declaration of Sealed class we can't access it outside this file
  void declartionSealed() {
    Shape shape = Circle(5.0);

    if (shape is Circle) {
      print("It's a Circle with radius: ${shape.radius}");
    } else if (shape is Rectangle) {
      print("It's a Rectangle with dimensions: ${shape.width}x${shape.height}");
    }
  }

  /// Pattern Matching
  /// From dart 3 it is used to match the pattern and maked sealed class even more powerful
  /// Explanation: This ensures all possible cases are handled, preventing bugs.
  void patternSealed() {
    handleResult(Success("Data Loaded"));  // Output: Success: Data Loaded
    handleResult(Failure("Network Error")); // Output: Error: Network Error
  }
}
sealed class Shape {}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);
}

class Rectangle extends Shape {
  final double width, height;
  Rectangle(this.width, this.height);
}


sealed class Result {}

class Success extends Result {
  final String data;
  Success(this.data);
}

class Failure extends Result {
  final String error;
  Failure(this.error);
}

void handleResult(Result result) {
  switch (result) {
    case Success(data: var message):
      print("Success: $message");
    case Failure(error: var err):
      print("Error: $err");
  }
}

