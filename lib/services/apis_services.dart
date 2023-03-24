import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rest_api_with_bloc/res/app_urls.dart';

import '../models/user_model.dart';

class ApiServices {
  static Future<User?> getAPi({required int endPointUrl}) async {
    User? user;
    final http.Response response = await http.get(
      Uri.parse('${BaseUrls.userBaseUrl}/$endPointUrl'),
    );

    if (response.statusCode == 200) {
      user = User.fromJson(jsonDecode(response.body)["data"]);
      return user;
    } else {
      return user;
    }
  }
}
