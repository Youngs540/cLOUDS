import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clouds/core/providers/auth_provider.dart';
import 'package:clouds/core/themes/themes.dart';

class ProfileSmartphone extends StatelessWidget {
  const ProfileSmartphone({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.user;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const SizedBox(height: 40),

          // Avatar
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.newPurple, width: 2),
              image: const DecorationImage(
                image: AssetImage('assets/images/fam.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // User Info
          Text(
            user?.displayName ?? "Cloud User",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            user?.email ?? "no-email@clouds.com",
            style: const TextStyle(color: AppTheme.textSecondary),
          ),

          const Spacer(),

          // Logout Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => authProvider.signOut(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.redAccent,
                side: const BorderSide(color: Colors.redAccent),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "LOGOUT",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
