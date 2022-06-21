import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  /// Mocks a login process
  final isLoggedIn = false.obs;
  bool get isLoggedInValue => isLoggedIn.value;
  final box = GetStorage();

  Future<void> checkLogin() async {
    final pref = await SharedPreferences.getInstance();
    if(pref.getString('token') != null){
      isLoggedIn.value = true;
    }else{
      isLoggedIn.value = false;
    }
  }

  Future<void> logout() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
    isLoggedIn.value = false;
  }

  int getUserId(){
    var userInfo = box.read('userInfo');
    int id = int.parse(userInfo['userid']);
    return id;
  }

  String getUserRole(){
    var userInfo = box.read('userInfo');
    return userInfo['permission'];
  }

  String getUserName(){
    var userInfo = box.read('userInfo');
    return userInfo['username'];
  }
}
