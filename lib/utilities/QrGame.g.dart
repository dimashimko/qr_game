// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/QrGame.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrGame _$QrGameFromJson(Map<String, dynamic> json) => QrGame(
      json['quantity'] as int,
      json['range'] as int,
    )..list = (json['list'] as List<dynamic>)
        .map((e) => QrCode.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$QrGameToJson(QrGame instance) => <String, dynamic>{
      'quantity': instance.quantity,
      'range': instance.range,
      'list': instance.list,
    };

QrCode _$QrCodeFromJson(Map<String, dynamic> json) => QrCode(
      number: json['number'] as int,
      isFound: json['isFound'] as bool,
    );

Map<String, dynamic> _$QrCodeToJson(QrCode instance) => <String, dynamic>{
      'number': instance.number,
      'isFound': instance.isFound,
    };
