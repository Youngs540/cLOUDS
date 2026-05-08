import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';
import 'package:clouds/pages/auth/widgets/auth_form.dart';

class AuthMobileWeb extends StatelessWidget {
  final bool isLoginMode;
  final VoidCallback onToggle;

  const AuthMobileWeb({
    super.key,
    required this.isLoginMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.sdark,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(40.0),
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
