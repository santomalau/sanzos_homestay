// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: jsonDecode(json['id']),
      code: json['code'] as String,
      name: json['name'] as String,
      isUse: jsonDecode(json['isUse']),
      status: json['status'] as String,
      price: jsonDecode(json['price']),
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'isUse': instance.isUse,
      'status': instance.status,
      'price': instance.price,
    };
