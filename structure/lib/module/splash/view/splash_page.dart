import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 1), () {
        if (mounted) {
          context.go('/login');
          // context.go('/mock/2');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
      },
      child: Container(
        color: Colors.white,
        child: Semantics(
          identifier: "SplashLogo",
          label: "SplashLogo",
          child: GestureDetector(
            onTap: () => context.go('/login'),
            // onTap: () => context.go('/mock/2'),
            child: Center(
              child: Image.asset('assets/images/flutter_logo.png', width: 100)
            ),
          ),
        ),
      ),
    );
  }
}