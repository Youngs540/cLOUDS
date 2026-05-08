import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';
import 'package:clouds/pages/auth/widgets/auth_form.dart';

class AuthDesktop extends StatelessWidget {
  final bool isLoginMode;
  final VoidCallback onToggle;

  const AuthDesktop({
    super.key,
    required this.isLoginMode,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pdark,
      body: Row(
        children: [
          // Left: Hero Image
          Expanded(
            flex: 6,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/fam.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      AppTheme.pdark.withValues(alpha: 0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // Right: Auth Form
          Expanded(
            flex: 5,
            child: Container(
              color: AppTheme.pdark,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 450),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: AuthForm(
                      isLoginMode: isLoginMode,
                      onToggle: onToggle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
