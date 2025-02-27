import 'package:components/common/title.dart';
import 'package:components/components/input-methods/components/cupertino_search_bar_component.dart';
import 'package:components/components/input-methods/components/cupertino_text_field_component.dart';
import 'package:components/components/input-methods/components/input_field_component.dart';
import 'package:components/components/input-methods/components/input_fields.dart';
import 'package:components/components/input-methods/components/text_form_field_component.dart';
import 'package:flutter/material.dart';

class InputTextFieldsComponents extends StatefulWidget {
  const InputTextFieldsComponents({super.key});

  @override
  State<InputTextFieldsComponents> createState() => _InputTextFieldsComponentsState();
}

class _InputTextFieldsComponentsState extends State<InputTextFieldsComponents> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  bool _isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Input text fields"),),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key:  _formKey,
            child: Column(
              spacing: 15,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText("Text Form Field",),
                TextFormFieldComponent(
                  isObseure: false, 
                  prefixIcon: Icon(Icons.import_contacts),
                  textInputAction: TextInputAction.done, 
                  hintText: "Text Form field",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter some text";
                    }
                    return null;
                  },
                ),
                TitleText("Text Form Field with Obsure",),
                TextFormFieldComponent(
                  isObseure: _isVisible, 
                  maxLine: 1,
                  controller: _controller,
                  textInputAction: TextInputAction.done, 
                  hintText: "Text Form field with Obsure",
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    }, 
                    icon: Icon(_isVisible ? Icons.remove_red_eye : Icons.visibility_off),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter some text";
                    }
                    return null;
                  },
                ),
                TitleText("Text Input Field",),
                InputFieldComponent(controller: TextEditingController(), labelText: "Text Input field",),
                TitleText("Cupertino Text Form Field",),
                CupertinoTextFieldComponent(),
                TitleText("Search bar Text Field",),
                SearchBarComponent(),
                TitleText("Cupertino Search bar Text Field",),
                CupertinoSearchBarComponent(),
                ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Validation passed!")));
                    }
                  }, 
                  child: Text("Check Validation")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
