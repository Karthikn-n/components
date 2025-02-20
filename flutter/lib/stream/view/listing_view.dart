import 'package:components/stream/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  late CommentStream _commentStream;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _commentStream = CommentStream();
    _commentStream.loadMore(); // Load initial data

    // Listen for scroll events
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _commentStream.loadMore(); // Load more when reaching bottom
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Comments")),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _commentStream.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          final comments = snapshot.data!;

          return CupertinoScrollbar(
            controller: _scrollController,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: !_commentStream.isFetching ? comments.length : comments.length + 1,
              itemBuilder: (context, index) {
                if (index == comments.length && _commentStream.isFetching) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListTile(
                  title: Text(comments[index]['name']),
                  subtitle: Text(comments[index]['body']),
                  onTap: () {
                      print(comments[index]);
                    },
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _commentStream.dispose();
    super.dispose();
  }
}
