import 'package:flutter/material.dart';
import 'package:clouds/core/utils/layout_utils.dart';
import 'package:clouds/pages/auth/auth_smartphone.dart';
import 'package:clouds/pages/auth/auth_mobile_web.dart';
import 'package:clouds/pages/auth/auth_tablet.dart';
import 'package:clouds/pages/auth/auth_desktop.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool _isLoginMode = true;

  void _toggleMode() {
    setState(() {
      _isLoginMode = !_isLoginMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      smartphoneNative: (context) => AuthSmartphone(
        isLoginMode: _isLoginMode,
        onToggle: _toggleMode,
      ),
      mobileWeb: (context) => AuthMobileWeb(
        isLoginMode: _isLoginMode,
        onToggle: _toggleMode,
      ),
      tablet: (context) => AuthTablet(
        isLoginMode: _isLoginMode,
        onToggle: _toggleMode,
      ),
      desktop: (context) => AuthDesktop(
        isLoginMode: _isLoginMode,
        onToggle: _toggleMode,
      ),
    );
  }
}
