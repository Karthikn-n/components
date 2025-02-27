// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expansion_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      header: json['header'] as String,
      body: json['body'] as String,
      isExpanded: json['isExpanded'] as bool? ?? false,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'header': instance.header,
      'body': instance.body,
      'isExpanded': instance.isExpanded,
    };
