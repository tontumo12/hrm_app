import 'package:flutter_svg/svg.dart';
import 'package:hrm_app/base/base_page.dart';
import 'package:hrm_app/models/timekeeping/timekeeping_model.dart';
import 'package:hrm_app/pages/widgets/timekeeping/time_keeping_controller.dart';
import 'package:hrm_app/utils/app_path.dart';
import 'package:hrm_app/utils/text_style.dart';
import 'package:hrm_app/widgets/draw_wiget.dart';
import 'package:hrm_app/widgets/header_app_bar/header_app_bar_master.dart';

class TimeKeepingPage extends BaseScreen<TimeKeepingController>{
  TimeKeepingPage({Key? key}) : super(key: key);

  @override
  TimeKeepingController putController() => TimeKeepingController();

  @override
  Widget builder() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: HeaderAppBarMasTer(
          title: 'Chấm công',
          functionLeft: () {},
          functionRight: () {},
        )
      ),
      drawer: DrawWidget(),
      body: SingleChildScrollView(
        child:Obx(() => Column(
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppPath.icTimeKeeping,
                  width: 150,
                  height: 150,
                ),                
              ],
            ),
            const SizedBox(height: 20),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
              color: const Color(0xFF050B5B),
              textColor: Colors.white,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal:64.0,vertical: 14.0),
                child: Text("CLICK ĐỂ CHECKIN"),
              ),
              onPressed: () => {
                controller.postTimeKeeping()
                // Get.toNamed(AppRouter.routerHome)
              }
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Bấm vào nút trên để chấm công theo định vị GPS Hoặc:', style: TextUtils().boldQuickSand.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFA3A3A3),
                )),
              ]
            ),
            const SizedBox(height: 20),
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add),
                  const SizedBox(width: 10),
                  Text('Làm đơn xin nghỉ', style: TextUtils().boldQuickSand.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF050B5B),
                  )),
                ],
              ),
              onTap: () {
                controller.showAddChildAssetModal(context);
              }
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.check_circle_outline),
                        const SizedBox(width: 10),
                        Text('Lưu ý khi chấm công GPS', style: TextUtils().boldQuickSand.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF050B5B),
                        )),
                      ]
                    ),
                    Divider(),
                    Row(
                      children: [
                        const Icon(Icons.done, color: Colors.green),
                        const SizedBox(width: 10),
                        Text('Cho phép app sử dụng vị trí', style: TextUtils().boldQuickSand.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF050B5B),
                        )),
                      ]
                    ),
                    const SizedBox(height: 10),
                     Row(
                      children: [
                        const Icon(Icons.done, color: Colors.green),
                        const SizedBox(width: 10),
                        Text('Kết nối mạng trước khi chấm công', style: TextUtils().boldQuickSand.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF050B5B),
                        )),
                      ]
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.done, color: Colors.green),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text('Thực hiện chấm công trong phạm vi văn phòng cho phép', style: TextUtils().boldQuickSand.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF050B5B),
                          )),
                        )
                      ]
                    ),
                  ],
                )
              )
            ),
            ListTile(
              title: Text('Thời gian chấm công', style: TextUtils().boldQuickSand.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold
              )),
            ),
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
                        flex: 3,
                        child: Text('Stt', style: TextUtils().boldQuickSand.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            )),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text('Thời gian điểm danh', style: TextUtils().boldQuickSand.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            )),
                      )
                    ],
                  )
                )
              )
            ),
            for(int index = 0; index <  controller.timeKeepingModel.length; index++)
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
                          flex: 3,
                          child: Text((index + 1).toString(), style: TextUtils().mediumQuickSand.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                              )),
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(controller.timeKeepingModel[index].dateTimeKeeping, style: TextUtils().mediumQuickSand.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                              )),
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