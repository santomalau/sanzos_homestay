import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanzos_homestay/api/sheet/room_sheet.dart';
import 'package:sanzos_homestay/component/appbar/custom_appbar.dart';
import 'package:sanzos_homestay/component/button/custom_elevated_button.dart';
import 'package:sanzos_homestay/controller/room_controller.dart';
import 'package:sanzos_homestay/model/room/room.dart';
import 'package:sanzos_homestay/util/room_util.dart';

class RoomStatus extends StatelessWidget {
  RoomStatus({Key? key}) : super(key: key);

  final roomController = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    dynamic room = Get.arguments['room'];
    return Scaffold(
      appBar: CustomAppbar(title: 'Kamar ${room.name}'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),
              Column(
                children: [
                  Text(
                    "Kamar ini ",
                    style: GoogleFonts.kodchasan(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    getStatusInfo(room.status),
                    style: GoogleFonts.kodchasan(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 2,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      image: AssetImage("assets/images/virus_image.png"),
                    ),
                  ),
                ),
              ),
              Spacer(),
              CustomElevatedButton(
                text: "Kamar Siap Digunakan",
                onPressed: () {
                  Get.defaultDialog(
                    title: "Kamar Siap",
                    titlePadding: EdgeInsets.all(10),
                    titleStyle:
                        GoogleFonts.kodchasan(fontWeight: FontWeight.bold),
                    content: Text(
                      "Apakah kamar sudah bisa digunakan kembali?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(),
                    ),
                    contentPadding: EdgeInsets.all(20),
                    textConfirm: "Iya",
                    textCancel: "Tidak",
                    onConfirm: () async {
                      final updateRoom = Room(
                        id: room.id,
                        code: room.code,
                        name: room.name,
                        isUse: false,
                        status: 'available',
                        price: room.price,
                      );
                      await RoomSheet.update(room.id!, updateRoom.toJson());
                      roomController.updateData();

                      Get.offAllNamed('/');
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
