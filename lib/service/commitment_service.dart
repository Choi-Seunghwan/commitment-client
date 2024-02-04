import 'package:commitment_client/models/commitment_info.dart';
import 'package:commitment_client/service/api_client.dart';
import 'package:commitment_client/types/create_commitment_req.dart';

class CommitmentService {
  final ApiClient apiClient;

  CommitmentService(this.apiClient);

  Future<List<CommitmentInfo>> getCommitments() async {
    final data = await apiClient.get('/');
    return (data as List).map((itemJson) => CommitmentInfo.fromJson(itemJson)).toList();
  }

  Future<CommitmentInfo> createCommitment(CreateCommitmentReq req) async {
    final data = await apiClient.post('/', req.toJson());
    return CommitmentInfo.fromJson(data);
  }

  Future<dynamic> getUserCommitments(type, status) async {
    final Map<String, String> query = {type: type, status: status};
    final data = await apiClient.get('/commitment-activity', query);
    List<CommitmentInfo> commitments = (data['commitments'] as List).map((c) => CommitmentInfo.fromJson(c)).toList();

    return {commitments: commitments};
  }

  Future<dynamic> renewCommitment(String commitmentId) async {
    final data = await apiClient.post('/commitment-activity/$commitmentId/renew');
    dynamic commitment = CommitmentInfo.fromJson(data['commitment']);

    return {commitment: commitment};
  }

  Future<dynamic> completeCommitment(String commitmentId) async {
    final data = await apiClient.post('/commitment-activity/$commitmentId/complete');
    dynamic commitment = CommitmentInfo.fromJson(data['commitment']);

    return {commitment: commitment};
  }
}
