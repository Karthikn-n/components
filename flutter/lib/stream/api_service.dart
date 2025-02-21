import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CommentStream {
  final StreamController<List<Map<String, dynamic>>> _controller =
      StreamController<List<Map<String, dynamic>>>.broadcast();

  final List<Map<String, dynamic>> _comments = [];
  int _page = 1;
  final int _limit = 20;
  bool _isFetching = false;

  bool get isFetching => _isFetching;

  Stream<List<Map<String, dynamic>>> get stream => _controller.stream;

  Future<void> _fetchComments() async {
    if (_isFetching) return;
    _isFetching = true;

    final url =
        'https://jsonplaceholder.typicode.com/comments?_page=$_page&_limit=$_limit';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<Map<String, dynamic>> newComments =
          List<Map<String, dynamic>>.from(json.decode(response.body));

      _comments.addAll(newComments);
      _controller.add(_comments);

      _page++; // Increment page for the next load
    }
    print("fetching...");
    _isFetching = false;
  }

  void loadMore() {
    _fetchComments();
  }

  void dispose() {
    _controller.close();
  }
}

/// It will pool the API calls at periodic interval and feed the data to the stream.
class UserStream {
  final _controller = StreamController<List<Map<String, dynamic>>>.broadcast();

  Stream<List<Map<String, dynamic>>> get stream => _controller.stream;

  UserStream() {
    _startPolling();
  }

  void _startPolling() {
    Timer.periodic(Duration(seconds: 5), (timer) async {
      final newData = await fetchUsers();
      _controller.add(newData);
    });
  }

  Future<List<Map<String, dynamic>>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    }
    return [];
  }

  void dispose() {
    _controller.close();
  }
}

class ApiService {

List<Map<String, dynamic>> comments = [];
List<Map<String, dynamic>> posts = [];

// Function that runs in an isolate to parse JSON
List<dynamic> parseJson(String responseBody) {
  return jsonDecode(responseBody);
}

Future<void> fetchData() async {
  final url1 = Uri.parse('https://jsonplaceholder.typicode.com/comments');
  final url2 = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  final responses = await Future.wait([
    http.get(url1),
    http.get(url2),
  ]);

  if (responses[0].statusCode == 200 && responses[1].statusCode == 200) {
    // Offload JSON parsing to an isolate
    final comments = await compute(parseJson, responses[0].body);
    final posts = await compute(parseJson, responses[1].body);

    for (var comment in comments) {
      this.comments.add(comment);
    }
    for (var post in posts) {
      this.posts.add(post);
    }
  print(this.comments.length);
  print(this.posts.length);
  }
}


}