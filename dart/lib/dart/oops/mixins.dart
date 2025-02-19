/// A Mixin is a way to reuse code across multiple classes without using inheritance. 
/// It allows you to add functionalities to multiple classes without modifying their original structure
/// It doesn't have any constructors
/// More about: https://dart.dev/language/mixins
class Mixins {
  /// Declaring a Mixin we can use multiple mixins with one class,
  /// it can access all the mixin methods with the class Object
  void declareMixin() {
    MyClass obj = MyClass();
    obj.log("Mixins in Dart");
    obj.printData();
  }

  /// We can restrict the mixin
  /// by adding [on] keyword in the mixin with class so the mixin only mix with the class
  /// So if we want to mix the mixing we need extend the class that already mixed
  /// Explanation: The CanFly mixin only works with Animal (i.e., Bird extends Animal).
  void restrictMixin() {
    Bird bird = Bird();
    bird.eat();  // Output: Eating...
    bird.fly();  // Output: Flying...
  }
}

mixin Logger {
  void log(String message) => print("Log: $message");
}

mixin Printer {
  void printData() => print("Printing data...");
}

class MyClass with Logger, Printer {}

class Animal {
  void eat() => print("Eating...");
}

mixin CanFly on Animal {
  void fly() => print("Flying...");
}

class Bird extends Animal with CanFly {}

void main() {

}
