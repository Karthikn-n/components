/// Generics allow us to write reusable code that works with multiple data types.
/// Instead of using dynamic, we use `<T>` to define type-safe classes.
/// More about: https://dart.dev/language/generics
class Generics {
  /// `Box<T>` is a generic class where T can be any type.
  void initialization() {
    Box<int> intBox = Box(10);
    intBox.display(); // Output: Value: 10

    Box<String> stringBox = Box("Dart Generics");
    stringBox.display(); // Output: Value: Dart Generics
  }
  /// Call this function with any type of List Values it will print the first index value
  /// For example:
  /// `print(getFirst<int>([1, 2, 3]));` // Output: 1
  /// `print(getFirst<String>(["Apple", "Banana"]));` // Output: Apple
  T genericFunction<T>(List<T> items) {
    return items[0];
  }

  /// To restric generic type within certain types, we can use `extends` keyword
  /// `T` extends `Animal` ensures that `T` must be a subclass of `Animal`.
  /// 1) Use type checking (is and as) if you need to handle different cases.
  /// 2) Use an abstract class if all subclasses must implement makeSound().
  void restrictGeneric() {
    AnimalBox<Dog> dogBox = AnimalBox(Dog());
    dogBox.makeSound(); // Output: Woof!

    AnimalBox<Cat> catBox = AnimalBox(Cat());
    catBox.makeSound(); // Output: Meow...
  }
}

/// For Initialization Method
class Box<T> {
  T value;

  Box(this.value);

  void display() {
    print("Value: $value");
  }
}
/// End of Section


/// For restrict the generic Type
abstract class Animal {
  void sound();
}

class Dog extends Animal {
  @override
  void sound() {
    print("Woof..");
  }
}

class Cat extends Animal{
  @override
  void sound() {
    print("Meow...");
  }
}

class AnimalBox<T extends Animal> {
  T animal;

  AnimalBox(this.animal);

  /// To access the subclasses method when the Generic type is Constrainted to the 
  /// Parent Class we can use the Casting method to access the Subclass method
  /// using `is` keyword it will check the Type of the Object.
  /// if you used the animal as public class
  // void makeSound() {
  //   if (animal is Dog) {
  //     (animal as Dog).bark(); // Casting to Dog
  //   } else if (animal is Cat) {
  //     (animal as Cat).meow(); // Casting to Cat
  //   } else {
  //     animal.sound();
  //   }
  // }
  /// if the class is abstracted and the method is overriden by other subclasses.
  /// It will be easy to access the subclass method
  void makeSound(){
    animal.sound();
  }
}
/// End of section

