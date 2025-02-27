
import 'package:json_annotation/json_annotation.dart';

/// Before running the build_runner command, the part statement is required to import the generated file.
/// The part statement is used to specify the location of the generated file.
part 'expansion_model.g.dart';

/// To generate the .g.dart file, run the command: dart run build_runner build
/// If any changes are made to the model, run the command: dart run build_runner build --delete-conflicting-outputs
/// Once add this annotation, run the command: dart run build_runner build
/// The @JsonSerializable() annotation is used to generate the toJson() and fromJson() methods.
@JsonSerializable()
class Item {
  String header;
  String body;
  bool isExpanded;

  Item({required this.header, required this.body, this.isExpanded = false});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}