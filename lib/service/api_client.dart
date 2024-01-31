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
    _handleResponse(response);

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> post(String path, [Map<String, dynamic>? data]) async {
    final response = await httpClient.post(
      Uri.parse('$baseUrl$path'),
      headers: {'Content-Type': 'application/json'},
      body: data != null ? json.encode(data) : null,
    );
    _handleResponse(response);

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> put(String path, [Map<String, dynamic>? data]) async {
    final response = await httpClient.post(
      Uri.parse('$baseUrl$path'),
      headers: {'Content-Type': 'application/json'},
      body: data != null ? json.encode(data) : null,
    );
    _handleResponse(response);

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> delete(String path) async {
    final response = await httpClient.delete(
      Uri.parse('$baseUrl$path'),
    );
    _handleResponse(response);

    return json.decode(response.body);
  }

  void _handleResponse(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(response);
    }
  }
}
