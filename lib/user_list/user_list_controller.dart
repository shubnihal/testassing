import 'package:get/get.dart';
import 'package:sparxtittest/user_list/user_list_api.dart';
import 'package:sparxtittest/user_list/user_list_model.dart';

class UserListController extends GetxController {
  final UserListApi _userListApi = UserListApi();
  final userList = <UserProfile>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  Future<void> fetchUserList() async {
    try {
      isLoading.value = true;
      final reponse = await _userListApi.getUserList();
      if (reponse.statusCode == 200) {
        userList.value = (reponse.body['users'] as List)
            .map((json) => UserProfile.fromJson(json))
            .toList();
      }
    } catch (e) {
      print(e);
      errorMessage.value = 'Failed to fetch user list';
    } finally {
      isLoading.value = false;
    }
  }
}
