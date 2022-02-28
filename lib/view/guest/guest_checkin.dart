import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sanzos_homestay/api/sheet/guest_sheet.dart';
import 'package:sanzos_homestay/api/sheet/room_sheet.dart';
import 'package:sanzos_homestay/component/button/custom_elevated_button.dart';
import 'package:sanzos_homestay/component/field/custom_text_form_field.dart';
import 'package:sanzos_homestay/controller/guest_controller.dart';
import 'package:sanzos_homestay/controller/room_controller.dart';
import 'package:sanzos_homestay/model/guest/guest.dart';
import 'package:sanzos_homestay/model/room/room.dart';
import 'package:sanzos_homestay/services/device.dart';
import 'package:sanzos_homestay/util/guest_util.dart';
import 'package:uuid/uuid.dart';

class GuestCheckin extends StatelessWidget {
  GuestCheckin({Key? key}) : super(key: key);

  final dateNow = DateTime.now();

  final guestController = Get.put(GuestController());
  final roomController = Get.put(RoomController());

  final TextEditingController _guestNameController = TextEditingController();
  final TextEditingController _checkOutController = TextEditingController();
  final TextEditingController _depositController = TextEditingController();

  dynamic room = Get.arguments['room'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          keyboardType: TextInputType.text,
          controller: _guestNameController,
          enabled: true,
          label: 'Nama Tamu',
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: Text(
                "Lebih dari 1 malam? ",
                style: GoogleFonts.kodchasan(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Obx(
              () => Flexible(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SwitchListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: guestController.isMoreThanOneDay.value,
                    onChanged: (value) {
                      guestController.switchMoreThanOneDay();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        Obx(
          () => Visibility(
            visible: guestController.isMoreThanOneDay.value,
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: _checkOutController,
                  enabled: false,
                  label: 'Check Out',
                  onTap: () {
                    DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime.now().add(const Duration(days: 2)),
                      maxTime: DateTime(2050, 12, 31),
                      onConfirm: (date) {
                        _checkOutController.text =
                            DateFormat('dd MMMM yyyy').format(date);
                        guestController.setCheckOut(date);
                      },
                      currentTime: DateTime.now(),
                      locale: LocaleType.id,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: Text(
                "Deposit kunci?",
                style: GoogleFonts.kodchasan(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Obx(
              () => Flexible(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SwitchListTile(
                    controlAffinity: ListTileControlAffinity.trailing,
                    value: guestController.isKeyDeposit.value,
                    onChanged: (value) {
                      guestController.switchKeyDeposit();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
        Obx(
          () => Visibility(
            visible: guestController.isKeyDeposit.value,
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomTextFormField(
                  keyboardType: TextInputType.number,
                  enabled: true,
                  controller: _depositController,
                  label: 'Deposit Kunci',
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: CustomElevatedButton(
              text: "Check In",
              onPressed: () async {
                if (_checkOutController.text == '' &&
                    (guestController.isMoreThanOneDay.value)) {
                  Get.showSnackbar(
                    const GetSnackBar(
                      message: "Waktu Check Out Belum Ditentukan",
                      duration: Duration(seconds: 2, microseconds: 50),
                    ),
                  );
                } else if (_depositController.text == '' &&
                    (guestController.isKeyDeposit.value)) {
                  Get.showSnackbar(
                    const GetSnackBar(
                      message: "Deposit Kunci Belum Dimasukkan",
                      duration: Duration(seconds: 2, microseconds: 50),
                    ),
                  );
                } else {
                  final uuid = const Uuid().v1();

                  final guest = Guest(
                    id: uuid,
                    checkIn: convertDate(dateNow).toString(),
                    checkOut: convertCheckout(guestController.checkout.value)
                        .toString(),
                    guestName: (_guestNameController.text != '')
                        ? _guestNameController.text
                        : 'Anonymous',
                    room: room.code,
                    price: room.price,
                    deposit: int.parse(_depositController.text == ''
                        ? '0'
                        : _depositController.text),
                    device: guestController.device.value,
                  );
                  Get.defaultDialog(
                    title: "Check In",
                    titlePadding: EdgeInsets.all(10),
                    titleStyle:
                        GoogleFonts.kodchasan(fontWeight: FontWeight.bold),
                    content: Text(
                      "Apakah tamu telah datang?",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(),
                    ),
                    textConfirm: 'Ya',
                    textCancel: 'Tidak',
                    onConfirm: () async {
                      try {
                        await GuestSheet.insert(guest.toJson());
                        final updateRoom = Room(
                          id: room.id,
                          code: room.code,
                          name: room.name,
                          isUse: true,
                          status: uuid,
                          price: room.price,
                        );
                        await RoomSheet.update(room.id!, updateRoom.toJson());
                        roomController.updateData();

                        Get.offAllNamed('/');
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
