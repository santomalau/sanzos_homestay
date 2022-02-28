import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:sanzos_homestay/constant/enum/room_status.dart';

part 'room.g.dart';

class RoomField {
  static const String id = 'id';
  static const String code = 'code';
  static const String name = 'name';
  static const String isUse = 'isUse';
  static const String status = 'status';
  static const String price = 'price';

  static List<String> getFields() => [id, code, name, isUse, status, price];
}

@JsonSerializable()
class Room {
  final int id;
  final String code;
  final String name;
  final bool isUse;
  final String status;
  final int price;
  const Room({
    required this.id,
    required this.code,
    required this.name,
    required this.isUse,
    required this.status,
    required this.price,
  });

  /// Connect the generated [_$RoomFromJson] function to the `fromJson`
  /// factory.
  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  /// Connect the generated [_$RoomToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
