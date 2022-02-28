import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:sanzos_homestay/api/sheet/guest_sheet.dart';
import 'package:sanzos_homestay/model/guest/guest.dart';
import 'package:sanzos_homestay/services/device.dart';
import 'package:uuid/uuid.dart';

class GuestController extends GetxController {
  var device = 'device'.obs;

  var isMoreThanOneDay = false.obs;
  var isKeyDeposit = false.obs;

  var isLoading = true.obs;

  var checkout = DateTime.now().add(const Duration(days: 1)).obs;
  var totalGuest = 0.obs;
  var guest = Guest(
    id: const Uuid().v1(),
    checkIn: '000',
    checkOut: '000',
    guestName: 'Anonymous',
    room: '000',
    price: 0,
    deposit: 0,
    device: 'device',
  ).obs;

  @override
  void onInit() async {
    await GuestSheet.init();

    await getTotalGuest();
    device.value = await getDevice();

    super.onInit();
  }

  switchMoreThanOneDay() => isMoreThanOneDay.value = !isMoreThanOneDay.value;
  switchKeyDeposit() => isKeyDeposit.value = !isKeyDeposit.value;

  setCheckOut(date) => checkout.value = date;

  getGuest(guestId) async {
    final _guest = await GuestSheet.getById(guestId);
    if (_guest != null) {
      guest.value = _guest;
      isLoading.value = false;
      update();
    }
  }

  getTotalGuest() async {
    final _guest = await GuestSheet.getLastGuest();
    if (_guest != null) {
      guest.value = _guest;
      isLoading.value = false;
    }
  }
}
