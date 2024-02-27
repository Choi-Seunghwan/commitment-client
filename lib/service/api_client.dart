import 'dart:convert';
import 'package:commitment_client/environment.dart';
import 'package:commitment_client/strings/strings.dart';
import 'package:commitment_client/types/constant.dart';
import 'package:commitment_client/utils/toast_util.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  final String baseUrl;
  final http.Client httpClient;

  ApiClient({http.Client? client})
      : baseUrl = Environment.baseUrl,
        httpClient = client ?? http.Client();

  Future<dynamic> _getHeaders() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString(SharedPrefs.userToken);

    final headers = {
      'Content-Type': 'application/json',
      if (userToken != null) 'Authorization': 'Bearer $userToken',
    };

    return headers;
  }

  Future<Map<String, dynamic>> get(String path, [Map<String, String>? query]) async {
    try {
      final response = await httpClient.get(
          Uri.parse('$baseUrl$path').replace(queryParameters: query),
          headers: await _getHeaders());
      _handleResponse(response);

      return json.decode(response.body);
    } catch (e) {
      showSuccessToast(Strings.TOAST_API_ERROR);

      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> post(String path, [Map<String, dynamic>? data]) async {
    try {
      final response = await httpClient.post(
        Uri.parse('$baseUrl$path'),
        headers: await _getHeaders(),
        body: data != null ? json.encode(data) : null,
      );
      _handleResponse(response);
      return json.decode(response.body);
    } catch (e) {
      showSuccessToast(Strings.TOAST_API_ERROR);

      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> put(String path, [Map<String, dynamic>? data]) async {
    try {
      final response = await httpClient.post(
        Uri.parse('$baseUrl$path'),
        headers: await _getHeaders(),
        body: data != null ? json.encode(data) : null,
      );
      _handleResponse(response);

      return json.decode(response.body);
    } catch (e) {
      showSuccessToast(Strings.TOAST_API_ERROR);

      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> delete(String path) async {
    try {
      final response = await httpClient.delete(
        Uri.parse('$baseUrl$path'),
      );
      _handleResponse(response);

      return json.decode(response.body);
    } catch (e) {
      showSuccessToast(Strings.TOAST_API_ERROR);

      throw Exception(e);
    }
  }

  void _handleResponse(http.Response response) {
    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw Exception(response);
    }
  }
}
