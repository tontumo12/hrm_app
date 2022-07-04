import 'package:hrm_app/config/api_provider.dart';
import 'package:hrm_app/models/timekeeping/timekeeping_model.dart';

class TimeKeepingRepository {
  ApiProvider provider = ApiProvider();

  Future<List<TimeKeepingModel>> getAnnuleave(int userId) async{
    var parmas = {};
    final data = await provider.get('timeKeeping/get_user?userId=${userId}', null);
    return List<TimeKeepingModel>.from(
          data!['response'].map((dynamic x) => TimeKeepingModel.fromMap(x)));
  }

  Future<String> portAnnuleve(TimeKeepingModel body) async{
    final data = await provider.post("timeKeeping/create", body.toJson());
    return data!['response'];
  }
}