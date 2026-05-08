import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clouds/core/providers/auth_provider.dart';
import 'package:clouds/core/themes/themes.dart';
import 'package:clouds/main_layout.dart';

class AuthForm extends StatefulWidget {
  final bool isLoginMode;
  final VoidCallback onToggle;

  const AuthForm({
    super.key,
    required this.isLoginMode,
    required this.onToggle,
  });

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = context.read<AuthProvider>();
    bool success = false;

    if (widget.isLoginMode) {
      success = await authProvider.signInWithEmail(
        _emailController.text.trim(),
        _passwordController.text,
      );
    } else {
      success = await authProvider.registerWithEmail(
        _emailController.text.trim(),
        _passwordController.text,
        _nameController.text.trim(),
      );
    }

    if (success && mounted) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const MainLayout()));
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            authProvider.errorMessage ??
                'Authentication Failed. Please try again.',
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.isLoginMode ? 'Welcome Back' : 'Create Account',
            style: Theme.of(
              context,
            ).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            widget.isLoginMode
                ? 'Login to access your clouds'
                : 'Join our community today',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: widget.isLoginMode
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: 'Full Name',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      validator: (val) =>
                          val == null || val.isEmpty ? 'Enter your name' : null,
                    ),
                  ),
          ),

          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: 'Email Address',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (val) => val == null || !val.contains('@')
                ? 'Enter a valid email'
                : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
            ),
            obscureText: true,
            validator: (val) =>
                val == null || val.length < 6 ? 'Password too short' : null,
          ),

          const SizedBox(height: 32),

          ElevatedButton(
            onPressed: authProvider.isLoading ? null : _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.newPurple,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: authProvider.isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.black,
                    ),
                  )
                : Text(
                    widget.isLoginMode ? 'LOG IN' : 'CREATE ACCOUNT',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
          ),

          const SizedBox(height: 24),

          TextButton(
            onPressed: widget.onToggle,
            child: Text(
              widget.isLoginMode
                  ? "Don't have an account? Sign Up"
                  : "Already have an account? Login",
              style: const TextStyle(color: AppTheme.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}
