import 'dart:convert';
import 'package:commitment_client/models/commitment_info.dart';
import 'package:flutter/services.dart';

Future<List<CommitmentInfo>> loadCommitmentInfoData() async {
  String jsonString = await rootBundle.loadString('lib/data/data.json');
  List<dynamic> jsonResponse = json.decode(jsonString);
  return jsonResponse.map((data) => CommitmentInfo.fromJson(data)).toList();
}
