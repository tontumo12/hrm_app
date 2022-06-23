import 'package:hrm_app/base/base_page.dart';
import 'package:hrm_app/pages/widgets/anunnel/anunnel_controller.dart';
import 'package:hrm_app/utils/text_style.dart';
import 'package:hrm_app/widgets/draw_wiget.dart';
import 'package:hrm_app/widgets/header_app_bar/header_app_bar_master.dart';

class AnunnelPage extends BaseScreen<AnunnelController>{
  AnunnelPage({Key? key}) : super(key: key);
  
  @override
  AnunnelController putController() => AnunnelController();

  @override
  Widget builder() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: HeaderAppBarMasTer(
          title: 'Nghỉ phép',
          iconRight: const Icon(Icons.add),
          functionLeft: () {},
          functionRight: () => controller.showAddChildAssetModal(context),
        )
      ),
      drawer: DrawWidget(),
      body: SingleChildScrollView(
        child:Obx(() => Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Nghỉ phép năm', style: TextUtils().boldQuickSand.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  )),
                )
            ),
            for(var data in controller.data)
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
                              Row(
                                children: [
                                  const Icon(Icons.timelapse),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(data.fromTime.substring(0,16) + ' - ' + data.toTime.substring(0,16), style: TextUtils().mediumQuickSand.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold
                                    )),
                                  )
                                ],
                              ),
                              const SizedBox(width: 10),
                              Row(
                                children: [
                                  const Icon(Icons.whatshot),
                                  const SizedBox(width: 10),
                                  Text('Trạng thái: ', style: TextUtils().mediumQuickSand.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                  )),
                                  Text(controller.returnStatus(data.status).status, style: TextUtils().mediumQuickSand.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: controller.returnStatus(data.status).color
                                  )),
                                ],
                              ),
                              // const SizedBox(height: 10),
                              // Row(
                              //   children: [
                              //     const Icon(Icons.supervisor_account),
                              //     const SizedBox(width: 10),
                              //     Text('Người duyệt:', style: TextUtils().mediumQuickSand.copyWith(
                              //       fontSize: 12,
                              //       fontWeight: FontWeight.bold
                              //     )),
                              //     const SizedBox(width: 10),
                              //     Text('Nguyễn tôn tú', style: TextUtils().mediumQuickSand.copyWith(
                              //       fontSize: 12,
                              //       fontWeight: FontWeight.bold,
                              //       color: Colors.green
                              //     )),
                              //   ],
                              // )
                            ]
                          )
                        ),
                        Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                child: Icon(Icons.edit),
                                onTap: () {}
                              ),
                              SizedBox(width: 10),
                              InkWell(
                                child: Icon(Icons.delete),
                                onTap: () {}
                              )
                            ]
                          )
                        )
                      ],
                    )
                  )
                )
              )
          ]
        ))
      )
    );
  }
}