import 'dart:isolate';

import 'package:flutter/foundation.dart';

/// Dart is single-threaded but uses Isolates for parallel execution.
/// Main Thread (UI Thread): Runs Flutter UI.
/// Isolates: Run expensive tasks in separate memory spaces.
/// Import from `dart:isolate` package
/// More about: https://dart.dev/language/isolates
class Isolates {
  /// This is used to send data back to the main thread.
  /// Since isolates don’t share memory, communication is done via SendPort and ReceivePort.
  void heavyTask(SendPort sendPort) {
    int sum = 0;
    for (int i = 0; i < 1000000000; i++) {
      sum += i;
    }
    sendPort.send(sum);
  }

  void initialization() async {
    /// A ReceivePort is an object that handles messages that are sent from other isolates.
    /// ReceivePort is created in the main isolate to receive messages from the spawned isolate.
    /// It listens for data sent from the background isolate (heavyTask).
    ReceivePort receivePort = ReceivePort();
    /// Isolate.spawn() creates a new isolate and runs heavyTask().
    /// We pass receivePort.sendPort to heavyTask(), so the spawned isolate can send data back to the main thread.
    await Isolate.spawn(heavyTask, receivePort.sendPort);

    receivePort.listen((message) {
      print("Received: $message"); // Output: Received: 499999999500000000
    });
  }

  int heavyTask2(int count) {
    int sum = 0;
    for (int i = 0; i < 1000000000; i++) {
      sum += i;
    }
    return sum;
  }

  /// Alternative: Using compute() in Flutter
  /// If you don’t need bi-directional communication, use compute() instead of manually handling isolates.
  void computeIsolate() async {
    int result = await compute(heavyTask2, 1000000000);
    print("Result: $result");
  }
}




