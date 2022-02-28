import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'guest.g.dart';

class GuestField {
  static const String id = 'id';
  static const String checkIn = 'checkIn';
  static const String checkOut = 'checkOut';
  static const String guestName = 'guestName';
  static const String room = 'room';
  static const String price = 'price';
  static const String deposit = 'deposit';
  static const String device = 'device';

  static List<String> getFields() =>
      [id, checkIn, checkOut, guestName, room, price, deposit, device];
}

@JsonSerializable()
class Guest {
  final String id;
  final String checkIn;
  final String checkOut;
  final String guestName;
  final String room;
  final int price;
  final int deposit;
  final String device;
  const Guest({
    required this.id,
    required this.checkIn,
    required this.checkOut,
    required this.guestName,
    required this.room,
    required this.price,
    required this.deposit,
    required this.device,
  });

  /// Connect the generated [_$GuestFromJson] function to the `fromJson`
  /// factory.
  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);

  /// Connect the generated [_$GuestToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GuestToJson(this);
}
