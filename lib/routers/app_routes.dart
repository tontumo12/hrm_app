import 'package:get/get.dart';
import 'package:hrm_app/pages/detail_page/detail_page.dart';
import 'package:hrm_app/pages/home_page/home_page.dart';
import 'package:hrm_app/pages/login_page/login.dart';

class AppRouter {
  static const String routerSplash = '/splash';
  static const String routerLogin = '/routerLogin';
  static const String routerHome = '/home';
  static const String routerMain = '/mainPage';
  static const String routerReport = '/report';
  static const String healthCheckPage = '/healthCheckPage';
  static const String lessonDetailPage = '/lessonDetailPage';
  static const String newsfeedDetailPage = '/newsfeedDetailPage';
  static const String detailPage = '/detailPage';

  static List<GetPage<dynamic>> getPages = <GetPage<dynamic>>[
    GetPage<LoginPage>(
      name: routerLogin,
      page: () => LoginPage(),
    ),
    GetPage<HomePage>(
      name: routerHome,
      page: () => HomePage(),
    ),
    GetPage<DetailPage>(
      name: detailPage,
      page: () => DetailPage(),
    ),
  ];
}
