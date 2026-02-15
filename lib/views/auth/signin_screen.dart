import 'package:flutter/material.dart';
import 'package:furniture_app/core/provider/password_provider.dart';
import 'package:furniture_app/core/routes/app_routes.dart';
import 'package:furniture_app/views/auth/signup_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Sign In")),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.only(top: 60, left: 24, right: 24, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Sign In',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 40),
          // Form
          Form(
            child: Column(
              children: [
                // email
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'sample@gmail.com',

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),

                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.red),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),

                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                /// password
                Consumer<PasswordProvider>(
                  builder: (context, provider, child) {
                    return TextFormField(
                      autocorrect: false,
                      obscureText: provider.isObscure,
                      decoration: InputDecoration(
                        labelText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Colors.blue),
                        ),

                        suffixIcon: IconButton(
                          icon: Icon(
                            provider.isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: provider.toggle,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // forgot password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                RouteView.forgotPassword.go();
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 12),
              ),
            ),
          ),
          SizedBox(height: 40),
          // button login
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(52),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              // backgroundColor: AppData.primaryColor,
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              // Login action
              // print('Login');
              RouteView.home.go(clearAll: true);
            },
            child: const Text(
              'Log In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 30),
          // Guest login
          Align(
            alignment: AlignmentDirectional(0, -1),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                // print('Guest Login');
                RouteView.home.go(clearAll: true);
              },
              child: Text(
                'Guest Mode',
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 17,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Spacer(),

          // sign up button
          Align(
            alignment: AlignmentDirectional(0, -1),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                RouteView.home.go(clearAll: false);
              },
              child: Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(SignupScreen()),
                    child: Text(
                      'Sign Up',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
