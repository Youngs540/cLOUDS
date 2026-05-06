import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';
import 'widgets/album_shared_widgets.dart';

class AlbumDesktop extends StatelessWidget {
  const AlbumDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pdark,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column (Fixed)
          SizedBox(
            width: 350,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      'assets/images/fam.jpg',
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "Odo",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 48),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Kojo Rain",
                    style: TextStyle(
                      color: AppTheme.newPurple,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "HighLife • 2024 • 6 songs",
                    style: TextStyle(color: AppTheme.textSecondary),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shuffle, color: Colors.black),
                      label: const Text(
                        "SHUFFLE PLAY",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.newPurple,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Right Column (Scrollable Tracklist)
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tracks",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AlbumSharedWidgets.buildTrackTable(context),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
