import 'dart:async';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketExample extends StatefulWidget {
  const WebSocketExample({super.key});

  @override
  State<WebSocketExample> createState() => _WebSocketExampleState();
}

class _WebSocketExampleState extends State<WebSocketExample> {
  late WebSocketChannel channel;
  late Stream stream;
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Connect to WebSocket
    channel = WebSocketChannel.connect(
      Uri.parse('wss://echo.websocket.org'), // Replace with your WebSocket URL
    );

    // Listen to the stream for real-time updates
    stream = channel.stream;
    stream.listen((message) {
      setState(() {
        messages.add({
          "text": message,
          "sender": "received",
          "time": _formattedTime(),
        });
      });
    }, onError: (error) {
      print("WebSocket Error: $error");
    });
  }

  /// Send message
  void sendMessage(String message) {
    if (message.trim().isEmpty) return;

    setState(() {
      messages.add({
        "text": message,
        "sender": "sent",
        "time": _formattedTime(),
      });
    });

    channel.sink.add(message);
    _controller.clear();
  }

  /// Get formatted time
  String _formattedTime() {
    final now = DateTime.now();
    return "${now.hour}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}";
  }

  @override
  void dispose() {
    channel.sink.close(status.goingAway);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("WebSocket Chat")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // Start from bottom
              padding: const EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[messages.length - index - 1];
                final isSent = msg["sender"] == "sent";

                return Align(
                  alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isSent ? Colors.blueAccent : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Text(
                          msg["text"]!,
                          style: TextStyle(
                            color: isSent ? Colors.white : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          msg["time"]!,
                          style: TextStyle(
                            fontSize: 12,
                            color: isSent ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: "Type a message...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () => sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
