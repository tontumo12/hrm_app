import 'package:hrm_app/base/base_page.dart';
import 'package:hrm_app/pages/login_page/login_controller.dart';
import 'package:hrm_app/respository/login_repository.dart';
import 'package:hrm_app/routers/app_routes.dart';

class LoginPage extends BaseScreen<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  LoginController putController() => LoginController(Get.put(LoginRepository()));

  @override
  Widget builder() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 120.0,),
                const SizedBox(height: 15.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Row(
                        children: const <Widget>[
                          Text("Quản lý HRM",style: TextStyle(fontSize: 30.0, color: Colors.black, fontWeight: FontWeight.bold),)
                        ]
                      )
                  ],
                ),
                const SizedBox(height: 15.0,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: <Widget>[
                      //Obx(() => 
                        TextField(
                          //enabled: !loading,
                          controller: controller.usernameTextController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.perm_identity),
                            hintText: 'User name'
                          )
                      //  )
                      ),
                      const SizedBox(height: 10.0,),
                      //Obx(() => 
                        TextFormField(
                          //enabled: !loading,
                          obscureText: true,
                          controller: controller.passwordTextController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.lock),
                            hintText: 'Password'
                          )
                        )
                      //)
                    ]
                  ),
                ),
                const SizedBox(height: 30.0,),
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    if(!controller.isLoading.value)
                      // ignore: deprecated_member_use
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                        color: const Color(0xFF050B5B),
                        textColor: Colors.white,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal:64.0,vertical: 12.0),
                          child: Text("Login"),
                        ),
                        onPressed: () {
                          // Get.toNamed(AppRouter.routerHome);
                          controller.login();
                        }
                      )
                    else
                      const CircularProgressIndicator(
                        //value: controller.value,
                        semanticsLabel: 'Linear progress indicator',
                      ),
                  ],
                ))
              ],
            )
          ),
        ),
      )
    );
  }
}