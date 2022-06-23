import 'package:hrm_app/base/base_page.dart';
import 'package:hrm_app/models/work/work_model.dart';
import 'package:hrm_app/pages/widgets/dashboard/dashboard_controller.dart';
import 'package:hrm_app/routers/app_routes.dart';
import 'package:hrm_app/utils/text_style.dart';
import 'package:hrm_app/widgets/draw_wiget.dart';
import 'package:hrm_app/widgets/header_app_bar/header_app_bar_master.dart';

class Dashboard extends BaseScreen<DashboardController>{
  Dashboard({Key? key}) : super(key: key);
  
  @override
  DashboardController putController() => DashboardController();

  @override
  Widget builder() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: HeaderAppBarMasTer(
          title: 'Trang chủ',
          iconRight: const Icon(Icons.add),
          functionLeft: () {},
          functionRight: () => controller.showAddChildAssetModal(context),
        )
      ),
      drawer: DrawWidget(),
      body: SingleChildScrollView(
        child: Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Công việc trong ngày', style: TextUtils().boldQuickSand.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold
              )),
            ),
            for(final Work data in controller.data)
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.workTitle, style: TextUtils().boldQuickSand.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                              )),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(Icons.timelapse),
                                  const SizedBox(width: 10),
                                  Text(data.dateLine, style: TextUtils().mediumQuickSand.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                  )),
                                  const SizedBox(width: 10),
                                  Text('Đang làm', style: TextUtils().mediumQuickSand.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow
                                  )),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(Icons.supervisor_account),
                                  const SizedBox(width: 10),
                                  Text('Người làm:', style: TextUtils().mediumQuickSand.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                  )),
                                  const SizedBox(width: 10),
                                  Text('Nguyễn tôn tú', style: TextUtils().mediumQuickSand.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green
                                  )),
                                ],
                              )
                            ]
                          )
                        ),
                        Expanded(
                          flex: 3,
                          child: InkWell(
                            child: Icon(Icons.remove_red_eye),
                            onTap: () {
                              controller.choiceDetail(data.workId);
                            }
                          )
                        )
                      ],
                    )
                  )
                )
              )
          ]
        )
      ))
    );
  }
}