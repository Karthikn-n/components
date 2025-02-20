import 'package:flutter/material.dart';
import 'package:magic_alumni/stream/api_service.dart';

class PostAndComments extends StatefulWidget {
  const PostAndComments({super.key});

  @override
  State<PostAndComments> createState() => _PostAndCommentsState();
}

class _PostAndCommentsState extends State<PostAndComments> {

  final ApiService _apiService = ApiService();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post and Comments"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Text("Comments", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
              Expanded(child: Text("Posts", textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
            ],
          ),
          FutureBuilder(
            future: _apiService.fetchData(), 
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }
              return Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: _apiService.comments.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              print(_apiService.comments[index]);
                            },
                            title: Text(_apiService.comments[index]['name']),
                            subtitle: Text(_apiService.comments[index]['email']), 
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _apiService.posts.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              print(_apiService.posts[index]);
                            },
                            title: Text(_apiService.posts[index]['title']),
                            subtitle: Text(_apiService.posts[index]['body']), 
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}