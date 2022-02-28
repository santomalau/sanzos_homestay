import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanzos_homestay/view/guest/guest.dart';
import 'package:sanzos_homestay/view/room/room.dart';
import 'package:sanzos_homestay/view/room/room_status.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sanzos Homestay',
      theme: ThemeData(
        primarySwatch: Colors.green,
        backgroundColor: Colors.white,
      ),
      home: Room(),
      getPages: [
        GetPage(name: "/", page: () => Room()),
        GetPage(name: "/room-status", page: () => RoomStatus()),
        GetPage(name: "/guest-checkin", page: () => Guest()),
        GetPage(name: "/guest-information", page: () => Guest()),
      ],
    );
  }
}
