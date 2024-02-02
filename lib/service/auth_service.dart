import 'package:commitment_client/models/user_my_info.dart';
import 'package:commitment_client/service/api_client.dart';

class AuthService {
  final ApiClient apiClient;

  AuthService(this.apiClient);

  Future<Map<String, dynamic>> signUpGuest() async {
    final data = await apiClient.post('/auth/sign-up-guest');
    String token = data['token'];
    dynamic userMyInfo = UserMyInfo.fromJson(data['user']);

    return {'token': token, 'userMyInfo': userMyInfo};
  }

  Future<dynamic> signInToken() async {
    final data = await apiClient.post('/auth/token');
    dynamic userMyInfo = UserMyInfo.fromJson(data['user']);

    return {'userMyInfo': userMyInfo};
  }
}
