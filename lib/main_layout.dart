import 'package:clouds/pages/profile/profile_view.dart';
import 'package:clouds/pages/home/home_view.dart';
import 'package:clouds/pages/music/music_view.dart';
import 'package:clouds/pages/studio/studio_view.dart';
import 'package:clouds/core/utils/layout_utils.dart';
import 'package:clouds/shared/mob_playerbar.dart';
import 'package:flutter/material.dart';
import 'package:clouds/shared/sidebar.dart';
import 'package:clouds/shared/player_bar.dart';
import 'package:clouds/core/themes/themes.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const MusicPage(),
    const StudioPage(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      desktop: (context) => _buildDesktopLayout(context),
      tablet: (context) => _buildDesktopLayout(context),
      mobileWeb: (context) => _buildMobileLayout(context),
      smartphoneNative: (context) => _buildMobileLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  SideBar(
                    initialIndex: _currentIndex,
                    onDestinationSelected: (index) {
                      setState(() => _currentIndex = index);
                    },
                  ),
                  Expanded(
                    child: IndexedStack(index: _currentIndex, children: _pages),
                  ),
                ],
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: MediaQuery.of(context).size.height > 150
                  ? const SizedBox(
                      height: 90,
                      child: PlayerBar(key: ValueKey('player')),
                    )
                  : const SizedBox.shrink(key: ValueKey('empty')),
            ),
          ],
        ),
      ),
      floatingActionButton: _currentIndex == 2 ? _buildDesktopFab() : null,
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: IndexedStack(index: _currentIndex, children: _pages),
            ),
            // We still show player bar in mobile layout above BottomNavigationBar, or we can use DraggableScrollableSheet later inside the page.
            // But for now, we keep the player bar globally if it's the app shell.
            // We'll refine this when doing home_smartphone.dart
            MediaQuery.of(context).size.height > 150
                ? const SizedBox(
                    height: 90,
                    child: MiniPlayerBar(key: ValueKey('mini_player')),
                  )
                : const SizedBox.shrink(key: ValueKey('empty')),
          ],
        ),
      ),
      bottomNavigationBar: MediaQuery.of(context).size.height > 150
          ? BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              backgroundColor: AppTheme.sdark,
              selectedItemColor: AppTheme.newPurple,
              unselectedItemColor: AppTheme.textSecondary,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.music_note),
                  label: 'Music',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'Studio'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              ],
            )
          : const SizedBox.shrink(),
      floatingActionButton: _currentIndex == 2 ? _buildMobileFab() : null,
    );
  }

  Widget _buildDesktopFab() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: FloatingActionButton.extended(
        onPressed: () => _showUploadBottomSheet(context),
        backgroundColor: AppTheme.newPurple,
        icon: const Icon(Icons.add, color: Colors.black),
        label: const Text(
          "NEW UPLOAD",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildMobileFab() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: FloatingActionButton(
        onPressed: () => _showUploadBottomSheet(context),
        backgroundColor: AppTheme.newPurple,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  void _showUploadBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: AppTheme.pdark,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload Track",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 40),

              _buildFieldLabel("TRACK TITLE"),
              const TextField(
                decoration: InputDecoration(hintText: "e.g. Odo"),
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel("GENRE"),
                        const TextField(
                          decoration: InputDecoration(hintText: "HighLife"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFieldLabel("PRICE (\$)"),
                        const TextField(
                          decoration: InputDecoration(hintText: "1.29"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              _buildUploadPlaceholder("Audio File", Icons.audiotrack),
              const SizedBox(height: 16),
              _buildUploadPlaceholder("Cover Art", Icons.image),

              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.newPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "PUBLISH TO CLOUDS",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
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

  Widget _buildFieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildUploadPlaceholder(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.sdark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.newPurple),
          const SizedBox(width: 16),
          Text("Select $label", style: const TextStyle(color: Colors.white)),
          const Spacer(),
          const Icon(
            Icons.cloud_upload_outlined,
            color: AppTheme.textSecondary,
          ),
        ],
      ),
    );
  }
}
