import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style:
                        TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  defaultTextField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      text: 'Email',
                      iconData: Icons.email,
                      validate: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Email Address must be not empty';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 30.0,
                  ),
                  defaultTextField(
                      controller: passwordController,
                      type: TextInputType.number,
                      text: 'Password',
                      sufficIcon: Icons.remove_red_eye,
                      iconData: Icons.lock,
                      validate: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Password Must be not empty';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      width: double.infinity,
                      background: Colors.blue,
                      btnText: 'Login',
                      function: () {
                        if (formKey.currentState!.validate()) {
                          print("test");
                        }
                      }),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t Have Account Yet ?',
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Sign Up',
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onSearchPressed() {
    print('Eslam');
  }
}
