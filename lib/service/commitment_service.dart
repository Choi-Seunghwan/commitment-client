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

  Future<dynamic> getUserCommitments() async {
    final data = await apiClient.get('/commitment-activity');
    List<CommitmentInfo> progressCommitments = (data['progressCommitments'] as List).map((c) => CommitmentInfo.fromJson(c)).toList();
    List<CommitmentInfo> completedCommitments = (data['completedCommitments'] as List).map((c) => CommitmentInfo.fromJson(c)).toList();

    return {'progressCommitments': progressCommitments, 'completedCommitments': completedCommitments};
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
