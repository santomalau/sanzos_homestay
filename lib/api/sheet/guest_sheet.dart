import 'package:gsheets/gsheets.dart';
import 'package:sanzos_homestay/api/api_client_sheet.dart';
import 'package:sanzos_homestay/model/guest/guest.dart';

class GuestSheet {
  static final _gsheets = GSheets(ApiClientSheet.credentials);
  static Worksheet? _guestSheet;

  static Future init() async {
    try {
      final spreadsheet =
          await _gsheets.spreadsheet(ApiClientSheet.spreadsheetId);
      _guestSheet = await ApiClientSheet.getWorkSheet(spreadsheet,
          title: DateTime.now().year.toString());

      final firstRow = GuestField.getFields();
      _guestSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error $e');
    }
  }

  static Future insert(Map<String, dynamic> newGuest) async {
    if (_guestSheet == null) return;

    _guestSheet!.values.map.appendRow(newGuest);
  }

  static Future<Guest?> getById(String id) async {
    if (_guestSheet == null) return null;
    final json = await _guestSheet!.values.map.rowByKey(id, fromColumn: 1);
    return json == null ? null : Guest.fromJson(json);
  }

  static Future<Guest?> getLastGuest() async {
    if (_guestSheet == null) {
      print("object error");
      return null;
    }
    final json = await _guestSheet!.values.map.lastRow();
    return json == null ? null : Guest.fromJson(json);
  }
}
