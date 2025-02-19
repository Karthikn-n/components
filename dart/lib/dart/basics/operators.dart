// ignore_for_file: avoid_init_to_null, avoid_print, slash_for_doc_comments, dead_code

/// Dart supports various operators for manipulating data. 
class Operators{
  
  /** Arithmetic Operators
    These operators are used to perform mathematical calculations.

    | Operator | Description         | Example        |
    |----------|---------------------|----------------|
    | `+`      | Addition            | `3 + 2` → `5`  |
    | `-`      | Subtraction         | `5 - 2` → `3`  |
    | `*`      | Multiplication      | `4 * 2` → `8`  |
    | `/`      | Division            | `10 / 2` → `5.0`|
    | `~/`     | Integer Division    | `10 ~/ 3` → `3` |
    | `%`      | Modulo (Remainder)  | `10 % 3` → `1`  |
  */
  void arithemticOpe(){
    int a = 10;
    int b = 3;
    print(a + b);  // 13
    print(a - b);  // 7
    print(a * b);  // 30
    print(a / b);  // 3.3333...
    print(a ~/ b); // 3 (integer division)
    print(a % b);  // 1 (remainder)
  }

  /** 
    Relational (Comparison) Operators
    These operators compare two values and return a boolean result.

    | Operator | Description         | Example               |
    |----------|---------------------|-----------------------|
    | `==`     | Equal to            | `3 == 3` → `true`     |
    | `!=`     | Not equal to        | `3 != 4` → `true`     |
    | `>`      | Greater than        | `5 > 3` → `true`      |
    | `<`      | Less than           | `3 < 5` → `true`      |
    | `>=`     | Greater than or equal to | `5 >= 5` → `true`  |
    | `<=`     | Less than or equal to | `3 <= 5` → `true`    |
  */
  void comparisonOpe(){
    int a = 5;
    int b = 10;
    print(a == b);  // false
    print(a != b);  // true
    print(a > b);   // false
    print(a < b);   // true
    print(a >= b);  // false
    print(a <= b);  // true
  }

  /**
   Logical Operators**
  These operators are used to perform logical operations.
  | Operator | Description     | Example                |
  |----------|-----------------|------------------------|
  | `&&`     | Logical AND     | `true && false` → `false`|
  | `||`     | Logical OR      | `true || false` → `true` |
  | `!`      | Logical NOT     | `!true` → `false`       |
  */
  void logicalOpe() {
    bool x = true;
    bool y = false;
    print(x && y);  // false
    print(x || y);  // true
    print(!x);      // false
  }

  /// Assignment Operators
  /// These operators are used to assign values to variables.
  /// | Operator | Description       | Example        |
  /// |----------|-------------------|----------------|
  /// | `=`      | Assignment        | `a = 5`        |
  /// | `+=`     | Add and assign    | `a += 3` → `a = a + 3` |
  /// | `-=`     | Subtract and assign| `a -= 2` → `a = a - 2` |
  /// | `*=`     | Multiply and assign| `a *= 2` → `a = a * 2` |
  /// | `/=`     | Divide and assign  | `a /= 2` → `a = a / 2` |
  void assignmentOpe() {
    double a = 5;
    print(a += 3);  // a = a + 3, a becomes 8
    print(a -= 2);  // a = a - 2, a becomes 6
    print(a *= 2);  // a = a * 2, a becomes 12
    print(a /= 3);  // a = a / 3, a becomes 4.0
  }


  
  /**
   Conditional (Ternary) Operator**
    The ternary operator is a shorthand for an `if-else` statement.

    | Operator | Description           | Example                 |
    |----------|-----------------------|-------------------------|
    | `condition ? expr1 : expr2` | If `condition` is true, `expr1` is evaluated; otherwise, `expr2` is evaluated. | `x > 5 ? 'Greater' : 'Smaller'` |
  */
  void ternaryOpe() {
    int a = 10;
    String result = (a > 5) ? "Greater" : "Smaller";
    print(result);  // "Greater"
  }

  /**
    Bitwise Operators
    These operators perform bit-level operations on integers.

    | Operator | Description        | Example        |
    |----------|--------------------|----------------|
    | `&`      | AND                | `5 & 3` → `1`  |
    | `|`      | OR                 | `5 | 3` → `7`  |
    | `^`      | XOR                | `5 ^ 3` → `6`  |
    | `~`      | NOT                | `~5` → `-6`    |
    | `<<`     | Left shift         | `5 << 1` → `10`|
    | `>>`     | Right shift        | `5 >> 1` → `2` |
  */
  void bitwiseOpe() {
    int a = 5;  // Binary: 0101
    int b = 3;  // Binary: 0011
    print(a & b);  // 1 (Binary: 0001)
    print(a | b);  // 7 (Binary: 0111)
    print(a ^ b);  // 6 (Binary: 0110)
  }
}









