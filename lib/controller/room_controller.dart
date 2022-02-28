import 'package:get/get.dart';
import 'package:sanzos_homestay/api/sheet/room_sheet.dart';
import 'package:sanzos_homestay/model/room/room.dart';

class RoomController extends GetxController {
  var isLoading = true.obs;
  var isUpdate = false.obs;

  RxList<Room> rooms = <Room>[].obs;

  @override
  void onInit() async {
    await RoomSheet.init();

    fetchRoom();

    super.onInit();
  }

  fetchRoom() async {
    final _rooms = await RoomSheet.getAll();
    rooms.value = _rooms;
    if (rooms.isNotEmpty) {
      isLoading.value = false;
      update();
    }
  }

  updateData() async {
    isLoading.value = true;
    final _rooms = await RoomSheet.getAll();
    rooms.value = _rooms;
    if (rooms.isNotEmpty) {
      isLoading.value = false;
      update();
    }
  }
}
