import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanzos_homestay/component/tile/custom_grid_tile.dart';
import 'package:sanzos_homestay/constant/theme.dart';
import 'package:sanzos_homestay/controller/guest_controller.dart';
import 'package:sanzos_homestay/controller/room_controller.dart';
import 'package:sanzos_homestay/util/room_util.dart';
import 'package:skeleton_text/skeleton_text.dart';

class RoomView extends StatelessWidget {
  const RoomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roomController = Get.find<RoomController>();
    final guestController = Get.put(GuestController());

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
      ),
      itemCount: roomController.rooms.length,
      itemBuilder: (context, index) {
        final room = roomController.rooms.value[index];

        return CustomGridTile(
          room: room,
          onTap: () async {
            getRoomRoute(room);
          },
        );
      },
    );
  }
}
