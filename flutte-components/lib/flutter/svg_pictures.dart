import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
/// Import the flutter_svg: ^2.0.17 from the pub.dev
class SvgPictures extends StatelessWidget {
  const SvgPictures({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Svg Pictures"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Assets Svg", 
              style: TextStyle(fontSize: 18, decoration: TextDecoration.none),
            ),
            Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: SvgPicture.asset("assets/svg/11732624_21047554.svg")
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: SvgPicture.asset("assets/svg/70015662_JEMA GER 1635-05.svg")
                ),
              ],
            ),
            Text(
              "Network Svg", 
              style: TextStyle(fontSize: 18, decoration: TextDecoration.none),
            ),
             Row(
               children: [
                 SizedBox(
                  height: 100,
                  width: 100,
                  child: SvgPicture.network(
                    'https://www.svgrepo.com/show/535115/alien.svg',
                    semanticsLabel: 'A shark?!',
                    placeholderBuilder: (BuildContext context) => Container(
                      padding: const EdgeInsets.all(30.0),
                      child: const CircularProgressIndicator()
                    ),
                  ),
                 ),
                 SizedBox(
                  height: 100,
                  width: 100,
                  child: SvgPicture.network(
                    'https://www.svgrepo.com/show/530478/bank.svg',
                    semanticsLabel: 'A shark?!',
                    placeholderBuilder: (BuildContext context) => Container(
                      padding: const EdgeInsets.all(30.0),
                      child: const CircularProgressIndicator()
                    ),
                  ),
                 ),
               ],
             ),
          ],
        ),
      ),
    );
  }
}