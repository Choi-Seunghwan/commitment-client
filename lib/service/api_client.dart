import 'dart:convert';
import 'package:commitment_client/environment.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;
  final http.Client httpClient;

  ApiClient({http.Client? client})
      : baseUrl = Environment.baseUrl,
        httpClient = client ?? http.Client();

  Future<Map<String, dynamic>> get(String path) async {
    final response = await httpClient.get(Uri.parse('$baseUrl$path'));
    _handleResponse(response);

    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> post(String path, [Map<String, dynamic>? data]) async {
    try {
      print('here');

      final response = await httpClient.post(
        Uri.parse('$baseUrl$path'),
        headers: {'Content-Type': 'application/json'},
        body: data != null ? json.encode(data) : null,
      );
      _handleResponse(response);
      return json.decode(response.body);
    } catch (e) {
      print('eerr');
      throw Exception('hlehl');
    }
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
    String a;
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(response);
    }
  }
}
