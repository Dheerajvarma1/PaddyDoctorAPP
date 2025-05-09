import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class ApiService {
  static String apiUrl = dotenv.env['API_URL'] ?? "";

  static Future<Map<String, dynamic>?> uploadImage(File imageFile) async {
    try {
      if (apiUrl.isEmpty) {
        throw "API URL is missing. Please check your .env file.";
      }

      print(
        "🔍 API URL from .env: $apiUrl",
      ); // ✅ Debug: Check if API URL is loaded correctly

      var url = Uri.parse(apiUrl);
      var request = http.MultipartRequest("POST", url);

      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          imageFile.path,
          contentType: MediaType.parse(
            lookupMimeType(imageFile.path) ?? "image/jpeg",
          ),
        ),
      );

      var response = await request.send();
      var responseData = await response.stream.bytesToString();
      print("✅ API Response: $responseData");

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(responseData);
        return jsonResponse;
      } else {
        print("❌ API Error: Status ${response.statusCode}");
        return {"error": "Failed to upload image"};
      }
    } catch (e) {
      print("❌ Exception: $e");
      return {"error": e.toString()};
    }
  }
}
