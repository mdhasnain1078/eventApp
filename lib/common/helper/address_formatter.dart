import 'country_code_picker.dart';

String formatVenue(String venueName, String venueCity, String venueCountry) {
  return '$venueName • $venueCity, ${getCountryCode(venueCountry)}';
}

String addressFormatter(String venueName, String venueCity, String venueCountry){
  String formattedVenue = formatVenue(venueName, venueCity, venueCountry);
  return formattedVenue;
}