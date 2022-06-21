import 'package:hrm_app/config/api_provider.dart';

class LoginRepository {
  ApiProvider provider = ApiProvider();

  Future<String> postLogin(body) async{
    final data = await provider.post("login", body);
    return data!['response'];
  }
}