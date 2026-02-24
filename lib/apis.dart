import 'package:get/get.dart';

class Apis extends GetConnect {
  final String url = "https://dummyjson.com/auth/login";

  Future<Response> login(String username, String password) async {
    try {
      return await post(
        url,
        {"username": username, "password": password},
        headers: {"Content-Type": "application/json"},
      );
    } catch (e) {
      print(e);
      throw Exception('Failed to login');
    }
  }
}
