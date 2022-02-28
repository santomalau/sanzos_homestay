// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guest _$GuestFromJson(Map<String, dynamic> json) => Guest(
      id: json['id'] as String,
      checkIn: json['checkIn'] as String,
      checkOut: json['checkOut'] as String,
      guestName: json['guestName'] as String,
      room: json['room'] as String,
      price: jsonDecode(json['price']),
      deposit: jsonDecode(json['deposit']),
      device: json['device'] as String,
    );

Map<String, dynamic> _$GuestToJson(Guest instance) => <String, dynamic>{
      'id': instance.id,
      'checkIn': instance.checkIn,
      'checkOut': instance.checkOut,
      'guestName': instance.guestName,
      'room': instance.room,
      'price': instance.price,
      'deposit': instance.deposit,
      'device': instance.device,
    };
