import 'package:flutter/material.dart';
import 'package:myapp/utils/breakpoints.dart';
import 'package:myapp/widgets/layout/auth_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final GlobalKey<FormState> _formKey;
  late final Map<String, String> _authData;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _authData = {
      'email': '',
      'password': '',
    };
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return AuthContainer(
      title: "Login",
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Enter your email here",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Invalid email";
                }

                return null;
              },
              onChanged: (value) {
                _authData['email'] = value;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              onChanged: (value) {
                _authData['password'] = value;
              },
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(
                hintText: "Enter your password here",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: const Text("Register"),
              onPressed: () async {
                _formKey.currentState!.save();
                debugPrint(_authData.toString());

                // final _email = _emailController.text;
                // final _password = _emailController.text;

                // final credential = await FirebaseAuth.instance
                //     .createUserWithEmailAndPassword(
                //         email: _email, password: _password);
                // debugPrint(credential as String);
              },
            )
          ],
        ),
      ),
    );
  }
}
