import 'package:estacionamento/app/utils/strings.dart';
import 'package:intl/intl.dart';

String formatYmdHmDate(DateTime? date) {
  if (date == null) return Strings.noDateFound;
  return DateFormat.yMd('pt').add_Hm().format(date);
}
