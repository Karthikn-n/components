import 'package:flutter/cupertino.dart';

class CupertinoSearchBarComponent extends StatelessWidget {
  const CupertinoSearchBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      placeholder: "Search bar field by Cupertino design",
    );
  }
}
