/// Polymorphism is another core concept of OOP that allows different objects to be 
/// treated as instances of the same class through inheritance. 
/// It allows you to use the same method name on different objects, 
/// but the method will behave differently depending on the object calling it. 
/// There are two types of polymorphism:
/// Compile-time polymorphism (method overloading)
/// Runtime polymorphism (method overriding)
class Polymorphism {

  /// Different methods with the same name but different parameters.
  void runTimePoly(){
      Animal myAnimal = Animal();
      Animal myDog = Dog();
      Animal myCat = Cat();

      myAnimal.speak(); // The animal makes a sound.
      myDog.speak();    // The dog barks.
      myCat.speak();    // The cat meows.
  }

  /// Subclasses can override methods defined in a parent class.
  /// We simulate overloading using optional parameters or different parameter counts.
  /// Dart doesn’t directly support compile-time polymorphism as in traditional overloading (like in Java), but you can achieve similar behavior through parameter flexibility.
  void compileTimePoly() {
     var calculator = Calculator();

    print(calculator.addWithNamedParams(a: 2, b: 3, c: 4)); // Output: 9
  }
}

class Animal {
  // Method that can be overridden
  void speak() {
    print("The animal makes a sound.");
  }
}

class Dog extends Animal {
  // Overriding speak() method in Dog
  @override
  void speak() {
    print("The dog barks.");
  }
}

class Cat extends Animal {
  // Overriding speak() method in Cat
  @override
  void speak() {
    print("The cat meows.");
  }
}

class Calculator {

  // Adding numbers using optional named parameters
  int addWithNamedParams({int a = 0, int b = 0, int c = 0}) {
    return a + b + c;
  }
}