import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              const  Text(
                  'Login',
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: Icon(Icons.visibility_off)),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      print(emailController.text);
                      print(passwordController.text);
                    },
                    color: Colors.blue,
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t Have Account Yet ?',
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
    );
  }

  void onSearchPressed() {
    print('Eslam');
  }
}
