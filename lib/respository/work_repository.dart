import 'package:hrm_app/config/api_provider.dart';
import 'package:hrm_app/models/work/work_model.dart';

class WorkRepository {
  ApiProvider provider = ApiProvider();

  Future<List<Work>> getWorkDepartment(int department) async{
    var parmas = {};
    final data = await provider.get('work/department?departmentId=${department}', parmas);
    return List<Work>.from(
          data!['response'].map((dynamic x) => Work.fromMap(x)));

  }

  Future<List<Work>> getWorkAssign(int userId) async{
    var parmas = {};
    final data = await provider.get('work/user_assign?userId=${userId}', null);
    return List<Work>.from(
          data!['response'].map((dynamic x) => Work.fromMap(x)));

  }

  Future<List<Work>> getWorkReview(int userId) async{
    var parmas = {};
    final data = await provider.get('work/user_review?userId=${userId}', null);
    return List<Work>.from(
          data!['response'].map((dynamic x) => Work.fromMap(x)));

  }
}