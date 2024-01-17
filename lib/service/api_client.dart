import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_config/flutter_config.dart';

class ApiClient {
  final String baseUrl;
  final http.Client httpClient;

  ApiClient({http.Client? client})
      : baseUrl = FlutterConfig.get('BASE_URL'),
        httpClient = client ?? http.Client();

  Future<Map<String, dynamic>> get(String path) async {
    final response = await httpClient.get(Uri.parse('$baseUrl$path'));
    // 여기에 응답 처리 로직을 추가
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> post(
      String path, Map<String, dynamic> data) async {
    final response = await httpClient.post(
      Uri.parse('$baseUrl$path'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    // 여기에 응답 처리 로직을 추가
    return json.decode(response.body);
  }

  // 필요한 경우 put, delete 등의 메서드를 추가할 수 있습니다.
}
