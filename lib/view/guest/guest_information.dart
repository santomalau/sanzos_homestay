import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanzos_homestay/api/sheet/room_sheet.dart';
import 'package:sanzos_homestay/component/button/custom_elevated_button.dart';
import 'package:sanzos_homestay/component/tile/guest_information_tile.dart';
import 'package:sanzos_homestay/constant/theme.dart';
import 'package:sanzos_homestay/controller/guest_controller.dart';
import 'package:sanzos_homestay/controller/room_controller.dart';
import 'package:sanzos_homestay/model/room/room.dart';
import 'package:skeleton_text/skeleton_text.dart';

class GuestInformation extends StatelessWidget {
  GuestInformation({Key? key}) : super(key: key);

  final guestController = Get.put(GuestController());
  final roomController = Get.put(RoomController());

  dynamic room = Get.arguments['room'];

  @override
  Widget build(BuildContext context) {
    return GetX<GuestController>(
      init: GuestController(),
      initState: (state) {
        state.controller!.isLoading.value = true;
        state.controller!.getGuest(room.status);
      },
      builder: (state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: Text(
                state.guest.value.guestName,
                style: GoogleFonts.kodchasan(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Flexible(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 2,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/user_image.png"),
                  ),
                ),
              ),
            ),
            GuestInformationTile(
              label: "Check In",
              value: state.guest.value.checkIn.toString(),
              state: state,
            ),
            SizedBox(height: 20),
            GuestInformationTile(
              label: "Check Out",
              value: state.guest.value.checkOut.toString(),
              state: state,
            ),
            SizedBox(height: 20),
            GuestInformationTile(
              label: "Harga",
              value: state.guest.value.price.toString(),
              state: state,
            ),
            SizedBox(height: 20),
            GuestInformationTile(
              label: "Deposit",
              value: state.guest.value.deposit.toString(),
              state: state,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: state.isLoading.value
                    ? SkeletonAnimation(
                        shimmerColor: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                        shimmerDuration: 1000,
                        child: Container(
                          height: 45,
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: shadowList,
                          ),
                        ),
                      )
                    : CustomElevatedButton(
                        text: "Check Out",
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Check Out",
                            titlePadding: EdgeInsets.all(10),
                            titleStyle: GoogleFonts.kodchasan(
                                fontWeight: FontWeight.bold),
                            content: Text(
                              "Apakah tamu telah keluar?",
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
                                status: 'untidy',
                                price: room.price,
                              );
                              await RoomSheet.update(
                                  room.id!, updateRoom.toJson());
                              roomController.updateData();

                              Get.offAllNamed('/');
                            },
                          );
                        },
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
