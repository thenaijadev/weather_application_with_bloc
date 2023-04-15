import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer';

class LocationProvider {
  Future<Map<String, dynamic>> getLocation(String? city) async {
    var url = Uri.parse(
      'https://api.openweathermap.org/geo/1.0/direct?q=$city&limit=5&appid=68460aac14c8c61f6def6315d7ef13af',
    );
    var response = await http.Client().get(
      url,
    );

    if (response.statusCode == 200) {
      final arr = jsonDecode(response.body);
      final responseMap = arr[0];
      log("$responseMap");
      return responseMap;
    } else {
      throw Exception();
    }
  }
}
