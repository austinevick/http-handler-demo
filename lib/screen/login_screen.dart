import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_handler_demo/model/login.dart';
import 'package:http_handler_demo/provider/auth_provider.dart';
import 'package:http_handler_demo/widget/button_loader.dart';
import 'package:http_handler_demo/widget/custom_button.dart';
import 'package:http_handler_demo/widget/custom_textfield.dart';

import '../provider/loading_state_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final form = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  bool obscureText = true;
  bool isChecked = false;
  void get onIconToggle => setState(() => obscureText = !obscureText);
  IconData get icon => !obscureText ? Icons.visibility : Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: form,
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      CustomTextfield(
                          controller: email,
                          textCapitalization: TextCapitalization.none,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              value!.isEmpty ? 'Field is required' : null,
                          hintText: 'Enter your email'),
                      const SizedBox(height: 20),
                      CustomTextfield(
                        controller: password,
                        hintText: 'Password',
                        validator: (value) =>
                            value!.isEmpty ? 'Field is required' : null,
                        obscureText: obscureText,
                        suffixIcon: IconButton(
                            color: Colors.grey,
                            onPressed: () => onIconToggle,
                            icon: Icon(icon)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  StreamBuilder(
                      stream: ref.watch(loadingStateProvider).isLoadingStream,
                      initialData: false,
                      builder: (context, snapshot) => CustomButton(
                            color: Colors.black,
                            child: ButtonLoader(
                                isLoading: snapshot.data!, text: 'Login'),
                            onPressed: () {
                              if (form.currentState!.validate()) {
                                final model = LoginModel(
                                    email: email.text.trim(),
                                    password: password.text.trim());
                                ref.read(authProvider).login(model);
                              }
                            },
                          )),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
