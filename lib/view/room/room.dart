import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanzos_homestay/api/sheet/room_sheet.dart';
import 'package:sanzos_homestay/component/appbar/custom_appbar.dart';
import 'package:sanzos_homestay/constant/theme.dart';
import 'package:sanzos_homestay/controller/room_controller.dart';
import 'package:sanzos_homestay/view/room/room_view.dart';
import 'package:skeleton_text/skeleton_text.dart';

class Room extends StatelessWidget {
  Room({Key? key}) : super(key: key);
  final roomController = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    return GetX<RoomController>(
      init: RoomController(),
      initState: (_) {},
      builder: (cRoom) {
        return Scaffold(
          appBar: CustomAppbar(title: "Sanzos Homestay Medan"),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SafeArea(
              child: (cRoom.isLoading.value)
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 150,
                      ),
                      itemBuilder: (context, index) {
                        return SkeletonAnimation(
                          shimmerColor: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          shimmerDuration: 1000,
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: shadowList,
                            ),
                          ),
                        );
                      },
                    )
                  : RoomView(),
            ),
          ),
        );
      },
    );
  }
}
