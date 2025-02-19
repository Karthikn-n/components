enum Days { monday, tuesday, wednesday, thursday, friday, faturday, sunday }
enum Weather { sunny, rainy, cloudy }
enum Status {
  success("Operation Successful"),
  error("An Error Occurred"),
  loading("Processing...");

  final String message;
  const Status(this.message);

  void showMessage() {
    print(message);
  }
}
/// Enums (Enumerations) are used to define a fixed set of constant values.
/// Look more into https://dart.dev/language/enums
class Enums {
  void enums(){
    Days today = Days.wednesday;
    Weather todayWeather = Weather.rainy;
    print(today); // Output: Days.Wednesday

    print(Days.values); // Output: [Days.Monday, Days.Tuesday, Days.Wednesday, Days.Thursday, Days.Friday, Days.Saturday, Days.Sunday]
  
    // Getting a specific enum value by index
    print(Days.values[0]); // Output: Days.Monday

    // Enums are often used in switch-case statements
    switch (todayWeather) {
      case Weather.sunny:
        print("It's a bright and sunny day!");
        break;
      case Weather.rainy:
        print("It's raining outside, take an umbrella.");
        break;
      case Weather.cloudy:
        print("The sky is cloudy.");
        break;
    }

    // Enum with methods
    Status currentStatus = Status.success;
      
    print(currentStatus.message); // Output: Operation Successful
    
    currentStatus.showMessage(); // Output: Operation Successful
  }
}


