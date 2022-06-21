import 'package:hrm_app/base/base_page.dart';
import 'package:hrm_app/pages/widgets/info/info_controller.dart';
import 'package:hrm_app/widgets/draw_wiget.dart';
import 'package:hrm_app/widgets/header_app_bar/header_app_bar_master.dart';

class InfoPage extends BaseScreen<InfoController>{
  InfoPage({Key? key}) : super(key: key);

  @override
  InfoController putController() => InfoController();

  @override
  Widget builder() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: HeaderAppBarMasTer(
          title: 'Thông tin chung',
          functionLeft: () {},
          functionRight: () {},
        )
      ),
      drawer: DrawWidget(),
      body: SingleChildScrollView(
        child: Column(
          
        )
      )
    );
  }
}