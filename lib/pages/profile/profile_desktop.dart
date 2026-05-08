import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clouds/core/providers/auth_provider.dart';
import 'package:clouds/core/themes/themes.dart';
import 'package:clouds/pages/profile/widgets/stat_item.dart';

class ProfileDesktop extends StatelessWidget {
  const ProfileDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.user;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            children: [
              // Profile Header Card
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: AppTheme.sdark,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.05),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.newPurple, width: 3),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/fam.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      user?.displayName ?? "Cloud User",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      user?.email ?? "no-email@clouds.com",
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // Logout Action
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => authProvider.signOut(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.newPurple,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "LOGOUT",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
