import 'package:intl/intl.dart';
dataTimeFormateConverter(String inputDateTimeString){
  final inputDateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
  final inputDateTime = inputDateFormat.parse(inputDateTimeString);
  return inputDateTime;
}

dataTimeFormateConverter1(String inputDateTimeString){
  final inputDateTime = dataTimeFormateConverter(inputDateTimeString);
  final outputDateFormat = DateFormat("E, MMM d • h:mm a", 'en_US');
  final outputDateTimeString = outputDateFormat.format(inputDateTime);
  return outputDateTimeString;
}


dataTimeFormateConverter2(String inputDateTimeString){
  final inputDateTime = dataTimeFormateConverter(inputDateTimeString);
  final dayOfMonth = DateFormat('d').format(inputDateTime);
  final month = DateFormat('MMM').format(inputDateTime);
  final dayOfWeek = DateFormat('E').format(inputDateTime);
  final time = DateFormat('h:mm a').format(inputDateTime);

  final outputFormat = '$dayOfMonth${_ordinal(dayOfMonth)} $month- $dayOfWeek -$time';
  return outputFormat;
}

String _ordinal(String input) {
  final int number = int.parse(input);
  if (number % 10 == 1 && number % 100 != 11) {
    return 'st';
  } else if (number % 10 == 2 && number % 100 != 12) {
    return 'nd';
  } else if (number % 10 == 3 && number % 100 != 13) {
    return 'rd';
  } else {
    return 'th';
  }
}

Map<String, dynamic> dataTimeFormateConverter3(String inputDateTimeString) {
  final inputDate = DateTime.parse(inputDateTimeString);
  final dateFormat = DateFormat("d MMMM, y");
  final day = DateFormat('d').format(inputDate);
  final month = DateFormat('m').format(inputDate);
  final year = DateFormat('y').format(inputDate);
  final formattedDate = dateFormat.format(DateTime(int.parse(year), int.parse(month), int.parse(day)));
  final timeFormat = DateFormat("EEEE, h:mma");
  final formattedStartTime = timeFormat.format(inputDate);
  final formattedEndTime = timeFormat.format(inputDate.add(const Duration(hours: 5)));

  // Create the map
  final result = {
    'date': formattedDate,
    'time': '$formattedStartTime - $formattedEndTime',
  };

  return result;
}






