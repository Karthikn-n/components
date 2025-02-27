import 'package:cached_network_image/cached_network_image.dart';
import 'package:components/common/common_data.dart';
import 'package:flutter/material.dart';

class SliverComponents extends StatelessWidget {
  const SliverComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliver Components"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 210,
            pinned: true,
            /// Removes the space after the app bar and body
            forceMaterialTransparency: true,
            collapsedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: SizedBox(
                height: 210,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: imageUrl[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text("Sliver List Item $index"),
                );
              },
              childCount: 100
            ),
          )
        ],
      ),
    );
  }
}