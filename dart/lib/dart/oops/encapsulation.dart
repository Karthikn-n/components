/// Encapsulation is one of the four main principles of Object-Oriented Programming (OOP), and 
/// it refers to bundling the data (attributes) and the methods (functions) that operate on the data into a single unit, or class. 
/// It also involves restricting access to some of an object's components, which can prevent unintended interference and misuse of data. 
/// This is usually achieved through access modifiers. 
/// In Dart, encapsulation is achieved using:
/// Private members: 
/// You can make class variables or methods private by prefixing them with an underscore [(_)]. 
/// This means they are not accessible outside of the class.
class Encapsulation {
  void encapsulating() {
    var person = Person('Alice');

    // Accessing name via getter
    print(person.name); // Alice

    // Changing name using setter
    person.name = 'Bob';
    person.sayHello(); // Hello, my name is Bob

    // Cannot directly access _name outside the class (private)
    // print(person._name); // Error: The getter '_name' isn't defined for the class 'Person'.
    // _name is private, and it can only be accessed or modified through the getter and setter methods, 
    // ensuring control over the data.
  }
}

class Person {
  // Private variable
  String _name;

  // Constructor
  Person(this._name);

  // Getter method
  String get name => _name;

  // Setter method
  set name(String name) {
    if (name.isNotEmpty) {
      _name = name;
    }
  }

  // Method
  void sayHello() {
    print("Hello, my name is $_name");
  }
}

