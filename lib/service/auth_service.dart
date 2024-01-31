import 'package:commitment_client/models/user_my_info.dart';
import 'package:commitment_client/service/api_client.dart';

class AuthService {
  final ApiClient apiClient;

  AuthService(this.apiClient);

  String? _token;
  UserMyInfo? _userMyInfo;

  String? get token => _token;
  UserMyInfo? get userMyInfo => _userMyInfo;

  Future<dynamic> signUpGuest() async {
    final data = await apiClient.post('/auth/sign-up-guest');
    _token = data['token'];
    _userMyInfo = UserMyInfo.fromJson(data['user']);
  }

  Future<dynamic> signIn() async {
    final data = await apiClient.post('/auth/token');
    _userMyInfo = UserMyInfo.fromJson(data['user']);
  }
}
