import 'package:hrm_app/base/base_page.dart';
import 'package:hrm_app/pages/detail_page/detail_controller.dart';
import 'package:hrm_app/utils/text_style.dart';
import 'package:hrm_app/widgets/header_app_bar_child.dart';

class DetailPage extends BaseScreen<DetailController>{
  DetailPage({Key? key}) : super(key: key);

  @override
  DetailController putController() => DetailController();

  @override
  Widget builder() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: HeaderAppBarChild(
          title: 'Chi tiết',
          functionLeft: () {
            Get.back();
          },
          functionRight: () {},
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Text('TEst giao diện', style: TextUtils().boldQuickSand.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      )),
                    ]
                  )
                )
              )
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text('Nội dung công việc:', style: TextUtils().boldQuickSand.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold
              )),
            ),
            SizedBox(height: 10),
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
                        child: Text('nội dung công việc rất chi là dài thườn thượt', style: TextUtils().boldQuickSand.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                        )),
                      )
                    ]
                  )
                )
              )
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
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
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  const Icon(Icons.supervisor_account),
                  const SizedBox(width: 10),
                  Text('Người review:', style: TextUtils().mediumQuickSand.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  )),
                  const SizedBox(width: 10),
                  Text('Nguyễn tôn tú', style: TextUtils().mediumQuickSand.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                  )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Obx(() => SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text('Nội dung trao đổi', style: TextUtils().boldQuickSand.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      )),
                      SizedBox(height: 10,),
                      Divider(),
                      SizedBox(height: 10,),
                      for(var data in controller.data)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.supervisor_account),
                                  const SizedBox(width: 10),
                                  Text('User:', style: TextUtils().mediumQuickSand.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold
                                  )),
                                  const SizedBox(width: 10),
                                  Text(data.commentContent, style: TextUtils().mediumQuickSand.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red
                                  )),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(width: 10),
                                  Text(data.datetimeComment, style: TextUtils().mediumQuickSand.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold
                                  )),
                                ],
                              ),
                              Divider(),
                            ]
                          ),
                        ),
                      SizedBox(height: 10,),
                      TextField(
                          //enabled: !loading,
                          controller: controller.commentTextController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.send),
                            hintText: 'Commnet',

                          ),
                          onSubmitted: (str) {
                            controller.commentAdd();
                          },
                      //  )
                      ),
                    ]
                  )
                )
              )
            )),
            SizedBox(height: 10),
          ]
        ),
      )
    );
  }
}