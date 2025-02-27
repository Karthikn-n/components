import 'package:components/components/buttons/components/dropdown_button_component.dart';
import 'package:components/components/input-methods/components/input_field_component.dart';
import 'package:components/components/input-methods/components/text_form_field_component.dart';
import 'package:flutter/material.dart';

class FormviewComponent extends StatefulWidget {
  const FormviewComponent({super.key});

  @override
  State<FormviewComponent> createState() => _FormviewComponentState();
}

class _FormviewComponentState extends State<FormviewComponent> {
  final bool _isVisibile = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Component"),
      ),
      body: Center(
        child: Column(
          spacing: 10,
          children: [
            Text("Form components all the fields needs that are needs to be create a form"),
            
            TextFormFieldComponent(isObseure: false, textInputAction: TextInputAction.next, hintText: "Any input",),
            TextFormFieldComponent(
              isObseure: _isVisibile, 
              suffixIcon: IconButton(onPressed: () => setState((){_isVisibile != _isVisibile; }), icon: Icon(_isVisibile ? Icons.visibility_off : Icons.visibility)),
              textInputAction: TextInputAction.next,
              hintText: "Password",
            ),
            InputFieldComponent(controller: TextEditingController(), labelText: "Any input",),
            DropdownButtonComponent(),
            DatePickerDialog(firstDate: DateTime.now(), lastDate: DateTime(2100)),
          ],
        ),
      ),
    );
  }
}