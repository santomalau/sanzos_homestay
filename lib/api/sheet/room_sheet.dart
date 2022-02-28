import 'package:gsheets/gsheets.dart';
import 'package:sanzos_homestay/api/api_client_sheet.dart';
import 'package:sanzos_homestay/model/room/room.dart';

class RoomSheet {
  static final _gsheets = GSheets(ApiClientSheet.credentials);
  static Worksheet? _roomSheet;

  static Future init() async {
    try {
      final spreadsheet =
          await _gsheets.spreadsheet(ApiClientSheet.spreadsheetId);
      _roomSheet =
          await ApiClientSheet.getWorkSheet(spreadsheet, title: 'Room');

      final firstRow = RoomField.getFields();
      _roomSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error $e');
    }
  }

  static Future<Room?> getById(int id) async {
    if (_roomSheet == null) return null;
    final json = await _roomSheet!.values.map.rowByKey(id, fromColumn: 1);
    return json == null ? null : Room.fromJson(json);
  }

  static Future<List<Room>> getAll() async {
    if (_roomSheet == null) return <Room>[];
    final rooms = await _roomSheet!.values.map.allRows();
    return rooms == null ? <Room>[] : rooms.map(Room.fromJson).toList();
  }

  static Future<bool> update(int id, Map<String, dynamic> room) async {
    if (_roomSheet == null) return false;
    return _roomSheet!.values.map.insertRowByKey(id, room);
  }
}
