import 'package:hrm_app/base/base_controller.dart';

class LoginController extends BaseController {
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  RxBool isLoading = false.obs;
}