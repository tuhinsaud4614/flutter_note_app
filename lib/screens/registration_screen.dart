import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/firebase_options.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registration"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: _size.width * 0.1, vertical: _size.height * 0.1),
          width: MediaQuery.of(context).size.width * 0.8,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
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
                    // await Firebase.initializeApp(
                    //   options: DefaultFirebaseOptions.currentPlatform,
                    // );

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
        ),
      ),
    );
  }
}
