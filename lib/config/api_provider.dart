import 'dart:convert';
import 'package:get/get.dart';
import 'package:hrm_app/routers/app_routes.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:hrm_app/config/custom_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  final _baseUrl = 'http://192.168.1.18:9001/';

  Future<String?> tokenCover() async{
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    return token;
  }

  Future<dynamic> get(String url, params) async {
    var responseJson;
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    try {
      var uri = _baseUrl + url;
      if (params != null) {
        uri = uri + "?" + Uri(queryParameters: params).query;
      }
      var headers = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      if(token != null && token != ""){
        headers['Authorization'] = 'Bearer ' + token;
      }

      final response = await http.get(Uri.parse(uri),headers: headers);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, data) async {
    var responseJson;
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    print(token);
    if(token != null && token != ""){
      headers['Authorization'] = 'Bearer ' + token;
    }
    try {
      final response = await http.post(Uri.parse(_baseUrl + url),
          body: json.encode(data),
          headers: headers);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(String url, data) async {
    var responseJson;
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    if(token != null){
      headers['Authorization'] = 'Bearer ' + token;
    }
    try {
      final response = await http.put(Uri.parse(_baseUrl + url),
          body: json.encode(data),
          headers: headers);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  void _logout() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
    Get.toNamed(AppRouter.routerLogin);
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        print('responseJson: ${responseJson.toString()}');
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        _logout();
        return;
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        var responseJson = json.decode(response.body);
        return responseJson;
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}

