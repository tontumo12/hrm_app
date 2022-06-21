import 'package:hrm_app/config/api_provider.dart';
import 'package:hrm_app/models/comment/comment_contract.dart';
import 'package:hrm_app/models/comment/comment_model.dart';

class CommentRepository {
  ApiProvider provider = ApiProvider();

  Future<List<Comment>> getWorkComment(int work) async{
    final data = await provider.get('comment/task?workId=${work}', null);
    return List<Comment>.from(
          data!['response'].map((dynamic x) => Comment.fromMap(x)));
  }

  Future<bool> comment(CommentCOntact comment) async{
    try{
      await provider.post('comment/create', comment.toMap());
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }
}