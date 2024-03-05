import 'dart:developer';

import 'package:colleges_api/src/models/univercity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UniversityService {
  static Future<List<University>> getUniversities() async {
    final response = await http
        .get(Uri.parse('http://universities.hipolabs.com/search?name=middle'));

    if (response.statusCode == 200) {
      log(response.body);
      Iterable universitiesJson = json.decode(response.body);
      List<University> universities =
          universitiesJson.map((json) => University.fromJson(json)).toList();
      return universities;
    } else {
      throw Exception('Failed to load universities');
    }
  }
}
