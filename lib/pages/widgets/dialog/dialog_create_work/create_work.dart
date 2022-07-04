import 'package:hrm_app/base/base_page.dart';
import 'package:hrm_app/pages/widgets/dialog/dialog_create_work/create_work_controller.dart';
import 'package:hrm_app/utils/text_style.dart';

class CreateWork extends BaseScreen<CreateWorkController> {
  CreateWork({Key? key}) : super(key: key);
  
  @override
  CreateWorkController putController() => CreateWorkController();

  @override
  Widget builder() {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Tiêu đề công việc:',
                      style: TextUtils().boldQuickSand.copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 6,
                    child: TextField(
                      controller: controller.controllerTitle,
                      decoration: const InputDecoration(
                          hintText: 'Tiêu đề công việc')),
                  ),
                ]
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Nội dung công việc:',
                      style: TextUtils().boldQuickSand.copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 6,
                    child: TextField(
                      minLines: 5,
                      maxLines: 10,
                      controller: controller.controllerDetail,
                      decoration: const InputDecoration(
                          hintText: 'Nội dung công việc')),
                  ),
                ]
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Deadline: ',
                      style: TextUtils().boldQuickSand.copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 6,
                    child: InkWell(
                      onTap: () {
                        controller.selectDate();
                      },
                      child: TextField(
                        readOnly: true,
                        controller: controller.dateLine,
                        onTap: () {
                        controller.selectDate();
                      },),
                    ),
                  ),
                ]
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)),
                      color: const Color(0xFF050B5B),
                      textColor: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal:64.0,vertical: 14.0),
                        child: Text("Tạo công việc"),
                      ),
                      onPressed: () => {
                        controller.createWork()
                        // Get.toNamed(AppRouter.routerHome)
                      }
                    ),
                  ]
                ),
              SizedBox(height: 30),
            ]
          )
        )
      )
    );
  }
}