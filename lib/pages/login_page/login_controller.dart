import 'dart:convert';

import 'package:hrm_app/base/base_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrm_app/respository/login_repository.dart';
import 'package:hrm_app/services/auth_service.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:hrm_app/routers/app_routes.dart';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends BaseController {

  final LoginRepository loginRepository;

  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  RxBool isLoading = false.obs;

  final box = GetStorage();

  LoginController(this.loginRepository);

  @override
  void onInit() {
    super.onInit();
    AuthService.to.checkLogin();
    if(AuthService.to.isLoggedInValue){
      Get.toNamed(AppRouter.routerHome);
    }
  }

  Future<void> login() async {
    try{
      isLoading = true.obs;
      Map data = {
        "userName":usernameTextController.text,
        "passWord": md5.convert(utf8.encode(passwordTextController.text)).toString()
      };
      String response = await loginRepository.postLogin(data);
      Map<String, dynamic> payload = Jwt.parseJwt(response);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString("token", response);
      sharedPreferences.setString("userInfo", jsonEncode(payload));
      isLoading = false.obs;
      Get.toNamed(AppRouter.routerHome);
    } catch (err) {
      print(err);
    }
  }
}