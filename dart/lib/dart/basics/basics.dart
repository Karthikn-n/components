// ignore_for_file: avoid_init_to_null, avoid_print, slash_for_doc_comments

/// What is varaibles?
/// Dart is a **strongly typed language**, 
/// meaning you need to specify the type of a variable, or 
/// Dart will infer it based on the assigned value. 
/// Varaibles are used to store data and referenced the data to manipulated
/// They have name and type and change throughout the program execution
class DataTypes {
  // Primitive Data types
  int age = 25;  // Integer type
  String name = "Alice";  // String type
  bool isActive = true;  // Boolean type
  double temperature = 36.5;  // Double type

  /// An ordered collection of objects. It can be of any type (generic or dynamic).
  List<int> numbers = [1, 2, 3, 4, 5];  // List of integers
  List<String> fruits = ["Apple", "Banana", "Orange"];  // List of strings


  /// An unordered collection of key-value pairs. It is similar to dictionaries in other languages.
  Map<String, String> person = {'name': 'Alice', 'city': 'New York'};
  Map<int, String> ageMap = {1: 'one', 2: 'two'};

  /// An unordered collection of unique items (no duplicates allowed).
  Set<int> uniqueNumbers = {1, 2, 3, 4, 5};  // Set of integers
  Set<String> uniqueWords = {'apple', 'banana', 'orange'};  // Set of strings


  /// A special type that can hold any type of value, and you can assign any value to it without restriction.
  dynamic value = 10;  // Can hold an integer
  // value = "Hello";  // Can now hold a string inside the functions
  // value = true;  // Can hold a boolean

  /// A special type in Dart that represents a null value, which means a variable does not refer to any object.
  String? nameNull = null;  // Nullable String
  int? ageNull = null;  // Nullable Integer


  // Type inference
  var city = "New York";  // Dart infers 'city' as a String
  final year = 2025;  // Dart infers 'year' as an int

  // Constant 
  static const v = 3.14159;  // The value of pi is constant and cannot be changed
  
  /// Rules
  /// 1) Can consist of letters, numbers, underscores, and dollar signs.
  /// 2) Must start with a letter, underscore (_), or dollar sign ($).
  /// 3) Cannot start with a number.
  /// 4) Dart is case-sensitive (age is different from Age).
}

/// Comments in Dart
/// Comments are not compiled by the compiler
class Comments{
  // Single line comments only hide single line used to create commands on properties

  /*
    Multiline 
    comments
  */

  /// Documentation commnets are start with [///] or [/** */]
  /**
    This also consider as [Documentation] Multiline comment 
  *//// 

  // Learn more about comments in here https://dart.dev/language/comments
}

