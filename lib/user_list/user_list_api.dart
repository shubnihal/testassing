import 'package:get/get.dart';

class UserListApi extends GetConnect {
  final String url = "https://dummyjson.com/users";

  Future<Response> getUserList() async {
    try {
      return await get(url);
    } catch (e) {
      print(e);
      throw Exception('Failed to fetch user list');
    }
  }
}
