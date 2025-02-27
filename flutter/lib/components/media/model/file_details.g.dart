// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileDetailsModel _$FileDetailsModelFromJson(Map<String, dynamic> json) =>
    FileDetailsModel(
      fileName: json['fileName'] as String,
      filePath: json['filePath'] as String,
      fileSize: json['fileSize'] as String,
    );

Map<String, dynamic> _$FileDetailsModelToJson(FileDetailsModel instance) =>
    <String, dynamic>{
      'fileName': instance.fileName,
      'filePath': instance.filePath,
      'fileSize': instance.fileSize,
    };
