import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../utils/constant/service_constants.dart';

class LoginService {


  //TODO: servisten gelen token döndürülecek
  Future<Map<String,dynamic>?> getLogin(String email,String password) async {
    final uri = Uri.parse('${ServiceConstant.baseUrl}/users/sing-in');

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );
       if (response.statusCode == 200) {
        final result = json.decode(response.body) as Map<String,dynamic>;
        return result['session'];
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
