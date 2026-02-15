import 'package:flutter/material.dart';
import 'package:furniture_app/core/provider/password_provider.dart';
import 'package:furniture_app/core/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Reset Password")),
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
          Text('Create your new password to log in'),
          SizedBox(height: 20),
          // Form
          Form(
            child: Column(
              children: [
                /// new password
                Consumer<PasswordProvider>(
                  builder: (context, provider, child) {
                    return TextFormField(
                      autocorrect: false,
                      obscureText: provider.isObscure,
                      decoration: InputDecoration(
                        labelText: 'new password',
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
                SizedBox(height: 30),

                /// confirm password
                Consumer<PasswordProvider>(
                  builder: (context, provider, child) {
                    return TextFormField(
                      autocorrect: false,
                      obscureText: provider.isObscure,
                      decoration: InputDecoration(
                        labelText: 'confirm password',
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
          SizedBox(height: 30),
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
              'Reset Password',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
