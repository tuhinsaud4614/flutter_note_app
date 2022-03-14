import 'package:flutter/material.dart';

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
      // appBar: AppBar(
      //   title: const Text("Registration"),
      //   centerTitle: true,
      // ),
      body: Container(
        height: _size.height,
        width: _size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xFFFFBFB7),
              Color(0xFFFFD447),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(
                horizontal: _size.width * 0.1, vertical: _size.height * 0.1),
            width: MediaQuery.of(context).size.width * 0.8,
            color: Colors.white,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    "Login",
                  ),
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
          ),
        ),
      ),
    );
  }
}
