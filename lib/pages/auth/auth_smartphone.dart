import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';
import 'package:clouds/pages/auth/widgets/auth_form.dart';

class AuthSmartphone extends StatelessWidget {
  final bool isLoginMode;
  final VoidCallback onToggle;

  const AuthSmartphone({
    super.key,
    required this.isLoginMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.sdark,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
            child: AuthForm(
              isLoginMode: isLoginMode,
              onToggle: onToggle,
            ),
          ),
        ),
      ),
    );
  }
}
