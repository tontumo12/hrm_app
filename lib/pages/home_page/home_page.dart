import 'package:hrm_app/base/base_page.dart';
import 'package:hrm_app/pages/home_page/home_page_controller.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomePage extends BaseScreen<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  @override
  HomePageController putController() => HomePageController();

  final List<Widget> _listTab = [
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
    const SizedBox(),
  ];

  @override
  Widget builder() {
    return PersistentTabView(
        context,
        screens: _listTab,
        resizeToAvoidBottomInset: false,
        confineInSafeArea: true,
        onItemSelected: (index) {
          // controller.ontap(index);
        },
        handleAndroidBackButtonPress: true,
        navBarStyle: NavBarStyle.style3,
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.dashboard),
            title: 'Dashboard',
            activeColorPrimary: Color(0xFF050B5B),
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.check_sharp),
            title: 'Chấm công',
            activeColorPrimary: Color(0xFF050B5B),
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.calendar_month),
            title: 'Nghỉ phép',
            activeColorPrimary: Color(0xFF050B5B),
            inactiveColorPrimary: Colors.grey,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(Icons.admin_panel_settings),
            title: 'Thông tin',
            activeColorPrimary: Color(0xFF050B5B),
            inactiveColorPrimary: Colors.grey,
          ),
          // PersistentBottomNavBarItem(
          //   icon: const Icon(Icons.analytics),
          //   title: 'Thống kê',
          //   activeColorPrimary: Color(0xFF050B5B),
          //   inactiveColorPrimary: Colors.grey,
          // ),
        ],
    );
  }
}