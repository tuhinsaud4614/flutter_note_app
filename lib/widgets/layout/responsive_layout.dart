import 'package:flutter/material.dart';
import 'package:myapp/utils/breakpoints.dart';

class ResponsiveLayoutWithConstraints extends StatelessWidget {
  const ResponsiveLayoutWithConstraints({
    Key? key,
    required this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  }) : super(key: key);
  final Widget sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
  final Widget? xxl;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      Breakpoint br = Breakpoints.fromConstraints(constraints);

      switch (br) {
        case Breakpoint.sm:
          return sm;
        case Breakpoint.md:
          return md ?? sm;
        case Breakpoint.lg:
          return lg ?? md ?? sm;
        case Breakpoint.xl:
          return xl ?? lg ?? md ?? sm;
        case Breakpoint.xxl:
          return xxl ?? xl ?? lg ?? md ?? sm;
        default:
          return sm;
      }
    });
  }
}

class ResponsiveLayoutWithContext extends StatelessWidget {
  const ResponsiveLayoutWithContext({
    Key? key,
    required this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  }) : super(key: key);
  final Widget sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
  final Widget? xxl;

  @override
  Widget build(BuildContext context) {
    Breakpoint br = Breakpoints.fromContext(context);
    return LayoutBuilder(builder: (context, constraints) {
      switch (br) {
        case Breakpoint.sm:
          return sm;
        case Breakpoint.md:
          return md ?? sm;
        case Breakpoint.lg:
          return lg ?? md ?? sm;
        case Breakpoint.xl:
          return xl ?? lg ?? md ?? sm;
        case Breakpoint.xxl:
          return xxl ?? xl ?? lg ?? md ?? sm;
        default:
          return sm;
      }
    });
  }
}
