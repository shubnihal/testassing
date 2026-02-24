import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sparxtittest/logincontroller.dart';

class LoginScreen extends StatelessWidget {
  final Logincontroller _loginController = Get.put(Logincontroller());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: _loginController.formKey,
              child: Column(
                children: [
                  Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.person, color: Colors.white, size: 40),
                  ),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: _loginController.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email required";
                        }
                        // if (!GetUtils.isEmail(value)) {
                        //   return "Invalid email";
                        // }
                        return null;
                      },
                      decoration: InputDecoration(labelText: 'Username'),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: Obx(
                      () => TextFormField(
                        controller: _loginController.passwordController,
                        obscureText: _loginController.isTextObscured.value,
                        validator: (value) =>
                            value == null || value.isEmpty || value.length < 6
                            ? ' Password must be at least 6 characters'
                            : null,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: Obx(
                            () => IconButton(
                              icon: Icon(
                                _loginController.isTextObscured.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed:
                                  _loginController.togglePasswordVisibility,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _loginController.isLoading.value
                    ? null
                    : _loginController.login();
              },
              child: Obx(
                () => Text(
                  _loginController.isLoading.value ? 'Loading...' : 'Login',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
