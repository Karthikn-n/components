import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAnimationComponent extends StatelessWidget {
  const ShimmerAnimationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: 8,
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
            thickness: 1,
          );
        },
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListTile(
              title: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                height: 16.0,
                width: 10,
              ),
              subtitle: Container(
                height: 14.0,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(top: 5.0),
              ),
            ),
          );
        },
      ),
    );
  }
}