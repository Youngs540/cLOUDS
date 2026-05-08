import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';
import 'package:clouds/pages/auth/widgets/auth_form.dart';

class AuthTablet extends StatelessWidget {
  final bool isLoginMode;
  final VoidCallback onToggle;

  const AuthTablet({
    super.key,
    required this.isLoginMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pdark,
      body: Center(
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(48.0),
          decoration: BoxDecoration(
            color: AppTheme.sdark,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: SingleChildScrollView(
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
