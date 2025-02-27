import 'package:cached_network_image/cached_network_image.dart';
import 'package:components/common/common_data.dart';
import 'package:flutter/material.dart';

class CarouselViewComponent extends StatefulWidget {
  const CarouselViewComponent({super.key});

  @override
  State<CarouselViewComponent> createState() => _CarouselViewComponentState();
}

class _CarouselViewComponentState extends State<CarouselViewComponent> {
  late final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carousel View"),
      ),
      body: SizedBox(
        height: 200,
        child: CarouselView.weighted(
          reverse: true,
          itemSnapping: true,
          controller: _controller,
          shrinkExtent: 150.0,
          flexWeights: [1, 8, 1],
          enableSplash: true,
          children: List.generate(
            imageUrl.length, 
            (index) {
              return SizedBox(
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
                  // placeholder: (context, url) {
                  //   return Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey[300],
                  //   ),
                  //   child: Image.network(
                  //       "https://static.vecteezy.com/system/resources/previews/016/916/479/original/placeholder-icon-design-free-vector.jpg"
                  //     ),
                  //   );
                  // },
                ),
              );
            } 
          )
        ),
      ),
    );
  }
}