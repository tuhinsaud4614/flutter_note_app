import 'package:flutter/material.dart';
import 'package:myapp/utils/breakpoints.dart';
import 'package:myapp/utils/common.dart';

class AuthWrapper extends StatelessWidget {
  final Widget child;
  final BoxConstraints boxConstraints;
  const AuthWrapper({
    Key? key,
    required this.boxConstraints,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: boxConstraints,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 1,
            spreadRadius: -1,
            color: Colors.black.withOpacity(0.2),
          ),
          BoxShadow(
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.1),
          ),
          BoxShadow(
            offset: const Offset(0, 8),
            blurRadius: 16,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.10),
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: Colors.white,
      ),
      child: child,
    );
  }
}

class AuthContainer extends StatelessWidget {
  final Widget child;
  final String title;
  const AuthContainer({Key? key, required this.title, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _breakpoint = Breakpoints.fromContext(context);
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              melonColor,
              mustardColor,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: AuthWrapper(
              boxConstraints: BoxConstraints(maxWidth: Breakpoints.sm - 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: secondaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: _breakpoint == Breakpoint.md ? 40 : 32,
                    ),
                  ),
                  const SizedBox(height: 32),
                  child,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
