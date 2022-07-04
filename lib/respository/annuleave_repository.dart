import 'package:hrm_app/config/api_provider.dart';
import 'package:hrm_app/models/annuleave/annuleave_model.dart';

class AnnuleaveRepository {
  ApiProvider provider = ApiProvider();

  Future<List<AnnuleaveModel>> getAnnuleave(int userId) async{
    var parmas = {};
    final data = await provider.get('annuleave/get_user?userId=${userId}', null);
    return List<AnnuleaveModel>.from(
          data!['response'].map((dynamic x) => AnnuleaveModel.fromMap(x)));
  }

  Future<String> portAnnuleve(AnnuleaveModel body) async{
    final data = await provider.post("annuleave/create", body.toJson());
    return data!['response'];
  }
}