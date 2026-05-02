import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart'; // Ensure this path is correct

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  // Track which menu item is active
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: AppTheme.pdark, // #181818
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BRANDING SECTION
          Text("cLOUDS", style: Theme.of(context).textTheme.displayLarge),
           Text(
            "Official Platform",
            style: Theme.of(context).textTheme.bodyMedium
          ),
          const SizedBox(height: 60),

          // NAVIGATION ITEMS
          _buildNavSection(),

          const Spacer(),

          // USER PROFILE CARD
          _buildProfileCard(),
        ],
      ),
    );
  }

  // Helper to build the list of navigation items
  Widget _buildNavSection() {
    return Column(
      children: [
        _navItem(0, Icons.home_filled, "Home"),
        _navItem(1, Icons.music_note_outlined, "Music"),
        _navItem(2, Icons.info_outline, "About Kojo Rain"),
        _navItem(3, Icons.local_mall_outlined, "Merch"),
      ],
    );
  }

  // Individual Nav Item Logic
  Widget _navItem(int index, IconData icon, String label) {
    bool isActive = _selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
          // Add your navigation logic here (e.g., updating the main content)
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            // subtle highlight for the active item
            color: isActive ? AppTheme.selected : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 22,
                color: isActive ? AppTheme.newPurple : AppTheme.textSecondary,
              ),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                  color: isActive
                      ? AppTheme.textPrimary
                      : AppTheme.textSecondary,
                  fontSize: 15,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Bottom Profile Card
  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.sdark, // #212121
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 18,
            backgroundColor: AppTheme.selected,
            child: Icon(Icons.person, color: Colors.white, size: 20),
            // Replace with: backgroundImage: AssetImage('assets/user.png'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  "User Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "VERIFIED FAN",
                  style: TextStyle(
                    color: AppTheme.newPurple,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
