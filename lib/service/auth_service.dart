import 'package:commitment_client/service/api_client.dart';

class AuthService {
  final ApiClient apiClient;

  AuthService(this.apiClient);

  Future<dynamic> signUpGuest() async {
    final data = await apiClient.post('/auth/sign-up-guest');
    final a;
  }
}
