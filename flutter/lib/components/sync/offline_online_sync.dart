import 'package:components/animation/components/shimmer_animation_component.dart';
import 'package:components/common/title.dart';
import 'package:components/components/sync/model/post_model.dart';
import 'package:components/components/sync/repository/post_repository.dart';
import 'package:flutter/material.dart';

class OfflineOnlineSync extends StatelessWidget {
  const OfflineOnlineSync({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Offline/Online Sync"),
      ),
      body: FutureBuilder(
        future: PostRepository.fetchPosts(), 
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return ShimmerAnimationComponent();
          } else if(snapshot.hasData && snapshot.data != null) {
            List<PostModel> posts = snapshot.data ?? [];
            debugPrint("Local length : ${posts.length}");
            return  ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                PostModel post = posts[index];
                return ListTile(
                  title: TitleText(post.title),
                  subtitle: Text(post.body, style: TextStyle(fontSize: 12),),
                  onTap: () {
                    showDialog(
                      context: context, 
                      builder: (context) {
                        return AlertDialog(
                          title: TitleText(post.title),
                          content: Text(post.body),
                          actions: [
                            SimpleDialogOption(
                              onPressed: () => Navigator.pop(context),
                              child: Text("Close"),
                            )
                          ],
                        );
                      },
                    );
                  },
                );
              },
            );
          } else {
            return Center(
              child: Text("Connection is failed"),
            );
          }
        },
      ),
    );
  }
}