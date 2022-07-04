import 'package:hrm_app/base/base_page.dart';
import 'package:hrm_app/utils/text_style.dart';

import 'create_annuleave_controller.dart';

class CreateAnnuleavePage extends BaseScreen<CreateAnnuleaveController>{

  @override
  CreateAnnuleaveController putController() => CreateAnnuleaveController();

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
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Loại nghỉ:',
                      style: TextUtils().boldQuickSand.copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 6,
                    child: Obx(() => DropdownButton(
                        value: controller.dataChoiceType.value,
                        items: controller.dataTypeLeave.map<DropdownMenuItem<Object>>((value) {
                          return DropdownMenuItem<int>(
                            value: value.typeId,
                            child: SizedBox(width: 150,child: Text(value.type)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.choiceDataChoiceType(value);
                        }
                      )
                    ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Lý do nghỉ:',
                      style: TextUtils().boldQuickSand.copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 6,
                    child: TextField(
                      controller: controller.controllerResult,
                      decoration: const InputDecoration(
                          hintText: 'Nhập lý do nghỉ')),
                  ),
                ]
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Từ ngày: ',
                      style: TextUtils().boldQuickSand.copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 6,
                    child: TextField(
                        readOnly: true,
                        controller: controller.fromDate,
                          onTap: () {
                        controller.selectDate(type: 1);
                        },
                    )
                  ),
                ]
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Đến ngày: ',
                      style: TextUtils().boldQuickSand.copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 6,
                    child: TextField(
                        readOnly: true,
                        controller: controller.toDate,
                        onTap: () {
                          controller.selectDate(type: 2);
                        },),
                  ),
                ]
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Số ngày nghỉ: ',
                      style: TextUtils().boldQuickSand.copyWith(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 6,
                    child: TextField(
                        keyboardType: TextInputType.number,
                        controller: controller.totalDate),
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
                        child: Text("Gửi thông tin"),
                      ),
                      onPressed: () => {
                        controller.postAnnuleave()
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