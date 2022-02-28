import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanzos_homestay/api/sheet/room_sheet.dart';
import 'package:sanzos_homestay/component/appbar/custom_appbar.dart';
import 'package:sanzos_homestay/controller/guest_controller.dart';
import 'package:sanzos_homestay/controller/room_controller.dart';
import 'package:sanzos_homestay/model/room/room.dart';
import 'package:sanzos_homestay/view/guest/guest_view.dart';

class Guest extends StatelessWidget {
  Guest({Key? key}) : super(key: key);

  final roomController = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    dynamic room = Get.arguments['room'];
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Kamar ${room.name}',
        actions: IconButton(
          onPressed: () {
            Get.defaultDialog(
              title: "Kamar Bermasalah",
              titlePadding: EdgeInsets.all(10),
              titleStyle: GoogleFonts.kodchasan(fontWeight: FontWeight.bold),
              content: Text(
                "Apakah kamar ini tidak bisa digunakan?",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(),
              ),
              textConfirm: 'Ya',
              textCancel: 'Tidak',
              onConfirm: () async {
                final updateRoom = Room(
                  id: room.id,
                  code: room.code,
                  name: room.name,
                  isUse: false,
                  status: 'notAvailable',
                  price: room.price,
                );
                await RoomSheet.update(room.id!, updateRoom.toJson());
                roomController.updateData();
                Get.offAllNamed('/');
              },
            );
          },
          icon: Icon(Icons.home_repair_service_outlined),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: GuestView(),
        ),
      ),
    );
  }
}
