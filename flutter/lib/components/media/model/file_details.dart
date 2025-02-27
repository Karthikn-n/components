import 'package:json_annotation/json_annotation.dart';

part 'file_details.g.dart';

@JsonSerializable()
class FileDetailsModel {
  final String fileName;
  final String filePath;
  final String fileSize;
  
  FileDetailsModel({required this.fileName, required this.filePath, required this.fileSize});

  factory FileDetailsModel.fromJson(Map<String, dynamic> json) => _$FileDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FileDetailsModelToJson(this);
}