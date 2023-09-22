String getCountryCode(String countryName) {
  final Map<String, String> countryCodes = {
    'Afghanistan': 'AF',
    'Albania': 'AL',
    'Algeria': 'DZ',
    'Netherlands': 'NL',
    'United States': 'US',
    'Singapore': 'SG',
    'Germany': 'DE',
    'India': 'IN',
    'France': 'FR',
    'Japan': 'JP',
    // Add more countries as needed
  };

  return countryCodes[countryName] ?? 'Unknown';
}