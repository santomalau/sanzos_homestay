import 'package:intl/intl.dart';

convertCheckout(DateTime checkOut) {
  final newCheckOut =
      DateTime(checkOut.year, checkOut.month, checkOut.day, 11, 30, 0);

  return DateFormat('yyyy-MM-dd hh:mm:ss').format(newCheckOut);
}

convertDate(DateTime date) {
  return DateFormat('yyyy-MM-dd hh:mm:ss').format(date);
}
