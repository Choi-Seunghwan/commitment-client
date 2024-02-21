import 'package:commitment_client/strings/strings.dart';

String formatExpirationDate(DateTime date) {
  DateTime now = DateTime.now();
  Duration difference = date.difference(now);

  int days = difference.inDays.abs();

  return '$days${Strings.UI_FORMANT_EXPIRATION}';
}
