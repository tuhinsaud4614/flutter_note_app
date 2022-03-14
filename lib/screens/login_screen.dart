import 'package:flutter/material.dart';
import 'package:myapp/utils/common.dart';
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
    return AuthContainer(
      title: "Note App",
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                  return "Invalid Email";
                }

                return null;
              },
              onChanged: (value) {
                _authData['email'] = value;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              child: const Text(
                "Login",
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
            TextButton(
              onPressed: () {},
              child: const Text("Forgotten password?"),
              style: TextButton.styleFrom(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(
                height: 1,
                color: Color(0xFFDADDE1),
              ),
            ),
            ElevatedButton(
              child: const Text(
                "Create New Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/register");
              },
            ),
          ],
        ),
      ),
    );
  }
}
