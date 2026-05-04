import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';

class TopSearchBar extends StatelessWidget {
  const TopSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 1. SEARCH BAR
        Expanded(
          child: SizedBox(
            height: 48,
            child: TextField(
              style: TextStyle(color: AppTheme.textPrimary),
              decoration: InputDecoration(
                hintText: "Search track, album...",
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                prefixIcon: Icon(Icons.search, size: 20),
              ),
            ),
          ),
        ),

        const SizedBox(width: 20),

        // 2. ACTION ICONS
        _topBarIcon(Icons.notifications_none_outlined),
        _topBarIcon(Icons.settings_outlined),

        const SizedBox(width: 8),

        // 3. MINI PROFILE CIRCLE
        const CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage(
            'assets/images/fam.jpg',
          ), // Replace with your asset
        ),
      ],
    );
  }

  Widget _topBarIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Icon(icon, color: AppTheme.textSecondary, size: 24),
    );
  }
}
