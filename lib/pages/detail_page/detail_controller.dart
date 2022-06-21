import 'dart:convert';

import 'package:hrm_app/base/base_controller.dart';
import 'package:hrm_app/models/comment/comment_contract.dart';
import 'package:hrm_app/models/comment/comment_model.dart';
import 'package:hrm_app/respository/comment_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailController extends BaseController {

  TextEditingController commentTextController = TextEditingController();

  CommentRepository commentRepository = CommentRepository();

  RxList<Comment> data = <Comment>[].obs;

  RxInt wworkIddataa = 0.obs;

  RxString nameScreen = "".obs;

  Future<int> getUserId() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data = sharedPreferences.getString("userInfo");
    print(data);
    return int.parse(jsonDecode(data!)['userid']);
  }

  Future<void> getListDataWorkTodo(int wworkId) async {
    try{
      wworkIddataa.value = wworkId;
      data.value = await commentRepository.getWorkComment(wworkId);
      data.refresh();
    }catch(err){
      print(err);
    }
  }

  Future<void> commentAdd() async {
    try{
      int userId = await getUserId();
      CommentCOntact comment = CommentCOntact(commentContent: commentTextController.text, userId: userId, commentWorkIdParent: 0, workId: wworkIddataa.value);
      bool check = await commentRepository.comment(comment);
      print(userId);
      if(!check){
        throw "die moe roi";
      }
      commentTextController.text = '';
      getListDataWorkTodo(wworkIddataa.value);
    } catch (err) {
      print(err);
    }
  }
}