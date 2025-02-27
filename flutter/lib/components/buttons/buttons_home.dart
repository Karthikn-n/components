import 'package:components/common/title.dart';
import 'package:components/components/buttons/components/checkbox_components.dart';
import 'package:components/components/buttons/components/expansion_component.dart';
import 'package:components/components/buttons/components/icon_button_component.dart';
import 'package:components/components/buttons/components/cupertino_button_tinted.dart';
import 'package:components/components/buttons/components/cupertino_filled_button.dart';
import 'package:components/components/buttons/components/cupertino_text_button_component.dart';
import 'package:components/components/buttons/components/dropdown_button_component.dart';
import 'package:components/components/buttons/components/elevated_button_component.dart';
import 'package:components/components/buttons/components/filled_button_component.dart';
import 'package:components/components/buttons/components/outlined_button_component.dart';
import 'package:components/components/buttons/components/popup_menu_button_component.dart';
import 'package:components/components/buttons/components/sliders_component.dart';
import 'package:components/components/buttons/components/swtich_component.dart';
import 'package:components/components/buttons/components/text_button_component.dart';
import 'package:flutter/material.dart';

class ButtonsComponent extends StatelessWidget {
  const ButtonsComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buttons")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButtonComponent(),
              ElevatedButtonComponent(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleText("Icon button"),
                  IconButtonComponent(),
                ],
              ),
              FilledButtonComponent(),
              CupertinoTextButtonComponent(),
              DropdownButtonComponent(),
              OutlinedButtonComponent(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleText("Popup menu button"),
                  PopupMenuButtonComponent(),
                ],
              ),
              CupertinoButtonTinted(),
              CupertinoFilledButton(),
              ExpansionComponent(),
              SlidersComponent(),
              SwtichComponent(),
              CheckboxComponents()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Back",
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
