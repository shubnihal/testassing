import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sparxtittest/apis.dart';
import 'package:sparxtittest/storage_services.dart';

class Logincontroller extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final successMessage = ''.obs;
  final isTextObscured = true.obs;

  void togglePasswordVisibility() {
    isTextObscured.value = !isTextObscured.value;
  }

  var isLoading = false.obs;

  final Apis _apis = Apis();
  final formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;
    try {
      isLoading.value = true;
      final response = await _apis.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        Get.snackbar(
          'Success',
          'Login successful',
          snackPosition: SnackPosition.TOP,
        );
        final refreshToken = response.body['refreshToken'] as String;
        final accessToken = response.body['accessToken'] as String;
        final expiryIn = response.body['expiresIn'] as String;

        await StorageServices.saveAccessToken(
          accessToken,
          refreshToken,
          expiryIn,
        );
        // Handle successful login, e.g., save tokens, navigate to home screen
        print(StorageServices.accessTokenValue);
        print('Login successful: ${response.body}');
      } else {
        // Handle login failure, e.g., show error message
        print('Login failed: ${response.statusText}');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to login');
    } finally {
      isLoading.value = false;
    }
    // Simulate a login delay
  }
}
