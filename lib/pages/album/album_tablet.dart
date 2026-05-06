import 'package:flutter/material.dart';
import 'package:clouds/core/themes/themes.dart';
import 'widgets/album_shared_widgets.dart';

class AlbumTablet extends StatelessWidget {
  const AlbumTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.pdark,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column (Fixed, smaller for tablet)
          SizedBox(
            width: 250,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      'assets/images/fam.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Odo",
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 32),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Kojo Rain",
                    style: TextStyle(
                      color: AppTheme.newPurple,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "HighLife • 2024 • 6 songs",
                    style: TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                  ),
                  const SizedBox(height: 24),
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
                          fontSize: 12,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.newPurple,
                        padding: const EdgeInsets.symmetric(vertical: 12),
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
              padding: const EdgeInsets.all(24.0),
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
                  AlbumSharedWidgets.buildTrackTable(context, hideTime: false, hideArtist: false),
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
