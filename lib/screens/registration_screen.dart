import 'package:flutter/material.dart';
import 'package:myapp/utils/common.dart';
import 'package:myapp/widgets/layout/auth_container.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, String> _authData = {
    'fullName': '',
    'email': '',
    'password': '',
    'confirmPassword': '',
  };

  @override
  Widget build(BuildContext context) {
    return AuthContainer(
      title: "Note App",
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter your full name here",
                fillColor: melonColor.withOpacity(0.5),
                filled: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              autocorrect: false,
              enableSuggestions: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Invalid full name.";
                }

                return null;
              },
              onChanged: (value) {
                _authData['fullName'] = value;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter your email here",
                fillColor: melonColor.withOpacity(0.5),
                filled: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.emailAddress,
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
              height: 12,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter your password here",
                fillColor: melonColor.withOpacity(0.5),
                filled: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Invalid password";
                }

                return null;
              },
              onChanged: (value) {
                _authData['password'] = value;
              },
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter your confirm password here",
                fillColor: melonColor.withOpacity(0.5),
                filled: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Invalid Email";
                }

                return null;
              },
              onChanged: (value) {
                _authData['confirmPassword'] = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              child: const Text(
                "Register",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                minimumSize: const Size.fromHeight(50),
              ),
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
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/login");
                  },
                  child: const Text("Login"),
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
