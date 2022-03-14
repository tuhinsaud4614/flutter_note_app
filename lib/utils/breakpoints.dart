import 'package:flutter/widgets.dart';

class Breakpoints {
  static double sm = 600;
  static double md = 900;
  static double lg = 1200;
  static double xl = 1536;

  static Breakpoint fromConstraints(BoxConstraints constraints) {
    if (constraints.maxWidth <= sm) {
      return Breakpoint.sm;
    } else if (constraints.maxWidth <= md) {
      return Breakpoint.md;
    } else if (constraints.maxWidth <= lg) {
      return Breakpoint.lg;
    } else if (constraints.maxWidth <= xl) {
      return Breakpoint.xl;
    } else {
      return Breakpoint.xxl;
    }
  }

  static Breakpoint fromContext(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    if (_width <= sm) {
      return Breakpoint.sm;
    } else if (_width <= md) {
      return Breakpoint.md;
    } else if (_width <= lg) {
      return Breakpoint.lg;
    } else if (_width <= xl) {
      return Breakpoint.xl;
    } else {
      return Breakpoint.xxl;
    }
  }
}

enum Breakpoint {
  sm,
  md,
  lg,
  xl,
  xxl,
}
