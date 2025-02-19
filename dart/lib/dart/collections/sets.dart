
// ignore_for_file: avoid_function_literals_in_foreach_calls

/// A Set is an unordered collection of unique elements. 
/// Unlike lists, sets do not allow duplicate values 
/// and do not maintain the order of elements.
class Sets {
  void sets() {
    // Declaring a set of String
    Set<String> fruits = {"Apple", "Banana", "Mango"};

    // Adding an element
    fruits.add("Orange");
    print(fruits); // Output: {Apple, Banana, Mango, Orange}

    // Adding multiple elements
    fruits.addAll({"Grapes", "Pineapple"});
    print(fruits); // Output: {Apple, Banana, Mango, Orange, Grapes, Pineapple}

    // Removing an element
    fruits.remove("Banana");
    print(fruits); // Output: {Apple, Mango, Orange, Grapes, Pineapple}

    // Use contains() to check if an element is present
    print(fruits.contains("Apple")); // Output: true
    print(fruits.contains("Guava")); // Output: false

    // Iterating through the Sets
    // Using forEach
    fruits.forEach((fruit) => print(fruit));

    // Using for-in loop
    for (var fruit in fruits) {
      print(fruit);
    }

    Set<int> setA = {1, 2, 3, 4, 5};
    Set<int> setB = {4, 5, 6, 7, 8};

    // Union (combines both sets without duplicates)
    print(setA.union(setB)); // Output: {1, 2, 3, 4, 5, 6, 7, 8}

    // Intersection (common elements)
    print(setA.intersection(setB)); // Output: {4, 5}

    // Difference (elements in setA but not in setB)
    print(setA.difference(setB)); // Output: {1, 2, 3}

    List<int> numbers = [1, 2, 2, 3, 4, 4, 5];

    // Converting list to set (removes duplicates)
    Set<int> uniqueNumbers = numbers.toSet();
    print(uniqueNumbers); // Output: {1, 2, 3, 4, 5}

    // Converting set to list
    List<int> numberList = uniqueNumbers.toList();
    print(numberList); // Output: [1, 2, 3, 4, 5]
  }

}