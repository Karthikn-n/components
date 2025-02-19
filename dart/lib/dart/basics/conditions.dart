// ignore_for_file: avoid_function_literals_in_foreach_calls

/// To learn more about conditions and loops. visit: https://dart.dev/language/loops
class Conditions {
  void conditions() {
    int age = 18;
    // The `if` statement executes a block of code only if the given condition is `true`.
    if (age >= 18) {
      print("You are an adult.");
    }

    // The `if-else` statement executes one block of code **if the condition is true**, and another block **if the condition is false**.
    if (age >= 18) {
      print("You are an adult.");
    } else {
      print("You are a minor.");
    }

    // Used when multiple conditions need to be checked sequentially.
    int marks = 85;

    if (marks >= 90) {
      print("Grade: A+");
    } else if (marks >= 80) {
      print("Grade: A");
    } else if (marks >= 70) {
      print("Grade: B");
    } else {
      print("Grade: C");
    }

    // The `switch` statement is used when you have multiple conditions to compare with a **single value**.
    int day = 3;
    // Note: The `break` statement must be included in each `case` to prevent fall-through execution.
    switch (day) {
      case 1:
        print("Monday");
        break;
      case 2:
        print("Tuesday");
        break;
      case 3:
        print("Wednesday");
        break;
      case 4:
        print("Thursday");
        break;
      case 5:
        print("Friday");
        break;
      default:
        print("Weekend");
    }
  }


  /// Loops are used to execute a block of code multiple times until 
  /// a certain condition is met.
  void loops() {
    // The `for` loop runs a block of code for a fixed number of times.
    /// #### **Syntax:**
    /// ```
    /// for (initialization; condition; increment/decrement) {
    ///   // code block
    /// }
    /// ```
    /// Use Case: When you know how many times you need to execute a loop.
    for (int i = 1; i <= 5; i++) {
      print("Count: $i");
    }

    // The `forEach` loop is specifically used to iterate over collections like lists.
    List<String> fruits = ["Apple", "Banana", "Mango"];
    // Use Case: When working with lists or collections, `forEach` is more readable.
    fruits.forEach((fruit) {
      print(fruit);
    });
    
    // The `while` loop runs as long as the condition remains `true`.
    int i = 1;
    // Use Case When the number of iterations is unknown but depends on a condition.
    while (i <= 5) {
      print("Iteration: $i");
      i++;
    }

    // The `do-while` loop executes the block of code at least once, then checks the condition.
    int j = 1;
    // Use Case When you need the loop to run at least once, regardless of the condition.
    do {
      print("Number: $j");
      j++;
    } while (j <= 5);
  }
}