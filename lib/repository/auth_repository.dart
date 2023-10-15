import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_handler_demo/model/login.dart';

class AuthRepository {
  static final client = Client();
  static String baseUrl = 'http://127.0.0.1:3000/';

  static Future<ResponseModel> login(LoginModel model) async {
    var response = await client
        .post(Uri.parse("${baseUrl}api/user/login"), body: model.toMap())
        .timeout(const Duration(seconds: 60));
    final data = jsonDecode(response.body);
    return ResponseModel.fromJson(data);
  }
}
