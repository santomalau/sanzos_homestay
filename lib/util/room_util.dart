import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanzos_homestay/model/room/room.dart';

Color getStatusColor(roomStatus) {
  switch (roomStatus) {
    case 'available':
      return Colors.green.shade200;
    case 'untidy':
      return Colors.red.shade200;
    case 'notAvailable':
      return Colors.grey;
    default:
      return Colors.yellow.shade400;
  }
}

String getStatusInfo(roomStatus) {
  switch (roomStatus) {
    case 'available':
      return 'Tersedia';
    case 'untidy':
      return 'Belum Dirapihkan';
    case 'notAvailable':
      return 'Tidak Tersedia';
    default:
      return 'Sedang Dipakai';
  }
}

Future? getRoomRoute(Room room) {
  switch (room.status) {
    case 'available':
      return Get.toNamed(
        '/guest-checkin',
        arguments: {"room": room},
      );
    case 'untidy':
      return Get.toNamed(
        '/room-status',
        arguments: {"room": room},
      );
    case 'notAvailable':
      return Get.toNamed(
        '/room-status',
        arguments: {"room": room},
      );
    default:
      return Get.toNamed(
        '/guest-information',
        arguments: {"room": room},
      );
  }
}
