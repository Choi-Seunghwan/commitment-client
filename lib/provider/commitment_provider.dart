import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:commitment_client/models/commitment_info.dart';

class CommitmentProvider with ChangeNotifier {
  List<CommitmentInfo> _commitments = [];

  List<CommitmentInfo> get commitments => _commitments;

  Future<void> fetchCommitments() async {
    // final url = 'https://your-api-url.com/commitments';
    try {
      // final response = await http.get(Uri.parse(url));
      // final extractedData = json.decode(response.body) as List<dynamic>;

      final jsonString =
          await rootBundle.loadString('lib/data/commitment-infos.json');
      final extractedData = json.decode(jsonString) as List;

      final List<CommitmentInfo> loadedCommitments = [];
      for (var jsonCommitment in extractedData) {
        loadedCommitments.add(CommitmentInfo.fromJson(jsonCommitment));
      }
      _commitments = loadedCommitments;
      notifyListeners(); // UI 업데이트를 위해 호출
    } catch (error) {
      throw error;
    }
  }
}
