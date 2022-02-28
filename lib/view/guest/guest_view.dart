import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sanzos_homestay/api/sheet/guest_sheet.dart';
import 'package:sanzos_homestay/component/button/custom_elevated_button.dart';
import 'package:sanzos_homestay/component/field/custom_text_form_field.dart';
import 'package:sanzos_homestay/controller/guest_controller.dart';
import 'package:sanzos_homestay/model/guest/guest.dart';
import 'package:sanzos_homestay/view/guest/guest_checkin.dart';
import 'package:sanzos_homestay/view/guest/guest_information.dart';

class GuestView extends StatelessWidget {
  GuestView({Key? key}) : super(key: key);

  bool isOneDay = false;

  @override
  Widget build(BuildContext context) {
    dynamic room = Get.arguments['room'];
    switch (room.status) {
      case 'available':
        return GuestCheckin();
      default:
        return GuestInformation();
    }
  }
}
