

import 'package:hrm_app/base/base_page.dart';
import 'package:hrm_app/widgets/header_app_bar/header_app_bar_controller.dart';

class HeaderAppBarMasTer extends BaseScreen<HeaderAppBarController> {
  HeaderAppBarMasTer({required this.title, this.iconLeft, this.iconRight, required this.functionLeft, required this.functionRight, Key? key}) : super(key: key);

  @override
  HeaderAppBarController putController() => HeaderAppBarController();

  final String title;
  final Icon? iconLeft;
  final Icon? iconRight;
  final Function functionLeft;
  final Function functionRight;

  // Widget _appBarButton(BuildContext context){
  //   return IconButton(
  //     icon: iconLeft ?? const Icon(Icons.reorder),
  //     iconSize: 30.0,
  //     color: Colors.white,
  //     onPressed: () {
  //       functionLeft();
  //     });
  // }

  @override
  Widget builder() {
    return AppBar(
      // leading: _appBarButton(context),
      backgroundColor: const Color(0xFF050B5B),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        InkWell(
          child: iconRight ?? const Icon(Icons.logout),
          onTap: () {functionRight();},
        )
      ],
      elevation: 0.0,
    );
  }
}
