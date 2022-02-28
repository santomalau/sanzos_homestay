import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

Future<String> getDevice() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    return androidInfo.device!;
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

    return iosInfo.name!; // e.g. "iPod7,1"
  }

  // ignore: todo
  // TODO: For security => When continue session need to access from real device
  return "Error";
}
