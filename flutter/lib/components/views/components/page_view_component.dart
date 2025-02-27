import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:components/common/common_data.dart';
import 'package:flutter/material.dart';

class PageViewComponent extends StatefulWidget {
  const PageViewComponent({super.key});

  @override
  State<PageViewComponent> createState() => _PageViewComponentState();
}

class _PageViewComponentState extends State<PageViewComponent> {
  late final PageController _controller;
  late final Timer _timer;

  int _currenIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: _currenIndex,
    );
    _autoScroll();
  }


  void _autoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currenIndex < imageUrl.length - 1) {
        _currenIndex++;
      } else {
        _currenIndex = 0;
      }
      _controller.animateToPage(_currenIndex, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    },);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page view"),
      ),
      body: SizedBox(
        height: 240,
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: imageUrl.length,
               onPageChanged: (index) {
                setState(() {
                  _currenIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return SizedBox(
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl[index],
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover
                          )
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  imageUrl.length, 
                  (index) =>  AnimatedContainer(
                    height: _currenIndex == index ? 12 : 4,
                    width: 4,
                    decoration: BoxDecoration(
                       borderRadius: const BorderRadius.all(Radius.circular(16)),
                      color: _currenIndex == index ? Colors.blue : Colors.blue.shade100,
                    ),
                    duration: Duration(seconds: 300),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}