import 'package:commitment_client/models/commitment_info.dart';
import 'package:commitment_client/service/api_client.dart';

class CommitmentService {
  final ApiClient apiClient;

  CommitmentService(this.apiClient);

  Future<List<CommitmentInfo>> getCommitments() async {
    final data = await apiClient.get('/');
    return (data as List)
        .map((itemJson) => CommitmentInfo.fromJson(itemJson))
        .toList();
  }

  Future<CommitmentInfo> createCommitment(Map<String, dynamic> itemData) async {
    final data = await apiClient.post('/', itemData);
    return CommitmentInfo.fromJson(data);
  }
}
