import 'package:intl/intl.dart';

String formatDate(String dateString) {
  final dateTime = DateTime.parse(dateString);
  final format = DateFormat("yyyy.MM.dd HH:mm");

  return format.format(dateTime);
}