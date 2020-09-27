import 'dart:convert';

import 'package:http/http.dart' as http;

const String API_KEY = 'AIzaSyAZ8bLcH20jlzb78FfjUIKcl5mlpj-LZHc';

class LocationHelper {
  static String generateLocationPreviewImage({double lat, double long}) {
    final baseUrl = 'https://maps.googleapis.com/maps/api/staticmap';
    final position = 'center=$lat,$long';
    final params = 'zoom=16&size=600x300&maptype=roadmap';
    final markers = 'markers=color:red%7Clabel:A%7C$lat,$long';
    final key = 'key=$API_KEY';
    return '$baseUrl?$position&$params&$markers&$key';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$API_KEY';
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
