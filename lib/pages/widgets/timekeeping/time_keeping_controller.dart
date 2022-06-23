import 'package:hrm_app/base/base_controller.dart';
import 'package:hrm_app/pages/widgets/dialog/dialog_create_annuleave/create_annuleave_page.dart';

class TimeKeepingController extends BaseController{

  showAddChildAssetModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) => CreateAnnuleavePage(),
    );
  }
}