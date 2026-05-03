import 'package:clouds/pages/home.dart';
import 'package:clouds/pages/music.dart';
import 'package:clouds/pages/studio.dart';
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

  // These should now be the "Content" versions of your pages
  final List<Widget> _pages = [
    const HomeScreen(), 
    const MusicPage(),
    const StudioPage(),
    const Center(child: Text('about'))
  ];

  // lib/main_layout.dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Row(
      children: [
        SideBar(
          initialIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        Expanded(
          child: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
        ),
      ],
    ),
    // Show button only on Studio tab (index 2)
    floatingActionButton: _currentIndex == 2 
      ? FloatingActionButton.extended(
          onPressed: () => _showUploadBottomSheet(context),
          backgroundColor: AppTheme.newPurple,
          icon: const Icon(Icons.add, color: Colors.black),
          label: const Text(
            "NEW UPLOAD", 
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      : null,
    bottomNavigationBar: const PlayerBar(),
  );
}
}

void _showUploadBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: AppTheme.pdark, // #181818
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: const EdgeInsets.all(32),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Upload Track", style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 40),
            
            _buildFieldLabel("TRACK TITLE"),
            const TextField(decoration: InputDecoration(hintText: "e.g. Odo")),
            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFieldLabel("GENRE"),
                      const TextField(decoration: InputDecoration(hintText: "HighLife")),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFieldLabel("PRICE (\$)"),
                      const TextField(decoration: InputDecoration(hintText: "1.29")),
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
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text(
                  "PUBLISH TO CLOUDS", 
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
      style: const TextStyle(color: AppTheme.textSecondary, fontSize: 11, fontWeight: FontWeight.bold),
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
        const Icon(Icons.cloud_upload_outlined, color: AppTheme.textSecondary),
      ],
    ),
  );
}