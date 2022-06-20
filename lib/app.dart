import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hrm_app/routers/app_routes.dart';
import 'package:hrm_app/widgets/loading_wrapper.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(
      AppLifecycleState appLifecycleState) async {
    super.didChangeAppLifecycleState(appLifecycleState);

    if (appLifecycleState == AppLifecycleState.inactive) {
      // todo
    }

    if (appLifecycleState == AppLifecycleState.resumed) {
      // todo
    }

    if (appLifecycleState == AppLifecycleState.paused) {}
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
          child: GetMaterialApp(
            enableLog: true,
            debugShowCheckedModeBanner: false,
            title: 'APP',
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: LoadingWrapper(child: child),
              );
            },
            initialRoute: AppRouter.routerLogin,
            getPages: AppRouter.getPages,
          ),
        );
  }
}

class DismissKeyboard extends StatelessWidget {
  final Widget child;

  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
